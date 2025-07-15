<?php

namespace App\Http\Controllers;

use App\Models\Buku;
use App\Models\User;
use App\Models\Profile;
use App\Models\Peminjaman;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;

class PeminjamanController extends Controller
{
    // Menampilkan daftar semua peminjaman dan riwayat user
    public function index()
    {
        $iduser = Auth::id();
        $profile = Profile::where('users_id', $iduser)->first();
        $peminjam = Peminjaman::with(['user', 'buku'])->orderBy('updated_at', 'desc')->get();
        $pinjamanUser = Peminjaman::where('users_id', $iduser)->get();

        return view('peminjaman.tampil', [
            'profile' => $profile,
            'peminjam' => $peminjam,
            'pinjamanUser' => $pinjamanUser
        ]);
    }

    // Menampilkan form tambah peminjaman
    public function create($id = null)
    {
        $iduser = Auth::id();
        $profile = Profile::where('users_id', $iduser)->first();
        $buku = Buku::all();
        $buku_terpilih = $id ? Buku::find($id) : null;
        $user = User::all();

        if (Auth::user()->isAdmin == 1) {
            $peminjam = Profile::where('users_id', '>', '1')->get();
        } else {
            $peminjam = $profile;
        }

        return view('peminjaman.tambah', [
            'profile' => $profile,
            'users' => $user,
            'buku' => $buku,
            'buku_terpilih' => $buku_terpilih,
            'peminjam' => $peminjam
        ]);
    }

    // Menyimpan data peminjaman baru
    public function store(Request $request)
    {
        $request->validate(
            [
                'users_id' => 'required',
                'buku_id' => 'required'
            ],
            [
                'users_id.required' => 'Harap Masukan Nama Peminjam',
                'buku_id.required' => 'Masukan Buku yang akan dipinjam'
            ]
        );

        $request['tanggal_pinjam'] = Carbon::now()->toDateString();
        $request['tanggal_wajib_kembali'] = Carbon::now()->addDay(7)->toDateString();

        $count = Peminjaman::where('users_id', $request->users_id)
            ->whereNull('tanggal_pengembalian')
            ->count();

        if ($count >= 3) {
            Alert::warning('Gagal', 'User telah mencapai limit untuk meminjam buku');
            return redirect('/peminjaman/create');
        }

        try {
            DB::beginTransaction();

            // Simpan peminjaman
            Peminjaman::create($request->all());

            // Kurangi stok buku
            $buku = Buku::findOrFail($request->buku_id);
            if ($buku->stok > 0) {
                $buku->stok -= 1;
                if ($buku->stok == 0) {
                    $buku->status = 'Dipinjam';
                }
                $buku->save();
            } else {
                DB::rollback();
                Alert::warning('Gagal', 'Stok buku habis, tidak bisa dipinjam.');
                return redirect('/peminjaman/create');
            }

            DB::commit();
            Alert::success('Berhasil', 'Berhasil Meminjam Buku');
            return redirect('/peminjaman');

        } catch (\Throwable $th) {
            DB::rollback();
            Alert::error('Error', 'Terjadi kesalahan saat meminjam buku.');
            return redirect('/peminjaman/create');
        }
    }

    // Fungsi lainnya (show, edit, update, destroy) dapat ditambahkan sesuai kebutuhan
}

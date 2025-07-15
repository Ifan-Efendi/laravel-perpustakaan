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

class PengembalianController extends Controller
{
    public function index()
    {
        $iduser = Auth::id();
        $profile = Profile::where('users_id', $iduser)->first();
        $user = User::all();
        $peminjam = Profile::where('users_id', '>', '1')->get();
        $buku = Buku::all();

        return view('pengembalian.pengembalian', [
            'profile' => $profile,
            'users' => $user,
            'peminjam' => $peminjam,
            'buku' => $buku
        ]);
    }

    public function pengembalian(Request $request)
    {
        $request->validate([
            'users_id' => 'required',
            'buku_id' => 'required'
        ]);

        $pinjaman = Peminjaman::where('users_id', $request->users_id)
            ->where('buku_id', $request->buku_id)
            ->whereNull('tanggal_pengembalian');

        $dataPinjaman = $pinjaman->first();
        $count = $pinjaman->count();

        if ($count === 1 && $dataPinjaman) {
            try {
                DB::beginTransaction();

                // Update tanggal pengembalian
                $dataPinjaman->tanggal_pengembalian = Carbon::now()->toDateString();
                $dataPinjaman->save();

                // Update stok dan status buku
                $buku = Buku::findOrFail($request->buku_id);
                $buku->stok += 1;

                if ($buku->stok > 0) {
                    $buku->status = 'Tersedia';
                }

                $buku->save();

                DB::commit();
                Alert::success('Berhasil', 'Buku berhasil dikembalikan');
                return redirect('/peminjaman');
            } catch (\Throwable $th) {
                DB::rollback();
                Alert::error('Error', 'Terjadi kesalahan saat mengembalikan buku');
                return redirect('/pengembalian');
            }
        } else {
            Alert::warning('Gagal', 'Data peminjaman tidak ditemukan atau sudah dikembalikan');
            return redirect('/pengembalian');
        }
    }
}

<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BukuController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\AnggotaController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\KategoriController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\CetakLaporanController;
use App\Http\Controllers\PengembalianController;
use App\Http\Controllers\PeminjamanController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::middleware(['auth'])->group(function () {
    // Route Home
    Route::get('/home', [HomeController::class, 'index'])->name('home');
    
    // Route Buku
    Route::resource('buku', BukuController::class)->except(['show']);
    Route::get('/buku/{id}', [BukuController::class, 'show'])->name('buku.show');
    
    // Route Kategori
    Route::resource('kategori', KategoriController::class);
    
    // Route Anggota
    Route::resource('anggota', AnggotaController::class);
    
    // Route Profile
    Route::resource('profile', ProfileController::class)->only(['index', 'edit', 'update']);
    
    // Route Peminjaman
    Route::prefix('peminjaman')->group(function () {
        Route::get('/', [PeminjamanController::class, 'index'])->name('peminjaman.index');
        Route::get('/create', [PeminjamanController::class, 'create'])->name('peminjaman.create');
        Route::get('/create/{id}', [PeminjamanController::class, 'create'])->name('peminjaman.create.with.book');
        Route::post('/', [PeminjamanController::class, 'store'])->name('peminjaman.store');
    });
    
    // Route Pengembalian
    Route::prefix('pengembalian')->group(function () {
        Route::get('/', [PengembalianController::class, 'index'])->name('pengembalian.index');
        Route::post('/', [PengembalianController::class, 'pengembalian'])->name('pengembalian.submit');
    });
    
    // Route Laporan
    Route::get('/cetaklaporan', CetakLaporanController::class)->name('cetak.laporan');
});
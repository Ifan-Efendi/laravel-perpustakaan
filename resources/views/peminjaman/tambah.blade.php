@extends('layouts.master')

@section('sidebar')
    @include('part.sidebar')
@endsection

@section('topbar')
    @include('part.topbar')
@endsection

@section('judul')
    <h1 class="text-primary">Form Pinjam Buku</h1>
@endsection

@section('content')
    <div class="card">
        <div class="card-body">
            <form action="/peminjaman" method="POST">
                @csrf

                <!-- Nama Peminjam -->
                <div class="form-group">
                    <label for="nama" class="text-primary font-weight-bold">Nama Peminjam</label>

                    @if(Auth::user()->isAdmin == 1)
                        <select name="users_id" class="form-control" required>
                            <option value="">Pilih Peminjam</option>
                            @foreach ($peminjam as $item)
                                <option value="{{ $item->users_id }}">
                                    {{ $item->user->name }} ({{ $item->npm }})
                                </option>
                            @endforeach
                        </select>
                    @else
                        <input type="hidden" name="users_id" value="{{ $peminjam->users_id }}">
                        <input class="form-control" value="{{ $peminjam->user->name }} ({{ $peminjam->npm }})" readonly>
                    @endif

                    @error('users_id')
                        <div class="alert alert-danger mt-2">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Buku yang Dipinjam -->
                <div class="form-group mt-3">
                    <label for="buku_id" class="text-primary font-weight-bold">Buku yang akan dipinjam</label>
                    <select name="buku_id" class="form-control" required>
                        <option value="">Pilih Buku</option>
                        @foreach ($buku as $item)
                            <option value="{{ $item->id }}"
                                @if(isset($buku_terpilih) && $item->id == $buku_terpilih->id) selected @endif>
                                {{ $item->judul }} ({{ $item->kode_buku }}) - Stok: {{ $item->stok }}
                            </option>
                        @endforeach
                    </select>

                    @error('buku_id')
                        <div class="alert alert-danger mt-2">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Tombol Submit -->
                <div class="d-flex justify-content-end mt-4">
                    <a href="/peminjaman" class="btn btn-danger">Kembali</a>
                    <button type="submit" class="btn btn-primary mx-1 px-4">Submit</button>
                </div>
            </form>
        </div>
    </div>
@endsection

@extends('layouts.master')

@section('sidebar')
    @include('part.sidebar')
@endsection

@section('topbar')
    @include('part.topbar')
@endsection

@section('judul')
    <h1 class="text-primary">Form Pengembalian Buku</h1>
@endsection

@section('content')
    <div class="card">
        <div class="card-body">
            <form action="/pengembalian" method="POST">
                @csrf

                <!-- Nama Peminjam -->
                <div class="form-group">
                    <label for="users_id" class="text-primary font-weight-bold">Nama Peminjam</label>
                    <select name="users_id" class="form-control" required>
                        <option value="">Pilih Peminjam</option>
                        @foreach ($peminjam as $item)
                            <option value="{{ $item->users_id }}">
                                {{ $item->user->name }} ({{ $item->npm }})
                            </option>
                        @endforeach
                    </select>

                    @error('users_id')
                        <div class="alert alert-danger mt-2">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Buku yang Dikembalikan -->
                <div class="form-group mt-3">
                    <label for="buku_id" class="text-primary font-weight-bold">Buku yang dikembalikan</label>
                    <select name="buku_id" class="form-control" required>
                        <option value="">Pilih Buku</option>
                        @foreach ($buku as $item)
                            <option value="{{ $item->id }}">
                                {{ $item->judul }} ({{ $item->kode_buku }})
                            </option>
                        @endforeach
                    </select>

                    @error('buku_id')
                        <div class="alert alert-danger mt-2">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Tombol Aksi -->
                <div class="d-flex justify-content-end mt-4">
                    <a href="/peminjaman" class="btn btn-danger mr-2">Kembali</a>
                    <button type="submit" class="btn btn-primary px-4">Submit</button>
                </div>
            </form>
        </div>
    </div>
@endsection

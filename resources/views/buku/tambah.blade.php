@extends('layouts.master')

@section('sidebar')
    @include('part.sidebar')
@endsection

@section('topbar')
    @include('part.topbar')
@endsection

@section('judul')
    <h1 class="text-primary">Tambah Buku</h1>
@endsection

@push('styles')
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
@endpush

@section('content')
    <div class="card mb-4">
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary">Form Tambah Buku</h6>
        </div>
        <div class="card-body">
            <form action="{{ route('buku.store') }}" method="POST" enctype="multipart/form-data">
                @csrf

                <div class="form-group mb-3">
                    <label for="judul" class="text-primary font-weight-bold">Judul Buku</label>
                    <input type="text" name="judul" class="form-control" value="{{ old('judul') }}" required>
                </div>
                @error('judul')
                    <div class="alert alert-danger">{{ $message }}</div>
                @enderror

                <div class="form-group mb-3">
                    <label for="kode_buku" class="text-primary font-weight-bold">Kode Buku</label>
                    <input type="text" name="kode_buku" class="form-control" value="{{ old('kode_buku') }}">
                </div>
                @error('kode_buku')
                    <div class="alert alert-danger">{{ $message }}</div>
                @enderror

                <div class="form-group mb-3">
                    <label for="kategori" class="text-primary font-weight-bold">Kategori</label>
                    <select class="form-control" name="kategori_buku[]" id="multiselect" multiple="multiple">
                        @forelse ($kategori as $item)
                            <option value="{{ $item->id }}">{{ $item->nama }}</option>
                        @empty
                            <option disabled>Tidak ada kategori</option>
                        @endforelse
                    </select>
                </div>
                @error('kategori')
                    <div class="alert alert-danger">{{ $message }}</div>
                @enderror

                <div class="form-group mb-3">
                    <label for="pengarang" class="text-primary font-weight-bold">Pengarang</label>
                    <input type="text" name="pengarang" class="form-control" value="{{ old('pengarang') }}">
                </div>
                @error('pengarang')
                    <div class="alert alert-danger">{{ $message }}</div>
                @enderror

                <div class="form-group mb-3">
                    <label for="penerbit" class="text-primary font-weight-bold">Penerbit</label>
                    <input type="text" name="penerbit" class="form-control" value="{{ old('penerbit') }}">
                </div>
                @error('penerbit')
                    <div class="alert alert-danger">{{ $message }}</div>
                @enderror

                <div class="form-group mb-3">
                    <label for="tahun_terbit" class="text-primary font-weight-bold">Tahun Terbit</label>
                    <input type="text" name="tahun_terbit" class="form-control" value="{{ old('tahun_terbit') }}">
                </div>
                @error('tahun_terbit')
                    <div class="alert alert-danger">{{ $message }}</div>
                @enderror

                <div class="form-group mb-3">
                    <label for="deskripsi" class="text-primary font-weight-bold">Deskripsi</label>
                    <textarea class="form-control" name="deskripsi" rows="2">{{ old('deskripsi') }}</textarea>
                </div>
                @error('deskripsi')
                    <div class="alert alert-danger">{{ $message }}</div>
                @enderror

                <div class="form-group mb-3">
                    <label for="lokasi" class="text-primary font-weight-bold">Lokasi Buku</label>
                    <input type="text" name="lokasi" class="form-control" value="{{ old('lokasi') }}">
                </div>
                @error('lokasi')
                    <div class="alert alert-danger">{{ $message }}</div>
                @enderror

                <div class="form-group mb-3">
                    <label for="stok" class="text-primary font-weight-bold">Stok Buku</label>
                    <input type="number" name="stok" class="form-control" value="{{ old('stok') }}">
                </div>
                @error('stok')
                    <div class="alert alert-danger">{{ $message }}</div>
                @enderror

                <div class="form-group mb-3">
                    <label for="gambar" class="text-primary font-weight-bold">Tambah Sampul Buku</label>
                    <input type="file" name="gambar" id="gambar" class="form-control">
                </div>
                @error('gambar')
                    <div class="alert alert-danger">{{ $message }}</div>
                @enderror

                <div class="d-flex justify-content-end">
                    <a href="{{ route('buku.index') }}" class="btn btn-danger">Kembali</a>
                    <button type="submit" class="btn btn-primary mx-1 px-4">Simpan</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        $('#multiselect').select2({
            allowClear: true
        });
    </script>
@endsection

@extends('layouts.master')

@section('topbar')
    @include('part.topbar')
@endsection

@section('sidebar')
    @include('part.sidebar')
@endsection

@section('judul')
<h1 class="text-primary">
    @isset($buku)
        {{ $buku->judul }}
    @else
        Detail Buku
    @endisset
</h1>
@endsection

@section('content')
    @isset($buku)
    <div class="card mb-4">
        <div class="content m-4">
            {{-- Gambar --}}
            @if($buku->gambar != null)
                <img class="img mb-3" src="{{ asset('/images/' . $buku->gambar) }}" style="height:200px; width:200px;">
            @else
                <img class="img mb-3" src="{{ asset('/images/noImage.jpg') }}" style="height:200px; width:200px;">
            @endif

            {{-- Informasi detail --}}
            <h5 class="pengarang">Pengarang : 
                <a href="#" class="text-primary" style="text-decoration: none">{{ $buku->pengarang }}</a>
            </h5>
            <h5 class="penerbit">Penerbit : 
                <a href="#" class="text-primary" style="text-decoration: none">{{ $buku->penerbit }}</a>
            </h5>
            <h5 class="tahun_terbit">Tahun Terbit : 
                <a href="#" class="text-primary" style="text-decoration: none">{{ $buku->tahun_terbit }}</a>
            </h5>
            <h5 class="deskripsi">Deskripsi : 
                <p class="deskripsi mt-2" style="text-align:justify; text-indent:1rem; letter-spacing:.1rem; word-spacing:.1rem">
                    {{ $buku->deskripsi }}
                </p>
            </h5>
            <h5 class="lokasi">Lokasi : 
                <a href="#" class="text-primary" style="text-decoration: none">{{ $buku->lokasi }}</a>
            </h5>
            <h5 class="stok">Stok Tersedia : 
                <a href="#" class="text-primary" style="text-decoration: none">{{ $buku->stok }}</a>
            </h5>

            {{-- QR Code --}}
            <h3>QR Code Buku</h3>
            {!! QrCode::size(200)->generate(route('buku.show', $buku->id)) !!}
            <br>
            <a href="data:image/png;base64,{{ base64_encode(QrCode::format('png')->size(200)->generate(route('buku.show', $buku->id))) }}" 
               download="qr_buku_{{ $buku->id }}.png">Download QR Code</a>

            {{-- Tombol kembali --}}
            <div class="mt-4">
                <a href="{{ route('buku.index') }}" class="btn btn-primary">Kembali</a>
            </div>
        </div>
    </div>
    @else
    <div class="alert alert-danger">
        Data buku tidak ditemukan.
    </div>
    @endisset
@endsection

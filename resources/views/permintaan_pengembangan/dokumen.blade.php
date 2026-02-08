@php
use Carbon\Carbon;
@endphp
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cetak Dokumen Permintaan Pengembangan Sistem Informasi</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .header {
            margin-bottom: 20px;
        }
        .header h2 {
            margin: 5px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        .no-border {
            border: none;
        }
        .text-center {
            text-align: center;
        }
        .text-right {
            text-align: right;
        }
        .text-left {
            text-align: left;
        }
        .bold {
            font-weight: bold;
        }
        .page-break {
            page-break-after: always;
        }
    </style>
</head>
<body>

@foreach($datapermintaan as $permintaan)
<div class="header">
    <table>
        <tr>
            <td rowspan="4">
                <img src="data:image/png;base64,{{ base64_encode(file_get_contents(public_path('img/logo_ptsi.png'))) }}" alt="Logo" width="100">
            </td>
            <td rowspan="4" class="text-center">
                <h2>Permintaan Pengembangan Sistem Informasi</h2>
            </td>
            <td>No. Dokumen</td>
            <td>FP-DTI03-04</td>
        </tr>
        <tr>
            <td>No. Revisi</td>
            <td>0</td>
        </tr>
        <tr>
            <td>Tanggal Revisi</td>
            <td>2024</td>
        </tr>
        <tr>
            <td>Halaman</td>
            <td>1</td>
        </tr>
    </table>
</div>

<h3 class="text-center bold">INFO KEBUTUHAN SISTEM INFORMASI</h3>
<h4 class="text-right"><strong>NO: {{ $permintaan->nomor_dokumen }}</strong></h4>
<table>
    <tr>
        <td>Latar Belakang</td>
        <td>{{ $permintaan->latar_belakang }}</td>
    </tr>
    <tr>
        <td>Tujuan</td>
        <td>{{ $permintaan->tujuan }}</td>
    </tr>
    <tr>
        <td>Target Implementasi Sistem</td>
        <td>{{ $permintaan->target_implementasi_sistem }}</td>
    </tr>
    <tr>
        <td>Fungsi-fungsi Sistem Informasi</td>
        <td>{{ $permintaan->fungsi_sistem_informasi }}</td>
    </tr>
    <tr>
        <td>Jenis Aplikasi</td>
        <td>{{ $permintaan->jenis_aplikasi }}</td>
    </tr>
    <tr>
        <td>Pengguna</td>
        <td>{{ $permintaan->pengguna }}</td>
    </tr>
    <tr>
        <td>Uraian Permintaan Tambahan/Khusus</td>
        <td>{{ $permintaan->uraian_permintaan_tambahan }}</td>
    </tr>
    <tr>
        <td>Lampiran</td>
        <td>{{ $permintaan->lampiran }}</td>
    </tr>
</table>

<table class="table">
    <tr>
        <th class="text-center" colspan="2">Disiapkan oleh</th>
        <th class="text-center" colspan="2">Disetujui oleh</th>
    </tr>
    <tr>
        <td colspan="2" style="height: 100px;"></td>
        <td colspan="2" style="height: 100px;"></td>
    </tr>
    <tr>
        <td class="text-center" colspan="2">{{ $permintaan->nama_pemohon }}<br>{{$permintaan->jabatan_pemohon}}</td>
        <td class="text-center" colspan="2">{{ $permintaan->nama }}<br>{{$permintaan->jabatan}}</td>
    </tr>
    <tr>
        <td class="text-center" colspan="2">Tanggal: {{ \Carbon\Carbon::parse($permintaan->tanggal_disiapkan)->format('d-m-Y') }}</td>
        <td class="text-center" colspan="2">Tanggal: {{ \Carbon\Carbon::parse($permintaan->tanggal_disetujui)->format('d-m-Y') }}</td>
    </tr>
</table>

@if (!$loop->last)
<div class="page-break"></div>
@endif

@endforeach

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cetak Dokumen Persetujuan Pengembangan</title>
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

@foreach($dataserahterima as $serahterima)
<div class="header">
    <table>
        <tr>
            <td rowspan="4">
                <img src="data:image/png;base64,{{ base64_encode(file_get_contents(public_path('img/logo_ptsi.png'))) }}" alt="Logo" width="100">
            </td>
            <td rowspan="4" class="text-center">
                <h2>Berita Acara Serah Terima Pekerjaan Sistem Aplikasi</h2>
            </td>
            <td>No. Dokumen</td>
            <td>FP-DTI03-06</td>
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

<h3 class="text-center">Yang Bertanda Tangan Dibawah Ini, Menyatakan Bahwa Pada</h3>
<table>
    <tr>
        <td>Hari</td>
        <td>{{ $serahterima->hari }}</td>
    </tr>
    <tr>
        <td>Tanggal</td>
        <td>{{ $serahterima->tanggal }}</td>
    </tr>
    <tr>
        <td>Lokasi</td>
        <td>{{ $serahterima->lokasi }}</td>
    </tr>
    <tr>
        <td>Nama Aplikasi</td>
        <td>{{ $serahterima->nama_aplikasi }}</td>
    </tr>
    <tr>
        <td>Nomor Permintaan</td>
        <td>{{ $serahterima->no_permintaan }}</td>
    </tr>
    <tr>
        <td>Keterangan</td>
        <td>{{ $serahterima->keterangan }}</td>
</table>
<h3 class="text-center">Telah berfungsi dengan baik sesuai dengan kebutuhan dan menerima sistem aplikasi ini untuk dipergunakan sebagaimana mestinya.</h3>

<table class="table">
    <tr>
        <th class="text-center" colspan="2">Diserahkan oleh</th>
        <th class="text-center" colspan="2">Diterima oleh</th>
    </tr>
    <tr>
        <td colspan="2" style="height: 100px;"></td>
        <td colspan="2" style="height: 100px;"></td>
    </tr>
    <tr>
        <td class="text-center" colspan="2">{{ $serahterima->pemberi }}</td>
        <td class="text-center" colspan="2">{{ $serahterima->penerima }}</td>
    </tr>
</table>

@if (!$loop->last)
<div class="page-break"></div>
@endif

@endforeach

</body>
</html>

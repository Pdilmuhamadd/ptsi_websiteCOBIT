<?php

namespace App\Http\Controllers;

use App\Models\Kategori;
use App\Models\Member;
use App\Models\Pembelian;
use App\Models\Pengeluaran;
use App\Models\Penjualan;
use App\Models\Produk;
use App\Models\Supplier;
use App\Models\PermintaanPengembangan;
use App\Models\PersetujuanPengembangan;
use App\Models\PerencanaanKebutuhan;
use App\Models\AnalisisDesain;
use App\Models\PerencanaanProyek;
use App\Models\UserAcceptanceTesting;
use App\Models\serahterimaaplikasi;
use App\Models\QualityAssuranceTesting;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $kategori = Kategori::count();
        $trx_permintaan_pengembangan = PermintaanPengembangan::count();
        $trx_perencanaan_proyek = PerencanaanProyek::count();
        $trx_perencanaan_kebutuhan = PerencanaanKebutuhan::count();
        $trx_persetujuan_pengembangan = PersetujuanPengembangan::count();
        $produk = Produk::count();
        $trx_analisis_desain = AnalisisDesain::count();
        $trx_user_acceptance_testing = UserAcceptanceTesting::count();
        $trx_quality_assurance_testing = QualityAssuranceTesting::count();
        $trx_serah_terima_aplikasi = serahterimaaplikasi::count();
        $supplier = Supplier::count();
        $member = Member::count();

        $tanggal_awal = date('Y-m-01');
        $tanggal_akhir = date('Y-m-d');

        $data_tanggal = array();
        $data_pendapatan = array();

        while (strtotime($tanggal_awal) <= strtotime($tanggal_akhir)) {
            $data_tanggal[] = (int) substr($tanggal_awal, 8, 2);

            $total_penjualan = Penjualan::where('created_at', 'LIKE', "%$tanggal_awal%")->sum('bayar');
            $total_pembelian = Pembelian::where('created_at', 'LIKE', "%$tanggal_awal%")->sum('bayar');
            $total_pengeluaran = Pengeluaran::where('created_at', 'LIKE', "%$tanggal_awal%")->sum('nominal');

            $pendapatan = $total_penjualan - $total_pembelian - $total_pengeluaran;
            $data_pendapatan[] += $pendapatan;

            $tanggal_awal = date('Y-m-d', strtotime("+1 day", strtotime($tanggal_awal)));
        }

        $tanggal_awal = date('Y-m-01');

        if (auth()->user()->level == 1) {
            return view('admin.dashboard', compact('kategori', 'trx_perencanaan_proyek', 'trx_persetujuan_pengembangan' ,'trx_permintaan_pengembangan', 'trx_perencanaan_kebutuhan', 'trx_analisis_desain', 'trx_user_acceptance_testing','trx_quality_assurance_testing','trx_serah_terima_aplikasi','produk', 'supplier', 'member', 'tanggal_awal', 'tanggal_akhir', 'data_tanggal', 'data_pendapatan'));
        } else {
            return view('kasir.dashboard');
        }
    }
}

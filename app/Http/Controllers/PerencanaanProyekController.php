<?php

namespace App\Http\Controllers;

use App\Models\PersetujuanPengembangan;
use Illuminate\Http\Request;
use App\Models\PerencanaanProyek;
use Barryvdh\DomPDF\Facade\Pdf;

class PerencanaanProyekController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $nama_proyek_terpakai = PerencanaanProyek::pluck('id_persetujuan_pengembangan')->toArray();

        $trx_persetujuan_pengembangan = PersetujuanPengembangan::whereNotIn('id_persetujuan_pengembangan', $nama_proyek_terpakai)->pluck('nama_proyek', 'id_persetujuan_pengembangan');

        return view('perencanaan_proyek.index',compact('trx_persetujuan_pengembangan'));
    }

    public function data()
    {
        $trx_perencanaan_proyek = PerencanaanProyek::leftJoin('trx_persetujuan_pengembangan', 'trx_persetujuan_pengembangan.id_persetujuan_pengembangan', '=', 'trx_perencanaan_proyek.id_persetujuan_pengembangan')
        ->select('trx_perencanaan_proyek.*', 'trx_persetujuan_pengembangan.*')
        ->get();

        return datatables()
            ->of($trx_perencanaan_proyek)
            ->addIndexColumn()
            ->addColumn('select_all', function ($trx_perencanaan_proyek) {
                return '
                    <input type="checkbox" name="id_perencanaan_proyek[]" value="'. $trx_perencanaan_proyek->id_perencanaan_proyek .'">
                ';
            })
            ->addColumn('deskripsi', function($trx_persetujuan_pengembangan){
                return $trx_persetujuan_pengembangan->deskripsi;
            })
            ->addColumn('aksi', function ($trx_persetujuan_pengembangan) {
                $id_proyek = $trx_persetujuan_pengembangan->id_perencanaan_proyek;
                return '
                <div class="btn-group">
                    <button type="button" onclick="editForm(`'. route('perencanaan_proyek.update', $id_proyek) .'`)" class="btn btn-xs btn-info btn-flat"><i class="fa fa-pencil"></i></button>
                    <button type="button" onclick="deleteData(`'. route('perencanaan_proyek.destroy', $id_proyek) .'`)" class="btn btn-xs btn-danger btn-flat"><i class="fa fa-trash"></i></button>
                    <button type="button" onclick="UploadPDF(`'. route('perencanaan_proyek.store', $id_proyek) .'`)" class="btn btn-xs btn-info btn-flat"><i class="fa fa-upload"></i></button>
                    <button type="button" onclick="viewForm(`'. route('perencanaan_proyek.view', $id_proyek) .'`)" class="btn btn btn-xs btn-primary btn-flat"><i class="fa fa-eye"></i></button>
                </div>
                ';
            })
            ->addColumn('file_pdf', function ($trx_perencanaan_proyek) {
                if ($trx_perencanaan_proyek->file_pdf) {
                    return '<a href="/storage/assets/pdf/' . $trx_perencanaan_proyek->file_pdf . '" target="_blank">Lihat PDF</a>';
                }
                return '-';
            })
            ->rawColumns(['aksi', 'select_all','file_pdf'])
            ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();

        if ($request->hasFile('file_pdf')) {
            $file = $request->file('file_pdf');
            $filename = Str::random(20) . '.' . $file->getClientOriginalExtension();
            $path = $file->storeAs('assets/pdf', $filename, 'public');
            $data['file_pdf'] = $filename;
        }

        $trx_perencanaan_proyek = PerencanaanProyek::create($data);
        return response()->json('Data berhasil disimpan', 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id_perencanaan_proyek)
    {
        $trx_perencanaan_proyek = PerencanaanProyek::find($id_perencanaan_proyek);

        return response()->json($trx_perencanaan_proyek);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id_perencanaan_proyek)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id_perencanaan_proyek)
    {
        $trx_perencanaan_proyek = PerencanaanProyek::find($id_perencanaan_proyek);
        $trx_perencanaan_proyek->update($request->all());

        return response()->json('Data berhasil disimpan', 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id_perencanaan_proyek)
    {
        $trx_perencanaan_proyek = PerencanaanProyek::find($id_perencanaan_proyek);
        $trx_perencanaan_proyek->delete();

        return response(null, 204);
    }

    public function deleteSelected(Request $request)
    {
        $ids = $request->id_perencanaan_proyek;
        PerencanaanProyek::whereIn('id_perencanaan_proyek', $ids)->delete();
        return response()->json('Data berhasil dihapus', 200);
    }

    public function cetakDokumen(Request $request)
    {
        set_time_limit(300);

        $ids = $request->id_perencanaan_proyek;
        $dataperencanaan = PerencanaanProyek::leftJoin('trx_persetujuan_pengembangan','trx_persetujuan_pengembangan.id_persetujuan_pengembangan', '=', 'trx_perencanaan_proyek.id_persetujuan_pengembangan')
            ->select('trx_persetujuan_pengembangan.nama_proyek', 'trx_persetujuan_pengembangan.deskripsi', 'trx_perencanaan_proyek.*')
            ->whereIn('trx_perencanaan_proyek.id_perencanaan_proyek', $ids)
            ->get();

        $pdf = PDF::loadView('perencanaan_proyek.dokumen', compact('dataperencanaan'));
        $pdf->setPaper('a4', 'portrait');
        return $pdf->stream('perencanaan.pdf');
    }

    public function view($id)
    {
        $trx_perencanaan_proyek = PerencanaanProyek::leftJoin('trx_persetujuan_pengembangan', 'trx_persetujuan_pengembangan.id_persetujuan_pengembangan', '=', 'trx_perencanaan_proyek.id_persetujuan_pengembangan')
        ->select(
            'trx_perencanaan_proyek.*',
            'trx_persetujuan_pengembangan.nama_proyek as nama_proyek',
            'trx_persetujuan_pengembangan.deskripsi as deskripsi',
        )
        ->findOrFail($id);

        return response()->json($trx_perencanaan_proyek);
    }
}

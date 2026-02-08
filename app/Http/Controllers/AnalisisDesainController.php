<?php

namespace App\Http\Controllers;

use App\Models\AnalisisDesain;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;

class AnalisisDesainController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('analisis_desain.index');
    }

    public function data()
    {
        $trx_analisis_desain = AnalisisDesain::orderBy('id_analisis_desain')->get();

        return datatables()
            ->of($trx_analisis_desain)
            ->addIndexColumn()
            ->addColumn('select_all', function ($trx_analisis_desain) {
                return '
                    <input type="checkbox" name="id_analisis_desain[]" value="'. $trx_analisis_desain->id_analisis_desain .'">
                ';
            })
            ->addColumn('aksi', function ($trx_analisis_desain) {
                return '
                <div class="btn-group">
                    <button onclick="editForm(`'. route('analisis_desain.update', $trx_analisis_desain->id_analisis_desain) .'`)" class="btn btn-xs btn-info btn-flat"><i class="fa fa-pencil"></i></button>
                    <button onclick="deleteData(`'. route('analisis_desain.destroy', $trx_analisis_desain->id_analisis_desain) .'`)" class="btn btn-xs btn-danger btn-flat"><i class="fa fa-trash"></i></button>
                    <button onclick="UploadPDF(`'. route('analisis_desain.store', $trx_analisis_desain->id_analisis_desain) .'`)" class="btn btn-xs btn-info btn-flat"><i class="fa fa-upload"></i></button>
                    <button onclick="viewForm(`'. route('analisis_desain.view', $trx_analisis_desain->id_analisis_desain) .'`)" class="btn btn-xs btn-primary btn-flat"><i class="fa fa-eye"></i></button>
                </div>
                ';
            })
            ->addColumn('file_pdf', function ($trx_analisis_desain) {
                if ($trx_analisis_desain->file_pdf) {
                    return '<a href="/storage/assets/pdf/' . $trx_analisis_desain->file_pdf . '" target="_blank">Lihat PDF</a>';
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

        $trx_analisis_desain = AnalisisDesain::create($data);
        return response()->json('Data berhasil disimpan', 200);
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id_analisis_desain)
    {
        $trx_analisis_desain = AnalisisDesain::find($id_analisis_desain);

        return response()->json($trx_analisis_desain);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id_analisis_desain)
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
    public function update(Request $request, $id_analisis_desain)
    {
        $trx_analisis_desain = AnalisisDesain::find($id_analisis_desain)->update($request->all());

        return response()->json('Data berhasil disimpan', 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id_analisis_desain)
    {
        $trx_analisis_desain = AnalisisDesain::find($id_analisis_desain);
        $trx_analisis_desain->delete();

        return response(null, 204);
    }

    public function cetakDokumen(Request $request)
    {
        set_time_limit(300);

        $dataanalisis = AnalisisDesain::whereIn('id_analisis_desain', $request->id_analisis_desain)->get();
        $no  = 1;

        $pdf = PDF::loadView('analisis_desain.dokumen', compact('dataanalisis', 'no'));
        $pdf->setPaper('a4', 'portrait');
        return $pdf->stream('analisis.pdf');
    }

    public function deleteSelected(Request $request)
    {
        $ids = $request->id_analisis_desain;
        AnalisisDesain::whereIn('id_analisis_desain', $ids)->delete();
        return response()->json('Data berhasil dihapus', 200);
    }

    public function view($id)
    {
        $trx_analisis_desain = AnalisisDesain::findOrFail($id);
        return response()->json($trx_analisis_desain);
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\QualityAssuranceTesting;
use Barryvdh\DomPDF\Facade\Pdf;

class QualityAssuranceTestingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('quality_assurance_testing.index');
    }

    public function data()
    {
        $trx_quality_assurance_testing = QualityAssuranceTesting::orderBy('id_qat', 'desc')->get();

        return datatables()
            ->of($trx_quality_assurance_testing)
            ->addIndexColumn()
            ->addColumn('select_all', function ($trx_quality_assurance_testing) {
                return '
                    <input type="checkbox" name="id_qat[]" value="'. $trx_quality_assurance_testing->id_qat .'">
                ';
            })
            ->addColumn('aksi', function ($trx_quality_assurance_testing) {
                return '
                <div class="btn-group">
                    <button onclick="editForm(`'. route('quality_assurance_testing.update', $trx_quality_assurance_testing->id_qat) .'`)" class="btn btn-xs btn-info btn-flat"><i class="fa fa-pencil"></i></button>
                    <button onclick="deleteData(`'. route('quality_assurance_testing.destroy', $trx_quality_assurance_testing->id_qat) .'`)" class="btn btn-xs btn-danger btn-flat"><i class="fa fa-trash"></i></button>
                    <button onclick="UploadPDF(`'. route('quality_assurance_testing.store', $trx_quality_assurance_testing->id_qat) .'`)" class="btn btn-xs btn-info btn-flat"><i class="fa fa-upload"></i></button>
                </div>
                ';
            })
            ->addColumn('file_pdf', function ($trx_quality_assurance_testing) {
                if ($trx_quality_assurance_testing->file_pdf) {
                    return '<a href="/storage/assets/pdf/' . $trx_quality_assurance_testing->file_pdf . '" target="_blank">Lihat PDF</a>';
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

        $trx_quality_assurance_testing = QualityAssuranceTesting::create($data);
        return response()->json('Data berhasil disimpan', 200);
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $trx_quality_assurance_testing = QualityAssuranceTesting::find($id);

        return response()->json($trx_quality_assurance_testing);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
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
    public function update(Request $request, $id_qat)
    {
        $trx_quality_assurance_testing = QualityAssuranceTesting::find($id_qat)->update($request->all());

        return response()->json('Data berhasil diperbarui', 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id_qat)
    {
        $trx_quality_assurance_testing = QualityAssuranceTesting::find($id_qat);
        $trx_quality_assurance_testing->delete();

        return response(null, 204);
    }

    public function deleteSelected(Request $request)
    {
        $ids = $request->id_qat;
        QualityAssuranceTesting::whereIn('id_qat', $ids)->delete();
        return response()->json('Data berhasil dihapus', 200);
    }

    public function view($id)
    {
        $trx_quality_assurance_testing = QualityAssuranceTesting::findOrFail($id);
        return response()->json($trx_quality_assurance_testing);
    }

    public function cetakDokumen(Request $request)
    {
        set_time_limit(300);

        $dataQAT = QualityAssuranceTesting::whereIn('id_qat', $request->id_qat)->get();
        $no  = 1;

        $pdf = PDF::loadView('quality_assurance_testing.dokumen', compact('dataQAT', 'no'));
        $pdf->setPaper('a4', 'portrait');
        return $pdf->stream('Quality Assurance Testing (QAT).pdf');
    }
}

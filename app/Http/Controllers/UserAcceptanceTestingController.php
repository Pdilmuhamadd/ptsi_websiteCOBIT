<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UserAcceptanceTesting;
use Barryvdh\DomPDF\Facade\Pdf;

class UserAcceptanceTestingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('user_acceptance_testing.index');
    }

    public function data()
    {
        $trx_user_acceptance_testing = UserAcceptanceTesting::orderBy('id_user_acceptance_testing', 'desc')->get();

        return datatables()
            ->of($trx_user_acceptance_testing)
            ->addIndexColumn()
            ->addColumn('select_all', function ($trx_user_acceptance_testing) {
                return '
                    <input type="checkbox" name="id_user_acceptance_testing[]" value="'. $trx_user_acceptance_testing->id_user_acceptance_testing .'">
                ';
            })
            ->addColumn('aksi', function ($trx_user_acceptance_testing) {
                return '
                <div class="btn-group">
                    <button onclick="editForm(`'. route('user_acceptance_testing.update', $trx_user_acceptance_testing->id_user_acceptance_testing) .'`)" class="btn btn-xs btn-info btn-flat"><i class="fa fa-pencil"></i></button>
                    <button onclick="deleteData(`'. route('user_acceptance_testing.destroy', $trx_user_acceptance_testing->id_user_acceptance_testing) .'`)" class="btn btn-xs btn-danger btn-flat"><i class="fa fa-trash"></i></button>
                </div>
                ';
            })
            ->rawColumns(['aksi', 'select_all'])
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
        $trx_user_acceptance_testing = UserAcceptanceTesting::create($request->all());
        $trx_user_acceptance_testing->save();

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
        $trx_user_acceptance_testing = UserAcceptanceTesting::find($id);

        return response()->json($trx_user_acceptance_testing);
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
    public function update(Request $request, $id_user_acceptance_testing)
    {
        $trx_user_acceptance_testing = UserAcceptanceTesting::find($id_user_acceptance_testing);
        $trx_user_acceptance_testing->update($request->all());

        return response()->json('Data berhasil disimpan', 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id_user_acceptance_testing)
    {
        $trx_user_acceptance_testing = UserAcceptanceTesting::find($id_user_acceptance_testing);
        $trx_user_acceptance_testing->delete();

        return response(null, 204);
    }

    public function deleteSelected(Request $request)
    {
        $ids = $request->id_user_acceptance_testing;
        UserAcceptanceTesting::whereIn('id_user_acceptance_testing', $ids)->delete();
        return response()->json('Data berhasil dihapus', 200);
    }

    public function cetakDokumen(Request $request)
    {
        set_time_limit(300);

        $dataUserAcceptanceTesting = UserAcceptanceTesting::whereIn('id_user_acceptance_testing', $request->id_user_acceptance_testing)->get();
        $no  = 1;

        $pdf = PDF::loadView('user_acceptance_testing.dokumen', compact('dataUserAcceptanceTesting', 'no'));
        $pdf->setPaper('a4', 'portrait');
        return $pdf->stream('User Acceptance Testing (UAT).pdf');
    }
    public function cetakDokumenPerencanaan(Request $request)
    {
        set_time_limit(300);

        $dataUserAcceptanceTesting = UserAcceptanceTesting::whereIn('id_user_acceptance_testing', $request->id_user_acceptance_testing)->get();
        $no  = 1;

        $pdf = PDF::loadView('user_acceptance_testing.dokumenperencanaan', compact('dataUserAcceptanceTesting', 'no'));
        $pdf->setPaper('a4', 'portrait');
        return $pdf->stream('Perencanaan User Acceptance Testing (UAT).pdf');
    }
}

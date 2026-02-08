@extends('layouts.master')

@section('title')
    Daftar User Acceptance Testing
@endsection

@section('breadcrumb')
    @parent
    <li class="active">Daftar User Acceptance Testing</li>
@endsection

@section('content')
<div class="row">
    <div class="col-lg-12">
        <div class="box">
            <div class="box-header with-border">
                <button onclick="addForm('{{ route('user_acceptance_testing.store') }}')" class="btn btn-success btn-xs btn-flat"><i class="fa fa-plus-circle"></i> Tambah</button>
                <button onclick="deleteSelected('{{ route('user_acceptance_testing.delete_selected') }}')" class="btn btn-danger btn-xs btn-flat"><i class="fa fa-trash"></i> Hapus</button>
                <button onclick="cetakDokumenPerencanaan('{{ route('user_acceptance_testing.cetakDokumenPerencanaan') }}')" class="btn btn-info btn-xs btn-flat"><i class="fa fa-download"></i> Cetak Dok Perencanaan UAT</button>
                <button onclick="cetakDokumen('{{ route('user_acceptance_testing.cetakDokumen') }}')" class="btn btn-info btn-xs btn-flat"><i class="fa fa-download"></i> Cetak Dokumen UAT</button>
            </div>
            <div class="box-body table-responsive">
                    @csrf
                    <table class="table table-stiped table-bordered" style="font-size: 12px;">
                        <thead>
                        <th width="5%">
                            <input type="checkbox" name="select_all" id="select_all">
                        </th>
                        <th width="5%">No</th>
                        <th>Nomor Proyek</th>
                        <th>Nama Aplikasi</th>
                        <th>Jenis Aplikasi</th>
                        <th>Kebutuhan Fungsional</th>
                        <th>Kebutuhan NonFungsional</th>
                        <th>Unit Pemilik Proses Bisnis</th>
                        <th>Lokasi Pengujian</th>
                        <th>Tanggal Pengujian</th>
                        <th>Manual Book</th>
                        <th>Nama Penyusun</th>
                        <th>Jabatan Penyusun</th>
                        <th>Tanggal Disusun</th>
                        <th>Nama Penyetuju</th>
                        <th>Jabatan Penyetuju</th>
                        <th>Tanggal Disetujui</th>
                        <th width="15%"><i class="fa fa-cog"></i>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

@includeIf('user_acceptance_testing.form')
@endsection

@push('scripts')
<script>
    let table;

    $(function () {
        table = $('.table').DataTable({
            responsive: true,
            processing: true,
            serverSide: true,
            autoWidth: false,
            ajax: {
                url: '{{ route('user_acceptance_testing.data') }}',
            },
            columns: [
                {data: 'select_all', searchable: false, sortable: false},
                {data: 'DT_RowIndex', searchable: false, sortable: false},
                {data: 'nomor_proyek'},
                {data: 'nama_aplikasi'},
                {data: 'jenis_aplikasi'},
                {data: 'kebutuhan_fungsional'},
                {data: 'kebutuhan_nonfungsional'},
                {data: 'unit_pemilik_proses_bisnis'},
                {data: 'lokasi_pengujian'},
                {data: 'tgl_pengujian'},
                {data: 'manual_book'},
                {data: 'nama_penyusun'},
                {data: 'jabatan_penyusun'},
                {data: 'tgl_disusun'},
                {data: 'nama_penyetuju'},
                {data: 'jabatan_penyetuju'},
                {data: 'tanggal_disetujui'},
                {data: 'aksi', searchable: false, sortable: false},
            ],
        });

        $('#modal-form').validator().on('submit', function (e) {
            if (!e.preventDefault()) {
                $.post($('#modal-form form').attr('action'), $('#modal-form form').serialize())
                    .done((response) => {
                        $('#modal-form').modal('hide');
                        table.ajax.reload();
                    })
                    .fail((errors) => {
                        alert('Tidak dapat menyimpan data');
                        return;
                    });
            }
        });

        $('[name=select_all]').on('click', function () {
            $(':checkbox').prop('checked', this.checked);
        });
    });


    function addForm(url) {
        $('#modal-form').modal('show');
        $('#modal-form .modal-title').text('Tambah User Acceptance Testing');

        $('#modal-form form')[0].reset();
        $('#modal-form form').attr('action', url);
        $('#modal-form [name=_method]').val('post');
        $('#modal-form [name=nomor_proyek]').focus();
    }

    function editForm(url) {
        $('#modal-form').modal('show');
        $('#modal-form .modal-title').text('Edit User Acceptance Testing');

        $('#modal-form form')[0].reset();
        $('#modal-form form').attr('action', url);
        $('#modal-form [name=_method]').val('put');
        $('#modal-form [name=nomor_proyek]').focus();

        $.get(url)
            .done((response) => {
                $('#modal-form [name=nomor_proyek]').val(response.nomor_proyek);
                $('#modal-form [name=nama_aplikasi]').val(response.nama_aplikasi);
                $('#modal-form [name=jenis_aplikasi]').val(response.jenis_aplikasi);
                $('#modal-form [name=kebutuhan_fungsional]').val(response.kebutuhan_fungsional);
                $('#modal-form [name=kebutuhan_nonfungsional]').val(response.kebutuhan_nonfungsional);
                $('#modal-form [name=unit_pemilik_proses_bisnis]').val(response.unit_pemilik_proses_bisnis);
                $('#modal-form [name=lokasi_pengujian]').val(response.lokasi_pengujian);
                $('#modal-form [name=tgl_pengujian]').val(response.tgl_pengujian);
                $('#modal-form [name=manual_book]').val(response.manual_book);
                $('#modal-form [name=nama_penyusun]').val(response.nama_penyusun);
                $('#modal-form [name=jabatan_penyusun]').val(response.jabatan_penyusun);
                $('#modal-form [name=tgl_disusun]').val(response.tgl_disusun);
                $('#modal-form [name=nama_penyetuju]').val(response.nama_penyetuju);
                $('#modal-form [name=jabatan_penyetuju]').val(response.jabatan_penyetuju);
                $('#modal-form [name=tanggal_disetujui]').val(response.tgl_disetujui);
            })
            .fail((errors) => {
                alert('Tidak dapat menampilkan data');
                return;
            });
    }

    function deleteData(url) {
        if (confirm('Yakin ingin menghapus data terpilih?')) {
            $.post(url, {
                    '_token': $('[name=csrf-token]').attr('content'),
                    '_method': 'delete'
                })
                .done((response) => {
                    table.ajax.reload();
                })
                .fail((errors) => {
                    alert('Tidak dapat menghapus data');
                    return;
                });
        }
    }

    function deleteSelected(url) {
        var ids = [];
        $('[name="id_user_acceptance_testing[]"]:checked').each(function () {
            ids.push($(this).val());
        });

        if (ids.length > 0) {
            if (confirm('Yakin ingin menghapus data terpilih?')) {
                $.post(url, {
                    '_token': $('[name=csrf-token]').attr('content'),
                    '_method': 'delete',
                    'id_user_acceptance_testing': ids
                })
                .done((response) => {
                    table.ajax.reload();
                })
                .fail((errors) => {
                    alert('Tidak dapat menghapus data');
                    return;
                });
            }
        } else {
            alert('Pilih data yang akan dihapus');
        }
    }


    function cetakDokumen(url) {
        if ($('input:checked').length < 1) {
            alert('Pilih data yang akan dicetak');
            return;
        } else {
            var form = $('<form>', {
                'method': 'POST',
                'action': url,
                'target': '_blank'
            });

            form.append($('<input>', {
                'type': 'hidden',
                'name': '_token',
                'value': '{{ csrf_token() }}'
            }));

            $('input:checked').each(function() {
                form.append($('<input>', {
                    'type': 'hidden',
                    'name': 'id_user_acceptance_testing[]',
                    'value': $(this).val()
                }));
            });

            $('body').append(form);
            form.submit();
        }
    }

    function cetakDokumenPerencanaan(url) {
        if ($('input:checked').length < 1) {
            alert('Pilih data yang akan dicetak');
            return;
        } else {
            var form = $('<form>', {
                'method': 'POST',
                'action': url,
                'target': '_blank'
            });

            form.append($('<input>', {
                'type': 'hidden',
                'name': '_token',
                'value': '{{ csrf_token() }}'
            }));

            $('input:checked').each(function() {
                form.append($('<input>', {
                    'type': 'hidden',
                    'name': 'id_user_acceptance_testing[]',
                    'value': $(this).val()
                }));
            });

            $('body').append(form);
            form.submit();
        }
    }
</script>
@endpush

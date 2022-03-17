$(document).on('turbolinks:load', function () {
  $dataTable = $('#want-lists-table').dataTable({
    processing: true,
    serverSide: true,
    ajax: $('#want-lists-table').data('source'),
    pagingType: 'full_numbers',
    pageLength: 10,
    columns: [
      {data: 'name', orderable: true, searchable: true},
      {data: 'email', orderable: true, searchable: true},
      {data: 'privacy', orderable: true, searchable: true},
      {data: 'active', orderable: true, searchable: false},
      {data: 'valore_account', orderable: true, searchable: true},
      {data: 'upload_status', orderable: true, searchable: true},
    ]
  });

});

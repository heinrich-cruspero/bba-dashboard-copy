$(document).on("turbo:load", function () {
  $dataTable = $('#accounts-table').dataTable({
    processing: true,
    serverSide: true,
    ajax: $('#accounts-table').data('source'),
    pagingType: 'full_numbers',
    pageLength: 10,
    columns: [
      { data: 'name', orderable: true, searchable: true },
      { data: 'account_number', orderable: true, searchable: true },
      { data: 'source_type', orderable: true, searchable: true },
      { data: 'source', orderable: true, searchable: true },
      { data: 'address_ln1', orderable: true, searchable: true },
      { data: 'address_ln2', orderable: false, searchable: false },
      { data: 'city', orderable: false, searchable: false },
      { data: 'state', orderable: false, searchable: false },
      { data: 'zip', orderable: false, searchable: false },
      { data: 'phone_number', orderable: false, searchable: false },
      { data: 'extension', orderable: false, searchable: false },
      { data: 'actions', orderable: false, searchable: false },
    ]
  });

});

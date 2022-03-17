$(document).on('turbolinks:load', function () {
    $dataTable = $('#audits-table').dataTable({
        processing: true,
        serverSide: true,
        ajax: $('#audits-table').data('source'),
        pagingType: 'full_numbers',
        pageLength: 10,
        columns: [
          {data: 'sku', orderable: true, searchable: true},
          {data: 'status', orderable: true, searchable: true},
          {data: 'notes', orderable: true, searchable: true},
          {data: 'internal_price_4', orderable: true, searchable: true},
          {data: 'internal_notes_1', orderable: true, searchable: true},
          {data: 'internal_notes_2', orderable: true, searchable: true},
          {data: 'internal_notes_3', orderable: true, searchable: true},
          {data: 'date_created', orderable: true, searchable: true},
          {data: 'actions', orderable: false, searchable: false},
        ]
    });

});

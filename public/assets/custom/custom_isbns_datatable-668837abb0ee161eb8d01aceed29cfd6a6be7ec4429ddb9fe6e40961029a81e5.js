$(document).on('turbolinks:load', function () {
    $dataTable = $('#custom_isbns-table').dataTable({
        processing: true,
        serverSide: true,
        ajax: $('#custom_isbns-table').data('source'),
        pagingType: 'full_numbers',
        pageLength: 10,
        columns: [
            { data: 'text_isbn', orderable: true, searchable: true },
            { data: 'alt_isbn', orderable: true, searchable: true },
            { data: 'custom_isbn', orderable: true, searchable: true },
            { data: 'code_isbn', orderable: true, searchable: true },
            { data: 'tag', orderable: true, searchable: true },
            { data: 'actions', orderable: false, searchable: false },
        ]
    });
});

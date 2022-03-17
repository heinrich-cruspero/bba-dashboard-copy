

$(document).on('turbolinks:load', function () {
    $dataTable = $('#thrift_orders-table').dataTable({
        processing: true,
        serverSide: true,
        ajax: $('#thrift_orders-table').data('source'),
        pagingType: 'full_numbers',
        pageLength: 10,
        columns: [
            { data: 'external_order_id', orderable: true, searchable: true },
            { data: 'want_list', orderable: true, searchable: true },
            { data: 'status', orderable: true, searchable: true },
            { data: 'created_at', orderable: true, searchable: true },
            { data: 'updated_at', orderable: true, searchable: true },
            { data: 'actions', orderable: false, searchable: false },
        ]
    });
});

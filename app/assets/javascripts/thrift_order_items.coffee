$ ->
  $('#thrift_order_items-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#thrift_order_items-table').data('source')
    pagingType: 'full_numbers'
    pageLength: 10
    columns: [
      {data: 'sku', orderable: true, searchable: true}
      {data: 'asin', orderable: true, searchable: true}
      {data: 'price', orderable: true, searchable: true}
      {data: 'condition', orderable: true, searchable: true}
      {data: 'status', orderable: true, searchable: true}
      {data: 'tracking_url', orderable: true, searchable: false}
    ]

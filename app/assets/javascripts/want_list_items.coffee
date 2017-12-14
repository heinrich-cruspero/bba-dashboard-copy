$ ->
  $('#want-list-items-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#want-list-items-table').data('source')
    pagingType: 'full_numbers'
    scrollCollapse: true
    scrollY: '75vh'
    scrollCollapse: true
    scrollX: true
    pageLength: 10
    columns: [
      {data: 'ean', orderable: false, searchable: true}
      {data: 'quantity', orderable: true, searchable: true}
      {data: 'max_price', orderable: true, searchable: true}
      {data: 'author', orderable: false, searchable: true}
      {data: 'title', orderable: false, searchable: true}
      {data: 'edit', orderable: false, searchable: true}
      {data: 'show', orderable: false, searchable: true}
      {data: 'delete', orderable: false, searchable: true}
    ]
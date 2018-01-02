$ ->
  $('#want-list-items-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#want-list-items-table').data('source')
    pagingType: 'full_numbers'
    pageLength: 10
    columns: [
      {data: 'ean', orderable: true, searchable: true}
      {data: 'quantity', orderable: true, searchable: false}
      {data: 'max_price', orderable: true, searchable: false}
      {data: 'author', orderable: true, searchable: true}
      {data: 'title', orderable: true, searchable: true}
      {data: 'actions', orderable: false, searchable: false}
    ]

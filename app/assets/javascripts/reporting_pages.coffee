$ ->
  $('#reporting-pages-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#reporting-pages-table').data('source')
    pagingType: 'full_numbers'
    pageLength: 10
    columns: [
      {data: 'isbn', orderable: false, searchable: true}
      {data: 'order_count', orderable: false, searchable: false}
      {data: 'max_price', orderable: false, searchable: false}
      {data: 'avg_price', orderable: false, searchable: false}
      {data: 'author', orderable: false, searchable: false}
      {data: 'title', orderable: false, searchable: false}
      {data: 'publisher', orderable: false, searchable: false}
      {data: 'publication_date', orderable: false, searchable: false}
      {data: 'edition', orderable: false, searchable: false}
      {data: 'list_price', orderable: false, searchable: false}
    ]



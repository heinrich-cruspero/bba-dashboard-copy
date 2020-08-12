$ ->
  $('#reporting-pages-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#reporting-pages-table').data('source')
    pagingType: 'full_numbers'
    pageLength: 10
    columns: [
      {data: 'isbn', searchable: true, orderable: false}
      {data: 'order_count', searchable: false, orderable: false}
      {data: 'max_price', searchable: false, orderable: false}
      {data: 'avg_price', searchable: false, orderable: false}
      {data: 'author', searchable: false, orderable: false}
      {data: 'title', searchable: false, orderable: false}
      {data: 'publisher', searchable: false, orderable: false}
      {data: 'publication_date', searchable: false, orderable: false}
      {data: 'edition', searchable: false, orderable: false}
      {data: 'list_price', searchable: false, orderable: false}
    ]



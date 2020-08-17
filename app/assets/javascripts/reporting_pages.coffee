$ ->
  $('#reporting-pages-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#reporting-pages-table').data('source')
    pagingType: 'full_numbers'
    pageLength: 10
    columns: [
      {data: 'isbn', searchable: true, sortable: false}
      {data: 'order_count', searchable: false, orderable: true}
      {data: 'max_price', searchable: false, orderable: true}
      {data: 'avg_price', searchable: false, orderable: true}
      {data: 'author', searchable: false, orderable: true }
      {data: 'title', searchable: false, orderable: true}
      {data: 'publisher', searchable: false, orderable: true}
      {data: 'publication_date', searchable: false, orderable: true}
      {data: 'edition', searchable: false, orderable: true}
      {data: 'list_price', searchable: false, orderable: true}
    ]



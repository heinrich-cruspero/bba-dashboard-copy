$ ->
  $('#want-list-items-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#want-list-items-table').data('source')
    pagingType: 'full_numbers'
    pageLength: 10
    columns: [
      {data: 'name', orderable: true, searchable: true}
      {data: 'ean', orderable: true, searchable: true}
      {data: 'isbn', orderable: true, searchable: true}
      {data: 'quantity', orderable: true, searchable: false}
      {data: 'quantity_purchased', orderable: true, searchable: false}
      {data: 'max_price', orderable: true, searchable: false}
      {data: 'author', orderable: true, searchable: true}
      {data: 'title', orderable: true, searchable: true}
      {data: 'publisher', orderable: true, searchable: true}
      {data: 'edition', orderable: true, searchable: true}
      {data: 'list_price', orderable: true, searchable: false}
      {data: 'percent_of_list', orderable: true, searchable: false}
      {data: 'actions', orderable: false, searchable: false}
    ]
    'fnDrawCallback': () ->
      componentHandler.upgradeDom()
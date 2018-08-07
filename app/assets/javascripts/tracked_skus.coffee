$ ->
  $('#tracked_skus-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#tracked_skus-table').data('source')
    pagingType: 'full_numbers'
    pageLength: 10
    scrollX: true
    columns: [
      {data: 'asin', orderable: true, searchable: true}
      {data: 'isbn', orderable: true, searchable: true}
      {data: 'publication_date', orderable: true, searchable: true}
      {data: 'title', orderable: true, searchable: true}
      {data: 'author', orderable: true, searchable: true}
      {data: 'publisher', orderable: true, searchable: true}
      {data: 'binding', orderable: true, searchable: true}
      {data: 'condition', orderable: true, searchable: true}
      {data: 'location', orderable: true, searchable: true}
      {data: 'sku', orderable: true, searchable: true}
      {data: 'locator_code', orderable: true, searchable: true}
      {data: 'suffix', orderable: true, searchable: true}
      {data: 'date_created', orderable: true, searchable: true}
      {data: 'internal_price_4', orderable: true, searchable: true}
      {data: 'internal_notes_1', orderable: true, searchable: true}
      {data: 'internal_notes_2', orderable: true, searchable: true}
      {data: 'internal_notes_3', orderable: true, searchable: true}
      {data: 'audited', orderable: true, searchable: true}
    ]

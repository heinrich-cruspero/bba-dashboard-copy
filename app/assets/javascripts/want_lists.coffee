$ ->
  $('#want-lists-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#want-lists-table').data('source')
    pagingType: 'full_numbers'
    scrollCollapse: true
    scrollY: '75vh'
    scrollCollapse: true
    scrollX: true
    pageLength: 10
    columns: [
      {data: 'name', orderable: true, searchable: true}
      {data: 'user_id', orderable: true, searchable: true}
      {data: 'want_list_privacy_id', orderable: true, searchable: true}
      {data: 'items', orderable: false, searchable: false}
      {data: 'edit', orderable: false, searchable: false}
      {data: 'show', orderable: false, searchable: false}
      {data: 'delete', orderable: false, searchable: false}
    ]

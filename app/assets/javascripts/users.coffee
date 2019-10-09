$ ->
  $('#users-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#users-table').data('source')
    pagingType: 'full_numbers'
    pageLength: 10
    columns: [
      {data: 'email', orderable: true, searchable: true}
      {data: 'role', orderable: true, searchable: true}
      {data: 'actions', orderable: false, searchable: false}
    ]

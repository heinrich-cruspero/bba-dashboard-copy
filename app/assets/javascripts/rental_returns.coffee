$ ->
  $('#rental_returns-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#rental_returnstable').data('source')
    pagingType: 'full_numbers'
    pageLength: 10
    columns: [
      {data: 'fedex_account', orderable: true, searchable: true}
      {data: 'email', orderable: true, searchable: true}
      {data: 'name', orderable: true, searchable: true}
      {data: 'phone_number', orderable: true, searchable: true}
      {data: 'street', orderable: true, searchable: true}
      {data: 'city', orderable: true, searchable: true}
      {data: 'state', orderable: true, searchable: true}
      {data: 'zip_code', orderable: true, searchable: true}
      {data: 'actions', orderable: false, searchable: false}
    ]

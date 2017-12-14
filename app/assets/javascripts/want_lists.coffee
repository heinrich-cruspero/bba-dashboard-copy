# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
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
      {data: 'name', orderable: false, searchable: true}
      {data: 'user_id', orderable: true, searchable: true}
      {data: 'want_list_privacy_id', orderable: true, searchable: true}
      {data: 'items', orderable: false, searchable: true}
      {data: 'edit', orderable: false, searchable: true}
      {data: 'show', orderable: false, searchable: true}
      {data: 'delete', orderable: false, searchable: true}
    ]


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#users-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#users-table').data('source')
    pagingType: 'full_numbers'
    scrollCollapse: true
    scrollY: '75vh'
    scrollCollapse: true
    scrollX: true
    pageLength: 10
    columns: [
      {data: 'email', orderable: false, searchable: true}
      {data: 'admin', orderable: false, searchable: true}
      {data: 'edit', orderable: false, searchable: true}
      {data: 'show', orderable: false, searchable: true}
      {data: 'delete', orderable: false, searchable: true}
    ]

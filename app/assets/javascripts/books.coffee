$ ->
  books_table = $('#books-table').DataTable
    processing: true
    serverSide: true
    ajax: $('#books-table').data('source')
    pagingType: 'full_numbers'
    order: [[4,'desc']]
    scrollY: '70vh'
    scrollCollapse: true
    scrollX: true
    pageLength: 100
    fixedColumns: {
        leftColumns: 4
    }
    columns: [
      {data: 'ean', orderable: false, searchable: true}
      {data: 'isbn', orderable: false, searchable: true}
      {data: 'author', orderable: false, searchable: true}
      {data: 'title', orderable: false, searchable: true}
      {data: 'publication_date', orderable: true, searchable: true}
      {data: 'tqs', orderable: true, searchable: false}
      {data: 'daily_sqad', orderable: true, searchable: false}
      {data: 'weekly_sqad', orderable: true, searchable: false}
      {data: 'monthly_sqad', orderable: true, searchable: false}
      {data: 'yearly_sqad', orderable: true, searchable: false}
      {data: 'bbap', orderable: true, searchable: false}
      {data: 'weekly_sqmd', orderable: true, searchable: false}
      {data: 'lowest_good_price', orderable: true, searchable: false}
      {data: 'lowest_fba', orderable: true, searchable: false}
      {data: 'sales_rank', orderable: true, searchable: false}
      {data: 'list_price', orderable: true, searchable: false}
      {data: 'w_nw', orderable: true, searchable: false}
      {data: 'whole_sale', orderable: true, searchable: false}
      {data: 'direct', orderable: true, searchable: false}
      {data: 'daily_rqf', orderable: true, searchable: false}
      {data: 'weekly_rqf', orderable: true, searchable: false}
      {data: 'daily_sqaa', orderable: true, searchable: false}
      {data: 'weekly_sqaa', orderable: true, searchable: false}
      {data: 'monthly_sqaa', orderable: true, searchable: false}
      {data: 'yearly_sqaa', orderable: true, searchable: false}
      {data: 'updated_at', orderable: true, searchable: false}
    ]
    'fnDrawCallback': () ->
      componentHandler.upgradeDom()

  $(books_table.table().container()).on 'click', 'tr', ->
    row_index = books_table.fixedColumns().rowIndex(this)
    row = books_table.row( row_index );
    id = row.id()

    books_table.$('tr.selected').removeClass 'selected'
    $('.DTFC_LeftBodyLiner tr').removeClass 'selected'

    $(row.node()).addClass 'selected'
    $('.DTFC_LeftBodyLiner tr').eq(row_index + 1).addClass 'selected'

    $.ajax 'books/' + id + '/details',
      type: 'GET'
      dataType: 'html'
      error: (jqXHR, textStatus, errorThrown) ->
        alert(errorThrown)
      success: (data, textStatus, jqXHR) ->
        $('#details').html(data)
        $('#orders-table').DataTable
          pageLength: 100
          paging:   false
          ordering: false
          searching: false
          info:     false
          scrollY: '20vh'
        $('#fbaz-table').DataTable
          pageLength: 100
          paging:   false
          ordering: false
          searching: false
          info:     false
          scrollY: '20vh'

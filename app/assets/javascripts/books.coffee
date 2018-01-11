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
    columns: [
      {data: 'isbn', orderable: false, searchable: true}
      {data: 'author', orderable: false, searchable: true}
      {data: 'title', orderable: false, searchable: true}
      {data: 'publication_date', orderable: true, searchable: true}
      {data: 'tqs', orderable: true, searchable: false}
      {data: 'past_day_sales_history_quantity', orderable: true, searchable: false}
      {data: 'past_week_sales_history_quantity', orderable: true, searchable: false}
      {data: 'past_month_sales_history_quantity', orderable: true, searchable: false}
      {data: 'past_year_sales_history_quantity', orderable: true, searchable: false}
      {data: 'updated_at', orderable: true, searchable: false}
    ]
    'fnDrawCallback': () ->
      componentHandler.upgradeDom()

  $('#books-table tbody').on 'click', 'tr', ->
    if $(this).hasClass('selected')
      $(this).removeClass 'selected'
    else
      books_table.$('tr.selected').removeClass 'selected'
      $(this).addClass 'selected'
      $.ajax 'books/' + books_table.row(this).id() + '/details',
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
          $('#indaba-data').DataTable
            paging:   false
            ordering: false
            searching: false
            info:     false
            scrollX: true
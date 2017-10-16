$ ->
  books_table = $('#books-table').DataTable
    processing: true
    serverSide: true
    ajax: $('#books-table').data('source')
    pagingType: 'full_numbers'
    order: [[3,'desc']]
    scrollY: ($(window).height() - 300) + 'px'
    scrollX: true
    pageLength: 100
    columns: [
      {data: 'isbn', orderable: false, searchable: true}
      {data: 'author', orderable: false, searchable: true}
      {data: 'title', orderable: false, searchable: true}
      {data: 'past_day_sales_history_quantity', orderable: true, searchable: false}
      {data: 'past_week_sales_history_quantity', orderable: true, searchable: false}
      {data: 'past_month_sales_history_quantity', orderable: true, searchable: false}
      {data: 'past_year_sales_history_quantity', orderable: true, searchable: false}
      {data: 'tqs', orderable: true, searchable: false}
    ]

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


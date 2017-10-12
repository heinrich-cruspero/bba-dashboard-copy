$ ->
  $('#books-table').DataTable
    processing: true
    serverSide: true
    ajax: $('#books-table').data('source')
    pagingType: 'full_numbers'
    order: []
    scrollY: ($(window).height() - 300) + 'px'
    scrollX: true
    pageLength: 100
    columns: [
      {data: 'ean', orderable: false, searchable: true}
      {data: 'isbn', orderable: false, searchable: true}
      {data: 'list_price', orderable: true, searchable: false}
      {data: 'lowest_fba', orderable: true, searchable: false}
      {data: 'lowest_good_price', orderable: true, searchable: false}
      {data: 'sales_rank', orderable: true, searchable: false}
      {data: 'bbap', orderable: true, searchable: false}
      {data: 'direct', orderable: true, searchable: false}
      {data: 'tqs', orderable: true, searchable: false}
      {data: 'weekly_sqad', orderable: true, searchable: false}
      {data: 'weekly_sqmd', orderable: true, searchable: false}
      {data: 'past_day_sales_history_lowest_price', orderable: true, searchable: false}
      {data: 'past_day_sales_history_highest_price', orderable: true, searchable: false}
      {data: 'past_week_sales_history_lowest_price', orderable: true, searchable: false}
      {data: 'past_week_sales_history_highest_price', orderable: true, searchable: false}
      {data: 'past_month_sales_history_lowest_price', orderable: true, searchable: false}
      {data: 'past_month_sales_history_highest_price', orderable: true, searchable: false}
    ]

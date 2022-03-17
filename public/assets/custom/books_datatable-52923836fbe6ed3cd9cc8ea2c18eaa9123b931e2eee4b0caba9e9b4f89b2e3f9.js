$(function () {
    console.loge('ola')
    let $dataTable = $('#books-datatable').dataTable({
      processing: true,
      serverSide: true,
      ajax: $('#books-datatable').data('source'),
      pagingType: 'full_numbers',
      order: [[4, 'desc']],
      scrollY: '70vh',
      scrollCollapse: true,
      scrollX: true,
      pageLength: 100,
      fixedColumns: {
        leftColumns: 4
      },
      columns: [
        { data: 'ean', orderable: false, searchable: true },
        { data: 'isbn', orderable: false, searchable: true },
        { data: 'author', orderable: false, searchable: true },
        { data: 'title', orderable: false, searchable: true },
        { data: 'publication_date', orderable: true, searchable: true },
        { data: 'tqs', orderable: true, searchable: false },
        { data: 'daily_sqad', orderable: true, searchable: false },
        { data: 'weekly_sqad', orderable: true, searchable: false },
        { data: 'monthly_sqad', orderable: true, searchable: false },
        { data: 'yearly_sqad', orderable: true, searchable: false },
        { data: 'bbap', orderable: true, searchable: false },
        { data: 'weekly_sqmd', orderable: true, searchable: false },
        { data: 'lowest_good_price', orderable: true, searchable: false },
        { data: 'lowest_fba', orderable: true, searchable: false },
        { data: 'sales_rank', orderable: true, searchable: false },
        { data: 'list_price', orderable: true, searchable: false },
        { data: 'w_nw', orderable: true, searchable: false },
        { data: 'whole_sale', orderable: true, searchable: false },
        { data: 'direct', orderable: true, searchable: false },
        { data: 'daily_rqf', orderable: true, searchable: false },
        { data: 'weekly_rqf', orderable: true, searchable: false },
        { data: 'daily_sqaa', orderable: true, searchable: false },
        { data: 'weekly_sqaa', orderable: true, searchable: false },
        { data: 'monthly_sqaa', orderable: true, searchable: false },
        { data: 'yearly_sqaa', orderable: true, searchable: false },
        { data: 'updated_at', orderable: true, searchable: false },
      ],
    });

  });

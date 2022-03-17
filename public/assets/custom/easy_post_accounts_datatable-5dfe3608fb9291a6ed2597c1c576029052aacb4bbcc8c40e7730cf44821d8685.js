$(document).on("turbo:load", function () {
  $dataTable = $('#easy_post_accounts-table').dataTable({
    processing: true,
    serverSide: true,
    ajax: $('#easy_post_accounts-table').data('source'),
    pagingType: 'full_numbers',
    pageLength: 10,
    scrollX: true,
    columns: [
      { data: 'key', orderable: true, searchable: true },
      { data: 'account_number', orderable: true, searchable: true },
      { data: 'name', orderable: false, searchable: false },
      { data: 'company_name', orderable: false, searchable: false },
      { data: 'phone_number', orderable: false, searchable: false },
      { data: 'email', orderable: false, searchable: false },
      { data: 'street', orderable: false, searchable: false },
      { data: 'city', orderable: false, searchable: false },
      { data: 'state', orderable: false, searchable: false },
      { data: 'zip_code', orderable: false, searchable: false },
      { data: 'parcel_width', orderable: false, searchable: false },
      { data: 'parcel_length', orderable: false, searchable: false },
      { data: 'parcel_height', orderable: false, searchable: false },
      { data: 'parcel_weight', orderable: false, searchable: false },
      { data: 'prod', orderable: false, searchable: false },
      { data: 'actions', orderable: false, searchable: false },
    ]
  });

});

$(function() {
    $( "#from_date" ).datepicker({
        dateFormat: 'mm-dd-yy',
        changeMonth: true,
        numberOfMonths: 2
    });
    $( "#to_date" ).datepicker({
        dateFormat: 'mm-dd-yy',
        changeMonth: true,
        numberOfMonths: 2
    });

    $('#search_valore_orders').click(function() {
        isChecked = $("input[type=checkbox]:checked").length == 0;
        isDateSelected = ($('#from_date').val() == "" || $('#to_date').val() == "");
        if(isChecked && isDateSelected) {
            if($('#from_date').val() && isChecked) {
                alert("Please select to date");
            } else if($('#to_date').val() && isChecked) {
                alert("Please select from date");
            } else {
                alert("Please select at least one search filter");
            }
            return false
        }
    });

    $('#export-valore-orders-button').on('click', function(e) {
        e.preventDefault();
        var url = $(this).attr('href');
        const params = $.param($('#reporting-pages-table').DataTable().ajax.params());

        if(url.split('?').length > 1) {
            url = url + '&' + params
        } else {
            url = url + '?' + params
        }

        var dialog = document.querySelector('dialog');
        dialog.showModal();
        $.ajax({
            url: url,
            })
            .fail(function() {
                alert( "error" );
            })
            .done(function( data ) {
                window.location.href = data.download_url;
            })
            .always(function( data ) {
                dialog.close();
            });
    });
});

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
});
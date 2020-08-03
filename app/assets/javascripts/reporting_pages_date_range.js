jQuery(document).ready(function() {
    $(function() {
        $( "#from_date" ).datepicker({
            dateFormat: 'mm-dd-yy',
            changeMonth: true,
            numberOfMonths: 2,
            onClose: function( selectedDate ) {
                $( "#to_date" ).datepicker( 'option', 'minDate', selectedDate );
                $( "#to_date" ).datepicker( 'option', 'disabled', false );
                $( "#to_date").focus();
            }
        });
        $( "#to_date" ).datepicker({
            dateFormat: 'mm-dd-yy',
            changeMonth: true,
            numberOfMonths: 2,
            disabled: true,
        });
    });
});
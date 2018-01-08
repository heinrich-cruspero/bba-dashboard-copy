$(document).ready(function() {
    $('input[name="want_list[want_list_privacy_id]"]').on('change', function(){
        if ($(this).val() == 3) {
            $('#users_select_div').attr('hidden', false);
        }
        else {
            $('#users_select_div').attr('hidden', true);
            $("#users_select_div").children("input").each(function(){
                $(this).attr('checked', false);
            });
        }
    })
});
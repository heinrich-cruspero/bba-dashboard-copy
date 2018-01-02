$(document).ready(function() {
    $('input[name="want_list[want_list_privacy_id]"]').on('change', function(){
        if ($(this).val() == 2) {
            $('#users_select_div').attr('hidden', false);
            $('input[name="want_list[user_ids][]"]').attr('disabled', false);
        }
        else if ($(this).val() == 1) {
            $('#users_select_div').attr('hidden', true);
            $('input[name="want_list[user_ids][]"]').attr('disabled', false);
            $("#users_select option:selected").removeAttr("selected");
        }
    })
});
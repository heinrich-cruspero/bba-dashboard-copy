$(function() {
    $('#fedex_accounts').on('change', function() {
        if (this.value == '') {
            $('#easy_post_accounts').attr('disabled', false);
        } else {
            $('#easy_post_accounts').attr('disabled', 'disabeld');
        }
    });

    $('#easy_post_accounts').on('change', function() {
        if (this.value == '') {
            $('#fedex_accounts').attr('disabled', false);
        } else {
            $('#fedex_accounts').attr('disabled', 'disabeld');
        }
    });
});

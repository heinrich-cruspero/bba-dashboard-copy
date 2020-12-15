$(function() {
    $('#fedex_accounts').on('change', function() {
        if (this.value == '') {
            $('#easy_post_accounts').attr('disabled', false);
        } else {
            $('#easy_post_accounts').attr('disabled', 'disabeld');
            $('.accountable_type_input').val('FedexAccount');
        }
    });

    $('#easy_post_accounts').on('change', function() {
        if (this.value == '') {
            $('#fedex_accounts').attr('disabled', false);
        } else {
            $('#fedex_accounts').attr('disabled', 'disabeld');
            $('.accountable_type_input').val('EasyPostAccount');
        }
    });
});

//= require rails-ujs
//= require material
//= require jquery
//= require dataTables/jquery.dataTables

function get_authenticity_token(){
    return jQuery('meta[name="csrf-token"]').attr('content');
}

$(function(){
    $('input[type=radio][name=privacy_list]').change(function(){
        var id_value = this.value
        if (id_value == 1) {
            $("#users").hide()
        }
        var id_value = this.value
        if (id_value == 2) {
            $("#users").hide()
        }
        var id_value = this.value
        if (id_value == 3) {
            $("#users").show()
            jQuery.ajax({
                type: "GET",
                url: "/want_lists/list_user",
                data: "&authenticity_token=" + get_authenticity_token() + "&format=js",
                asynchronous: true,
                evalScripts: true
            });
        }
    });

    // $(document).ready(function(){
    //     $("#users").hide()
    // });
});

//edit wantlist
$(document).ready(function() {
    var id_value = document.getElementsByName('privacy_list')
    var id_to_pass = document.getElementById('hidden_want_list').value
    for (var i = 0, length = id_value.length; i < length; i++)
    {

        if (id_value[i].value == 1) {
            $("#users").hide()
        }
        if (id_value[i].value == 2) {
            $("#users").hide()
        }
        if (id_value[i].value == 3) {
            $("#users").show()
            jQuery.ajax({
                type: "GET",
                url: "/want_lists/edit_wantlist_user",
                data: "&authenticity_token=" + get_authenticity_token() + "&format=js" + "&want_list_id=" + id_to_pass,
                asynchronous: true,
                evalScripts: true
            });
        }

    }

});

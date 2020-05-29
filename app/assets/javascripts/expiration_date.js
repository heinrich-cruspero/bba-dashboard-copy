(function() {
    $("#submit_wantlist_item").on("click", function() {
        sessionStorage.setItem('expirationDate', document.getElementById('expirationDate').value);
    });

    if(sessionStorage.getItem('expirationDate') !== null) {
        $('#expirationDate').val(sessionStorage.getItem('expirationDate'));
    }
})();
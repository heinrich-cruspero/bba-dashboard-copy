(function() {
    if(sessionStorage.getItem('expirationDate') !== null) {
        $('#expirationDate').val(sessionStorage.getItem('expirationDate'));
    }
})();
$(function() {
    $('#export-valore-orders-button').on('click', function(e) {
        App.cable.subscriptions.create("FileDownloadChannel", {
            connected() {
                // Called when the subscription is ready for use on the server
                console.log('Connected to FileDownloadChannel')
            },

            disconnected() {
                // Called when the subscription has been terminated by the server
                console.log('Disconnected from FileDownloadChannel')
            },

            received(data) {
                // Called when there's incoming data on the websocket for this channel
                console.log('Received on FileDownloadChannel')

                window.location.href = data.download_url;
                var dialog = document.querySelector('dialog');
                dialog.close();

                App.cable.disconnect()
            }
        });
    });
});

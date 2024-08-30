$(document).ready(function() {
    var statusMessage = $('#statusMessage').text();
    if (statusMessage) {
        alert(statusMessage);
    }

    $('select[name="authStatus"]').change(function() {
        updateMemType(this);
    });

    $('form').submit(function() {
        updateMemType($('select[name="authStatus"]').get(0));
    });
});

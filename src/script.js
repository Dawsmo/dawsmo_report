var uiVisible = false;
var item;

$(document).ready(function () {
    window.addEventListener('message', function (event) {
        item = event.data;

        if (item.showUI) {
            uiVisible = true;
            $('.container').show();
        } else if (item.hideUI) {
            uiVisible = false;
            $('.container').hide();
            $('#message').val('');
            $('#acknowledge').prop('checked', false);
        }
    });
});

function openUI() {
    uiVisible = true;
    $('.container').show();
}

function closeUI() {
    uiVisible = false;
    $('.container').hide();
    $('#message').val('');
    $('#acknowledge').prop('checked', false);
    $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
}

function sendForm() {
    var selectedType = $('#reason').val();
    var message = $('#message').val();

    if (message.trim() === '') {
        return;
    }

    if ($('#acknowledge').is(':checked')) {
        $.post(`https://${GetParentResourceName()}/sendReport`, JSON.stringify({
            type: selectedType,
            message: message
        }));

        $('#message').val('');
        $('#acknowledge').prop('checked', false);
        closeUI()
    } else {
        $('.acknowledge-wrapper').addClass('acknowledge-warning');
        setTimeout(function () {
            $('.acknowledge-wrapper').removeClass('acknowledge-warning');
        }, 1000);
    }
}

function closeForm() {
    closeUI();
}

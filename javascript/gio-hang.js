$(document).ready(function () {
    upValueInputNumber();
    downValueInputNumber();
})

function upValueInputNumber(input) {
    $("div.items .input-amount button.up").click(function () {
        var input = $(this).prev();
        input.val(parseInt(input.val()) + 1);
    });
}

function downValueInputNumber(input) {
    $("div.items .input-amount button.down").click(function () {
        var input = $(this).next();
        if (input.val() > 1) {
            input.val(parseInt(input.val()) - 1);
        }
    });
}
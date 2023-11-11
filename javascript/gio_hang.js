$(document).ready(function () {
    upValueInputNumber();
    downValueInputNumber();
    removeProduct();
})

function upValueInputNumber(input) {
    $(".product .change-amount button.up").click(function () {
        var input = $(this).prev();
        input.val(parseInt(input.val()) + 1);
    });
}

function downValueInputNumber(input) {
    $(".product .change-amount button.down").click(function () {
        var input = $(this).next();
        if (input.val() > 1) {
            input.val(parseInt(input.val()) - 1);
        }
    });
}

function removeProduct(){
    $("#list-product .product button.cancel").click(function (){
        $(this).parent().remove();
    });
}
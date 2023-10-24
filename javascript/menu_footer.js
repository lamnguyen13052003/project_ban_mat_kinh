$(document).ready(function () {
    $("input#search").each(function () {
        displayPlaceholder($(this));
    });
});

function displayPlaceholder(element){
    if (!element.val()) {
        var string = "Nhập tên sản phẩm!       ";
        var val = "";
        let index = 0;
        setInterval(function (char) {
            val += string.charAt(index);
            element.attr("placeholder", val);
            index++;
            if(index === string.length){
                index = 0;
                val = "";
                element.attr("placeholder", "");
            }
        }, 150);
    }
}








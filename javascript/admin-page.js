$(document).ready(function () {
    $("input#search").each(function () {
        displayPlaceholder($(this));
    });


    $("menu account a").attr("href", "");
    $("menu account a img").attr("src", "../logo.png");
});

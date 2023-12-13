$(document).ready(function () {
    const button = $("#account-page").find(".account-sidebar-menu").find("li>button");
    button.click(function () {
        button.removeClass("active");
        const index = $(this).attr("data-bs-target");
        $(this).addClass("active");
        display_account_page(index);
    });

    $("#input-avatar").change(function () {
        var selectedFile = this.files[0];
        const imageUrl = window.URL.createObjectURL(selectedFile);
        $("#avatar").attr("src", imageUrl);
    });

    $("#signout").click(function () {
        $.get("/maven_war/LogOut", function (){
            window.location.replace("index.jsp");
        });
    });
});

function display_account_page(index) {
    const page = $("#account-page").find("div.account-page-content");
    page.removeClass("active");
    page.eq(index).addClass("active");
}
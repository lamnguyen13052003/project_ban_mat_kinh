$(document).ready(function () {
    $("input#search").each(function () {
        displayPlaceholder($(this));
    });

    const storedAccount =  sessionStorage.getItem("account");
    if (storedAccount != null) {
        var user = {
            hình: "logo.png",
            tên: "Nguyễn Đình Lam"
        }
        displayMenuAccount(user);
    }else{
        $("#menu").find(".login").removeClass("d-none");
        $("#menu").find(".sign-up").removeClass("d-none");
    }
});

function displayPlaceholder(element) {
    if (!element.val()) {
        var string = "Nhập tên sản phẩm!       ";
        var val = "";
        let index = 0;
        setInterval(function (char) {
            val += string.charAt(index);
            element.attr("placeholder", val);
            index++;
            if (index === string.length) {
                index = 0;
                val = "";
                element.attr("placeholder", "");
            }
        }, 150);
    }
}

function displayMenuAccount(user) {
    $("#menu").find(".login").addClass("d-none");
    $("#menu").find(".sign-up").addClass("d-none");
    $("#menu").find(".sign-up").after(`<div class="account col-lg-3 col-md-2 col-sm-2 border-0 px-lg-0">
        <a href="tai_khoan.html">
            <button type="button" class="btn d-flex float-lg-end  me-xl-4 me-lg-2" id="button-account">
                <div class="avatar p-1 bg-white rounded-circle d-flex align-items-center justify-content-center" style="width: 25px; height: 25px">
                    <img src="${user.hình}" alt="avatar.png"  class="d-md-line" width="18" height="18">
                </div>
                <span class="d-lg-block d-md-none ms-2 overflow-x-hidden d-block" style="max-width: 130px; white-space: nowrap">${user.tên}</span>
            </button>
        </a>
    </div>`);
}








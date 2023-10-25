$(document).ready(function () {
    fixSlide();
    setRateProduct();
    addActionClickForButtonFilter();
    removeCheckedFilterAll();
    addActionClickForButtonSort();
    addActionFilterMore();

    const storedAccount =  sessionStorage.getItem("account");
    if (storedAccount != null) {
        var user = {
            hình: "../../logo.png",
            tên: "Nguyễn Đình Lam"
        }
        displayMenuAccount(user);
    }else{
        $("#menu").find(".login").removeClass("d-none");
        $("#menu").find(".sign-up").removeClass("d-none");
    }
});

function addActionClickForButtonFilter() {
    $("div.filter>ul>li>button").click(function (){
        changeColorButtonCheck($(this));
    });
}

function addActionClickForButtonSort() {
    $("div.sort>ul>li>button").click(function (){
        changeColorButtonCheck($(this));
    });
}

function addActionFilterMore(){
    $("div.filter>ul>li.filter-more").click(function (){
        if($(this).hasClass("active")){
            $(this).parent().children("li.hidden").addClass("d-none");
            $(this).removeClass("active");
            $(this).empty();
            $(this).append('<span class="border-0">Xem thêm <i class="fa-solid fa-arrow-right"></i></span>');
        }else {
            $(this).parent().children("li.hidden").removeClass("d-none");
            $(this).addClass("active");
            $(this).empty();
            $(this).append('<span class="border-0">Rút gọn <i class="fa-solid fa-arrow-left"></i></span>');
        }
    });
}

function removeCheckedFilterAll(){
    $("#removeCheckedFilterAll").click(function (){
        $("div.filter>ul>li>button").removeClass("checked");
    });
}

function changeColorButtonCheck(button) {
   if(button.hasClass("checked")){
        button.removeClass("checked");
   }else{
       button.addClass("checked");
   }
}

function setRateProduct(){
    var listStar = $("div.onirvapp--shape-container>ul>li");
    for (var star of listStar) {
        if (star.getAttribute("class") === "checked") {
            star.getElementsByTagName("i")[0].setAttribute("class", "fa-solid fa-star");
        }
    }
}

function fixSlide(){
    $("#main>div>div.carousel").removeClass("slide").attr("id", "carouselExampleAutoplaying").attr("data-bs-ride", "carousel")
    $("#carouselExampleAutoplaying button").attr("data-bs-target", "#carouselExampleAutoplaying");
}

function displayMenuAccount(user) {
    $("#menu").find(".login").addClass("d-none");
    $("#menu").find(".sign-up").addClass("d-none");
    $("#menu").find(".sign-up").after(`<div class="account col-lg-3 col-md-2 col-sm-2 border-0 px-lg-0">
        <a href="../../account.html">
            <button type="button" class="btn d-flex float-lg-end  me-xl-4 me-lg-2" id="button-account">
                <div class="avatar p-1 bg-white rounded-circle d-flex align-items-center justify-content-center" style="width: 25px; height: 25px">
                    <img src="${user.hình}" alt="avatar.png"  class="d-md-line" width="18" height="18">
                </div>
                <span class="d-lg-block d-md-none ms-2 overflow-x-hidden d-block" style="max-width: 130px; white-space: nowrap">${user.tên}</span>
            </button>
        </a>
    </div>`);
}
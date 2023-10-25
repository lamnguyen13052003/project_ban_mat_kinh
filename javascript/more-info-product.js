$(document).ready(function () {
    showMoreInfor();
    selectOption();
    changeAmount();
    setRate();

    const storedAccount =  sessionStorage.getItem("account");
    if (storedAccount != null) {
        var user = {
            hình: "../../../logo.png",
            tên: "Nguyễn Đình Lam"
        }
        displayMenuAccount(user);
    }else{
        $("#menu").find(".login").removeClass("d-none");
        $("#menu").find(".sign-up").removeClass("d-none");
    }
});

function showMoreInfor() {

    $("#main .productTabsContent .tab-content .tab-pane a.readmore div").click(function () {
        $(this).parent().addClass("d-none");
        $("#main .productTabsContent .tab-content .tab-pane a.readless").removeClass("d-none");
        $("#main .productTabsContent .tab-content .tab-pane>div").removeClass("overflow-hidden").attr("style", "");
    });

    $("#main .productTabsContent .tab-content .tab-pane a.readless  div").click(function () {
        $(this).parent().addClass("d-none");
        $("#main .productTabsContent .tab-content .tab-pane a.readmore").removeClass("d-none");
        $("#main .productTabsContent .tab-content .tab-pane>div").addClass("overflow-hidden").attr("style", "height: 500px;");
    });
}

function selectOption() {
    $("#main .productWrap .productWrapDetail .product-swatch button").click(function () {
        $("#main .productWrap .productWrapDetail .product-swatch button").removeClass("active");
        $(this).addClass("active")
    });
}

function changeAmount(){
    $("#main .productWrap .productWrapDetail .productActionMain button.minusQuan").click(function () {
        var val =  $("#quantity");
        if(Number(val.val()) > 1){
            val.val(Number(val.val()) - 1);
        }
    });

    $("#main .productWrap .productWrapDetail .productActionMain button.plusQuan").click(function () {
        var val =  $("#quantity");
        val.val(Number(val.val()) + 1);
    });
}

function setRate(){
    $("#customer-rate li i").attr("class", "fa-solid fa-star");
    $("#customer-rate li").click(function (){
        let amount = $(this).attr("class").charAt(0);
        console.log(amount);
        $("div#customer-rate li i").attr("class", "fa-regular fa-star");
        for(var index = 0; index < amount; index++){
            $("div#customer-rate li").eq(index).children().attr("class", "fa-solid fa-star");
        }
    });
}

function displayMenuAccount(user) {
    $("#menu").find(".login").addClass("d-none");
    $("#menu").find(".sign-up").addClass("d-none");
    $("#menu").find(".sign-up").after(`<div class="account col-lg-3 col-md-2 col-sm-2 border-0 px-lg-0">
        <a href="../../../account.html">
            <button type="button" class="btn d-flex float-lg-end  me-xl-4 me-lg-2" id="button-account">
                <div class="avatar p-1 bg-white rounded-circle d-flex align-items-center justify-content-center" style="width: 25px; height: 25px">
                    <img src="${user.hình}" alt="avatar.png"  class="d-md-line" width="18" height="18">
                </div>
                <span class="d-lg-block d-md-none ms-2 overflow-x-hidden d-block" style="max-width: 130px; white-space: nowrap">${user.tên}</span>
            </button>
        </a>
    </div>`);
}
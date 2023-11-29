$(document).ready(function () {
    $(".account").find("a").attr("href", "../../tai_khoan.jsp");
    fixSlide();
    setRateProduct();
    addActionClickForButtonFilter();
    removeCheckedFilterAll();
    addActionClickForButtonSort();
    addActionFilterMore();
});

function addActionClickForButtonFilter() {
    $("div.filter>ul>li>button").click(function () {
        changeColorButtonCheck($(this));
    });
}

function addActionClickForButtonSort() {
    $("div.sort>ul>li>button").click(function () {
        changeColorButtonCheck($(this));
    });
}

function addActionFilterMore() {
    $("div.filter>ul>li.filter-more").click(function () {
        if ($(this).hasClass("active")) {
            $(this).parent().children("li.hidden").addClass("d-none");
            $(this).removeClass("active");
            $(this).empty();
            $(this).append('<span class="border-0">Xem thêm <i class="fa-solid fa-arrow-right"></i></span>');
        } else {
            $(this).parent().children("li.hidden").removeClass("d-none");
            $(this).addClass("active");
            $(this).empty();
            $(this).append('<span class="border-0">Rút gọn <i class="fa-solid fa-arrow-left"></i></span>');
        }
    });
}

function removeCheckedFilterAll() {
    $("button#removeCheckedFilterAll").click(function () {
        $("div.filter>ul>li>button").removeClass("checked");
    });
}

function changeColorButtonCheck(button) {
    if (button.hasClass("checked")) {
        button.removeClass("checked");
    } else {
        button.addClass("checked");
    }
}

function setRateProduct() {
    const listStar = $("div.onirvapp--shape-container>ul>li");
    for (const star of listStar) {
        if (star.getAttribute("class") === "checked") {
            star.getElementsByTagName("i")[0].setAttribute("class", "fa-solid fa-star");
        }
    }
}

function fixSlide() {
    $("#carouselExampleIndicators").attr("id", "carouselIndicators");
    const carouse = $("#carouselIndicators");
    carouse.find(".carousel-indicators").removeClass("carousel-indicators").addClass("my-carousel-indicators");
    carouse.find(".carousel-inner").removeClass("carousel-inner").addClass("my-carousel-inner");
    carouse.find(".carousel-control-prev").removeClass("carousel-control-prev").addClass("my-carousel-control-prev").html(`<span class="material-symbols-outlined">arrow_back </span>`);
    carouse.find(".carousel-control-next").removeClass("carousel-control-next").addClass("my-carousel-control-next").html(`<span class="material-symbols-outlined">arrow_forward </span>`);
}

function loadProduct(listInfoProduct){
    var index = 0;
    listInfoProduct.forEach((info) => {
        var product = $("div.pro-loop").eq(index);
        loaddingImg(product, info.list_img);
        loaddingBrand(product, info.brand);
        loaddingName(product, info.name)
        loaddingPrice(product, info.old_price, info.new_price);
        loaddingStar(product, info.amount_star);
        loaddingAmountRate(product, info.amount_rate);
        loaddingAmountSelled(product, info.amount_selled)
        loaddingLinkMoreInfo(product, info.link_more_info);
        index++;
    });

    /*Xóa các khung hiển thị đi*/
    for(; index < 20; index++){
        $("div.pro-loop").eq(index).addClass("d-none")
    }
}

function loaddingImg(product, listImg) {
    let index = 0;
    listImg.forEach((link) =>{
        product.find(".pro-loop-image picture img").eq(index).attr("src", link);
        index++;
    });
}

function loaddingBrand(product, brand){
    product.find(".pro-loop-brand>span").text(brand);
}

function loaddingName(product, name){
    product.find(".pro-loop-name>a").text(name);
    product.find(".pro-loop-name>a").attr("title", name);
}

function loaddingPrice(product, old_price, new_price){
    if(new_price === null){
        product.find(".pro-loop-price>p").html(formatNumber(old_price) + " <span> ₫</span>");
        product.find(".pro-loop-price>del").text("");
    }else{
        product.find(".pro-loop-price>p").html(formatNumber(new_price) + " <span> ₫</span>");
        product.find(".pro-loop-price>del").html(formatNumber(old_price) + " <span> ₫</span>");
    }
}

function loaddingStar(product, amount){
    product.find(".sold_qty .onirvapp--shape-container li").removeClass("checked")
    for(let i = 0; i < amount; i++){
        product.find(".sold_qty .onirvapp--shape-container li").eq(i).addClass("checked");
    }
}

function loaddingAmountRate(product, amount){
    product.find(".sold_qty .prod-review-loop>span").text("(" + amount + " đánh giá)")
}

function loaddingAmountSelled(product, amount) {
    product.find(".sold_qty .sold_qty_num>p>span").text(amount)
}

function loaddingLinkMoreInfo(product, link){
    product.find(".pro-loop-image>a").attr("href", link);
}

function formatNumber(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
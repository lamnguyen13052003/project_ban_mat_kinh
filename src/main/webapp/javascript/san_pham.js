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
    var listStar = $("div.onirvapp--shape-container>ul>li");
    for (var star of listStar) {
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
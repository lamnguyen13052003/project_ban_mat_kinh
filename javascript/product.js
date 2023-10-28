$(document).ready(function () {
    fixSlide();
    setRateProduct();
    addActionClickForButtonFilter();
    removeCheckedFilterAll();
    addActionClickForButtonSort();
    addActionFilterMore();
    slide();
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
    $("#carouselIndicators").find(".carousel-indicators").removeClass("carousel-indicators").addClass("my-carousel-indicators");
    $("#carouselIndicators").find(".carousel-inner").removeClass("carousel-inner").addClass("my-carousel-inner");
    $("#carouselIndicators").find(".carousel-control-prev").removeClass("carousel-control-prev").addClass("my-carousel-control-prev");
    $("#carouselIndicators").find(".carousel-control-next").removeClass("carousel-control-next").addClass("my-carousel-control-next");
}

function slide() {
    $("#carouselIndicators").find(".my-carousel-indicators").find("button").click(function () {
        const key = $(this).attr("data-bs-slide-to");
        $("#carouselIndicators").find(".my-carousel-inner").find(".carousel-item").filter(function () {
            $(this).removeClass("active");
            $("#carouselIndicators").find(".my-carousel-inner").find(".carousel-item").eq(key).addClass("active");
        })
    });
}
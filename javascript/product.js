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
    const carouse = $("#carouselIndicators");
    carouse.find(".carousel-indicators").removeClass("carousel-indicators").addClass("my-carousel-indicators");
    carouse.find(".carousel-inner").removeClass("carousel-inner").addClass("my-carousel-inner");
    carouse.find(".carousel-control-prev").removeClass("carousel-control-prev").addClass("my-carousel-control-prev").html(`<span class="material-symbols-outlined">arrow_back </span>`);
    carouse.find(".carousel-control-next").removeClass("carousel-control-next").addClass("my-carousel-control-next").html(`<span class="material-symbols-outlined">arrow_forward </span>`);
}

function slide() {
    const carouse = $("#carouselIndicators");
    const img = carouse.find(".my-carousel-inner").find(".carousel-item");
    const button = carouse.find(".my-carousel-indicators").find("button");
    var key = 0, currentSile = 0;

    button.click(function () {
        key = $(this).attr("data-bs-slide-to");
        currentSile = carouse.find(".my-carousel-indicators").find("button.active").attr("data-bs-slide-to");

        displayImg(button, currentSile, key);
    });

    carouse.find(".my-carousel-control-prev").click(function () {
        currentSile = $("#carouselIndicators").find(".my-carousel-indicators").find("button.active").attr("data-bs-slide-to");
        key = currentSile - 1;
        if (key >= 0) {
            displayImg(button, currentSile, key);
        } else {
            displayImg(button, currentSile, img.length - 1);
        }

    });

    carouse.find(".my-carousel-control-next").click(function () {
        currentSile = $("#carouselIndicators").find(".my-carousel-indicators").find("button.active").attr("data-bs-slide-to");
        key = Number(currentSile) + 1;
        if (key < img.length) {
            displayImg(button, currentSile, key);
        } else {
            displayImg(button, currentSile, 0);
        }
    });
}

function displayImg(button, currentSile, key) {
    const img = $("#carouselIndicators").find(".my-carousel-inner").find(".carousel-item");
    img.removeClass("active"); /*Ẩn các hình*/

    button.removeClass("active");
    button.eq(key).addClass("active");

    img.filter(function () {
        if (currentSile > key) {
            img.eq(key).attr("class", "carousel-item active prev_slide");
        } else {
            img.eq(key).attr("class", "carousel-item active next_slide");
        }
    });
}

setInterval(function (){
    const carouse = $("#carouselIndicators");
    const img = carouse.find(".my-carousel-inner").find(".carousel-item");
    const button = carouse.find(".my-carousel-indicators").find("button");
    var currentSile = carouse.find(".my-carousel-indicators").find("button.active").attr("data-bs-slide-to");

    var key = Number(currentSile) + 1;
    if (key < img.length) {
        displayImg(button, currentSile, key);
    } else {
        displayImg(button, currentSile, 0);
    }
}, 5000);
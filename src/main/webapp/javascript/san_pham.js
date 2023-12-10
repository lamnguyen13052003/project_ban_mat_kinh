$(document).ready(function () {
    $(".account").find("a").attr("href", "../../tai_khoan.jsp");
    fixSlide();
    addActionFilterMore();
    actionFastSee();
});


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


function fixSlide() {
    $("#carouselExampleIndicators").attr("id", "carouselIndicators");
    const carouse = $("#carouselIndicators");
    carouse.find(".carousel-indicators").removeClass("carousel-indicators").addClass("my-carousel-indicators");
    carouse.find(".carousel-inner").removeClass("carousel-inner").addClass("my-carousel-inner");
    carouse.find(".carousel-control-prev").removeClass("carousel-control-prev").addClass("my-carousel-control-prev").html(`<span class="material-symbols-outlined">arrow_back </span>`);
    carouse.find(".carousel-control-next").removeClass("carousel-control-next").addClass("my-carousel-control-next").html(`<span class="material-symbols-outlined">arrow_forward </span>`);
}
function actionFastSee() {
    $(".add-cart").click(function () {
        const productId = $(this).attr("product-id");
        $.ajax({
            url: 'show-models',
            data: {
                id: $(this).attr("product-id")
            },
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                const modelsList = data.models;
                var html = `<div class="product-swatch">
                                        <div class="product-sw-line">
                                            <ul class="product-sw-select">
                                                <div id="carousel" class="carousel slide">
                                                    <div class="carousel-inner">`
                for (var i = 0; i < modelsList.length; i++) {
                    if (i == 0) {
                        html += `
                                <div class="carousel-item active">
                                   <img src="${modelsList[i].urlIamge}" class="d-block w-100" alt="${modelsList[i].name}.png"> 
                                </div>
                                `
                    } else {
                        html += `
                                <div class="carousel-item">
                                    <img src="${modelsList[i].urlIamge}" class="d-block w-100" alt="${modelsList[i].name}.png"> 
                                </div>    
                                `
                    }
                }


                html += `               </div>
                                            <button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="visually-hidden">Previous</span>
                                            </button>
                                            <button class="carousel-control-next" type="button" data-bs-target="#carousel"  data-bs-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="visually-hidden">Next</span>
                                            </button>
                                        </div>
                                    </ul>
                                </div>
                            </div>

                            <!--Phần số lượng và đặt mua-->
                            <div class="product position-absolute">
                                <div class="product-name">
                                    <h5>${data.productName}</h5>
                                </div>
                                <div class="product-model">`
                for (var i = 0; i < modelsList.length; i++) {
                    if (i == 0) {
                        html += `
                                 <li class="product-sw-select-item">
                                        <button model-id="${modelsList[i].id}" type="button" class="active model" data-bs-target="#carousel" data-bs-slide-to="${i}" aria-label="Slide ${i}">
                                            <img src="${modelsList[i].urlIamge}" alt="${modelsList[i].name}.png">
                                            <span>${modelsList[i].name}</span>
                                        </button>
                                 </li>
                                `
                    } else {
                        html += `
                                 <li class="product-sw-select-item">
                                        <button model-id="${modelsList[i].id}" type="button" class="model" data-bs-target="#carousel" data-bs-slide-to="${i}" aria-label="Slide ${i}">
                                            <img src="${modelsList[i].urlIamge}" alt="${modelsList[i].name}.png">
                                            <span>${modelsList[i].name}</span>
                                        </button>
                                 </li>    
                                `
                    }
                }


                html += `</div>
                            <div class="groupAdd d-flex flex-column align-items-center mb-2 position-absolute">
                                <div id="input-amount" class="input-group itemQuantity mb-2">
                                    <button class="input-group-text qtyBtn minusQuan" data-type="minus">-</button>
                                    <input type="number" disabled class="input-group-text form-control quantitySelector" id="quantity" aria-label="Username" value="1">
                                    <button class="input-group-text qtyBtn plusQuan" data-type="plus">+</button>
                                </div>
                                <div class="productAction d-flex">
                                    <button type="button" product-id="${productId}" class="hoverOpacity" id="addToCart">Thêm vào giỏ hàng</button>
                                    <button type="button" class="hoverOpacity " id="buyNow">Mua ngay</button>
                                </div>
                            </div>
                        </div>`

                $("#modal .modal-body").html(html);
                changeAmount();
                selectOption();
                addProductCart();
                $("#show-modal").click();
            }
        });
    });
}

function changeAmount() {
    $("#input-amount button.minusQuan").click(function () {
        var val = $("#quantity");
        if (Number(val.val()) > 1) {
            val.val(Number(val.val()) - 1);
        }
    });

    $("#input-amount button.plusQuan").click(function () {
        var val = $("#quantity");
        val.val(Number(val.val()) + 1);
    });
}

function selectOption() {
    $(".product .product-model button").click(function () {
        $(".product .product-model button").removeClass("active");
        $(this).addClass("active")
        $("#quantity").val(1);
    });
}

function addProductCart(){
    $("#addToCart").click(function (){
        $.ajax({
            url: 'cart',
            data: {
                action: "add",
                productId: $(this).attr("product-id"),
                modelId: $("button.model.active").attr("model-id"),
                quantity: $("#quantity").val(),
                checked: "false"
            },
            method: 'POST',
            dataType: 'json',
            success: function (data) {
                $("#amount-product").text(data.amountProduct);
                $("#close-modal").click();
                $("#quantity").val(1);
                $("#show-complete-modal").click();
            }
        });
    });
}

$("#close-complete-modal").click(function () {
    $("#show-modal").click();
});


$(document).ready(function () {
    let indexPageBills = 1;
    let indexPageProductReviews = 1;
    const button = $(".account-sidebar-menu").find("li>button");
    button.click(function () {
        button.removeClass("active");
        const index = $(this).attr("data-bs-target");
        $(this).addClass("active");
        displayPageContent(index);
    });

    $("#input-avatar").change(function () {
        var selectedFile = this.files[0];
        const imageUrl = window.URL.createObjectURL(selectedFile);
        $("#avatar").attr("src", imageUrl);
    });


    $(`.product-reviews`).click(function () {
        indexPageProductReviews = 1;
        $('#display-product-reviews').off('scroll');
        $(".main-content .display-product-reviews").html(``);
        showProductReviews(true, indexPageProductReviews)
    });

    $(`.menu-review-item`).click(function () {
        $('#display-product-reviews').off('scroll')
        $(`.menu-review-item`).removeClass("active");
        $(this).addClass("active");
        indexPageProductReviews = 1;
        $(".main-content .display-product-reviews").html(``);
        showProductReviews(true, indexPageProductReviews);
    });

    $(`.bill-history`).click(function () {
        indexPageBills = 1;
        $('#display-bills').off('scroll');
        $(".main-content .display-bills").html(``);
        showBillHistory(true, indexPageBills)
    });

    $(`.menu-bill-item`).click(function () {
        $('#display-bills').off('scroll')
        $(`.menu-bill-item`).removeClass("active");
        $(this).addClass("active");
        indexPageBills = 1;
        $(".main-content .display-bills").html(``);
        showBillHistory(true, indexPageBills);
    });
});

function lazyBillHistory(indexPageBills) {
    var myDiv = $('#display-bills');
    var totalScrollHeight = myDiv.prop('scrollHeight');

    // Tính tổng chiều cao đã cuộn (scrollTop + clientHeight)
    var scrolledHeight = myDiv.scrollTop() + myDiv.height();

    // Kiểm tra xem người dùng đã cuộn đến cuối chưa
    if (Math.ceil(scrolledHeight) === totalScrollHeight) {
        indexPageBills++;
        showBillHistory(false, indexPageBills)
    }
}

function lazyProductReviews(indexPageBills) {
    var myDiv = $('#display-product-reviews');
    var totalScrollHeight = myDiv.prop('scrollHeight');

    // Tính tổng chiều cao đã cuộn (scrollTop + clientHeight)
    var scrolledHeight = myDiv.scrollTop() + myDiv.height();

    // Kiểm tra xem người dùng đã cuộn đến cuối chưa
    if (Math.ceil(scrolledHeight) === totalScrollHeight) {
        indexPageBills++;
        showProductReviews(false, indexPageBills);
    }
}

function displayPageContent(index) {
    const page = $("div.page-content");
    page.removeClass("active");
    page.eq(index).addClass("active");
}

function showBillHistory(click, indexPage) {
    const data = {
        "action": `get`,
        "user-id": $("#main").attr("user-id"),
        "menu-item": $(".menu-bill-item.active").attr("data-action"),
        "page": indexPage,
    };
    $.ajax({
        url: "bill_history",
        data: data,
        dataType: "JSON",
        method: "GET",
        success: function (data) {
            let html = $(".main-content .display-bills").html();
            if (data.bills.length < 8) {
                $('#display-bills').off('scroll');
            }
            data.bills.forEach((bill) => {
                let httmBill = `
                 <div class="body-bill-item row  align-items-center ms-2">
                                 <div class="bill-id col-2"><span>#${bill.id}</span></div>
                                 <div class="bill-time col-2"><span>${formatData(bill.statuses[0].date)}</span></div>
                                 <div class="col-3 d-flex">
                                     <div class="customer-info ms-2 w-100">
                                         <p class="customer-name">${bill.userName}</p>
                                         <p class="customer-email">${bill.email}</p>
                                     </div>
                                 </div>
                                 <div class="bill-state col-2">${bill.statuses[0].status}</div>
                                 <div class="bill-option-pay col-2">`;
                httmBill += bill.statuses[0].transfer ? `Chuyển khoản` : `Tiền mặt`;
                httmBill += `</div>
                                 <div class="bill-edit col-1">
                                 <a href="bill_history?action=see-detail&bill-id=${bill.id}">
                                    <i class="fa-solid fa-eye"></i>
                                 </a>
                                 </div>
                             </div>
                 `


                html += httmBill;
            });

            $(".main-content .display-bills").html(html);

           if(click) {
               $('#display-bills').on('scroll', function () {
                   lazyBillHistory(indexPage);
               });
           }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        }
    });
}

function showProductReviews(click, indexPage) {
    const data = {
        "action": `get-product-reviews`,
        "user-id": $("#main").attr("user-id"),
        "have-evaluated": $(".menu-review-item.active").attr("have-evaluated"),
        "page": indexPage,
    };

    console.log(data);
    $.ajax({
        url: "review",
        data: data,
        dataType: "JSON",
        method: "GET",
        success: function (data) {
            const userId = data["user-id"];
            let html = $(".main-content .display-product-reviews").html();
            if (data.productReviews.length < 8) {
                $('#display-product-reviews').off('scroll');
            }
            data.productReviews.forEach((productReview) => {
                let htmlProductReview = `
                  <div class="body-product-reviews-item row  align-items-center ms-2">
                                <div class="product-review-id col-2"><span class="id">#${productReview.productId}</span></div>
                                <div class="col-4 d-flex">
                                    <img style="width: 35px; border: 1px solid #000000" class="product-review-image rounded-circle d-block"
                                         src="${productReview.urlImage}"></img>
                                    <div class="customer-info ms-2 w-100">
                                        <p class="product-review-name">${productReview.productName}</p>
                                        <p class="product-review-email">Mẫu: ${productReview.modelName}</p>
                                    </div>
                                </div>
                                <div class="product-review-price col-2"><span>${formatCurrency(productReview.price)}</span></div>
                                <div class="product-review-quantity col-1"><span>${formatNumber(productReview.quantity)}</span></div>
                                <div class="product-review-total-price col-2"><span>${formatCurrency(productReview.quantity * productReview.price)}</span></div>
                                <div class="product-review-edit col-1">
                                    <a href="review?action=${data.action}&user-id=${userId}&product-id=${productReview.productId}&model-id=${productReview.modelId}">
                                        <span class="material-symbols-outlined">rate_review</span>
                                    </a>
                                </div>
                            </div>
                 `


                html += htmlProductReview;
            });

            $(".main-content .display-product-reviews").html(html);

            if(click) {
                $('#display-product-reviews').on('scroll', function () {
                    lazyProductReviews(indexPage);
                });
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        }
    });
}

function formatCurrency(number) {
    // Sử dụng hàm toLocaleString() để định dạng số
    // và ký hiệu tiền tệ là 'VND' (Việt Nam Đồng)
    return number.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
}

function formatNumber(number) {
    // Sử dụng hàm toLocaleString() để định dạng số
    return number.toLocaleString('vi-VN');
}
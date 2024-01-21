$(document).ready(function () {
    let indexPageBills = 1;
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

    $(`.bill-history`).click(function () {
        showBillHistory(true, indexPageBills)
    });

    $(`.menu-review-item`).click(function () {
        $(`.menu-review-item`).removeClass("active");
        $(this).addClass("active");
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
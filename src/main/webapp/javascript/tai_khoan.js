$(document).ready(function () {
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
        showBillHistory()
    });

    $(`.menu-review-item`).click(function () {
        $(`.menu-review-item`).removeClass("active");
        $(this).addClass("active");
    });

    $(`.menu-bill-item`).click(function () {
        $(`.menu-bill-item`).removeClass("active");
        $(this).addClass("active");
        showBillHistory();
    });
});

function displayPageContent(index) {
    const page = $("div.page-content");
    page.removeClass("active");
    page.eq(index).addClass("active");
}

function showBillHistory() {
    const data = {
        "action": `get`,
        "user-id": $("#main").attr("user-id"),
        "menu-item": $(".menu-bill-item.active").attr("data-action"),
    };
    $.ajax({
        url: "bill_history",
        data: data,
        dataType: "JSON",
        method: "GET",
        success: function (data) {
            const userId = data.userId;
            let html = "";
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
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        }
    });
}
$(document).ready(function () {
   $("#search-account-id").next().css({"cursor": "pointer"}).click(function () {
       search_account();
   });

    $("#search-account-name").next().css({"cursor": "pointer"}).click(function () {
        search_account();

    });

    $("#input-lock-account").change(function () {
        search_account();
    });

    $("#input-account-role").change(function () {
        search_account();
    });
});

// function search_account_id(input) {
//     const list_account = $(".account");
//     list_account.removeClass("d-none");
//     const value = input.val();
//     if (value === "") {
//         return;
//     }
//
//     list_account.addClass("d-none");
//     list_account.filter(function () {
//         var account_id = $(this).attr("data-account-id")[0];
//         // alert(account_id);
//         if (account_id.search(value) >= 0) {
//             $(this).removeClass("d-none");
//         }
//     });
// }

// function search_account_name(input) {
//     var list_account = $(".account");
//     list_account.removeClass("d-none");
//     const value = input.val().toLowerCase();
//     if (value === "") {
//         return;
//     }
//
//     list_account.addClass("d-none");
//     list_account.filter(function () {
//         var account_name = $(this).attr("data-account-name").join("").toLowerCase();
//         if (account_name.search(value) >= 0) {
//             $(this).removeClass("d-none");
//         }
//     });
// }

// function search_lock_account(input) {
//     var list_account = $(".account");
//     list_account.removeClass("d-none");
//     const value = input.val();
//     if (value === "all") {
//         return;
//     }
//
//     list_account.addClass("d-none");
//     list_account.filter(function () {
//         var lock_account = $(this).attr("data-lock-account");
//         if (lock_account.search(value) >= 0) {
//             $(this).removeClass("d-none");
//         }
//     });
// }
//
// function search_account_role(input) {
//     var list_account = $(".account");
//     list_account.removeClass("d-none");
//     const value = input.val();
//     if (value === "all") {
//         return;
//     }
//
//     list_account.addClass("d-none");
//     list_account.filter(function () {
//         var lock_account = $(this).attr("data-account-role");
//         if (lock_account.search(value) >= 0) {
//             $(this).removeClass("d-none");
//         }
//     });
// }
function formatCurrencyVND(amount) {
    return amount.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
}


const search_account = ()=>{
    const id = $("#search-account-id").val();
    const name = $("#search-account-name").val();
    const lock = $("#input-lock-account").val();
    const role = $("#input-account-role").val();
    $.ajax({
        url: '/maven_war/admin/account',
        method: 'GET',
        data: {
            page: 1,
            action: 'get',
            name:name,
            role:role,
            lock:lock,
            id:id

        },
        dataType: 'json',
        success: function(data) {
            document.querySelector("#count_user").textContent = data.total
            document.querySelector(".amount").value = data.total;
            let pagi = `<button id="prev" class="d-flex align-items-center justify-content-center"><span
                            class="material-symbols-outlined">chevron_left</span></button>`
            for (let i = 1; i <= data.totalPage; i++) {
                pagi += `
                <button class="d-flex align-items-`c`enter justify-content-center button-number ${i == 1 ? 'active' : ''}"
                            >${i}
                </button>
                `
            }
            pagi += `
            <button id="next" class="d-flex align-items-center justify-content-center"><span
                            class="material-symbols-outlined">chevron_right</span></button>
            `
            document.querySelector(".pagination_account").innerHTML = pagi
            let elm = '';
            data.data.map(tmp=>{
                elm += `
                            <div class="row account align-items-center ps-4" >
                    <div class="col-2 id-account">#${tmp.id}</div>
                    <div class="col-4 d-flex">
                        <div class="avatar-account">
                            <img src="${tmp.avatar ?? "../images/logo/logo.png"}" alt="img">
                        </div>
                        <div class="info-account ms-2 w-100">
                            <p class="name-account">${tmp.fullName}</p>
                            <p class="email-account">${tmp.email}</p>
                        </div>
                    </div>
                    <div class="col-1 text-center">${tmp.sex}</div>
                    <div class="col-1 text-center">${tmp.countOrder}</div>
                    <div class="col-2 text-center">
                        <span class="money-spend-account">${formatCurrencyVND(tmp.sumPrice)}</span>
                    </div> 
                    <div class="col-1 px-0 text-center">
                        <select name="account-role" class="rounded py-1">
                            <option value="0" ${tmp.role == 1 ? "selected" : ""}>Tài khoản</option>
                            <option value="1" ${tmp.role == 0 ? "selected" : ""}>Admin</option>
                            <option value="2" ${tmp.role == 2 ? "selected" : ""}>Shipper</option>
                        </select>
                    </div>
                    <div class="col-1 text-center">
                        <input type="checkbox" name="lock-account-account" value="#123">
                    </div>
                </div>
            `
            })
            document.querySelector("#table-body").innerHTML = elm;
        }})
}

search_account();
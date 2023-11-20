$(document).ready(function () {
});

function signin(username, password) {
    const account = {
        user: $("#login-email").val(),
        password: $("#login-password").val(),
    };

    if (account.user == "admin") {
        $("#customer_login").attr("action", "page_admin/danh_sach_tai_khoan.jsp")
    }

    // Chuyển đối tượng thành một chuỗi JSON và lưu nó vào sessionStorage
    sessionStorage.setItem("account", JSON.stringify(account));
}
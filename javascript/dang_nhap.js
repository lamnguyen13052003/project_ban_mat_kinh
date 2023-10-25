$(document).ready(function () {
    $("#signin").click(function () {
        const account = {
            user: $("#login-email").val(),
            password: $("#login-password").val(),
        };

        // Chuyển đối tượng thành một chuỗi JSON và lưu nó vào sessionStorage
        sessionStorage.setItem("account", JSON.stringify(account));
    });
});
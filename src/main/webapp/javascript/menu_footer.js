class User {
    constructor() {
    }

    init(id, fullname, avatar, email, password, birthday, sex){
        this.id = id;
        this.fullname = fullname;
        this.avatar = avatar;
        this.email = email;
        this.password = password;
        this.birthday = birthday;
        this.sex = sex;
    }

    setId(id) {
        this.id = id;
    }

    setFullName(fullName){
        this.fullName = fullName;
    }

    setAvatar(avatar){
        this.avatar = avatar;
    }

    setEmail(email) {
        this.email = email;
    }

    setPassword(password){
        this.password = password;
    }

    setBirthday(birthday){
        this.birthday = birthday;
    }

    setSex(sex){
        this.sex = sex;
    }
}

$(document).ready(function () {
    $("input#search").each(function () {
        displayPlaceholder($(this));
    });
});

function displayPlaceholder(element) {
    if (!element.val()) {
        const string = "Nhập tên sản phẩm!       ";
        let val = "";
        let index = 0;
        setInterval(function (char) {
            val += string.charAt(index);
            element.attr("placeholder", val);
            index++;
            if (index === string.length) {
                index = 0;
                val = "";
                element.attr("placeholder", "");
            }
        }, 150);
    }
}

function displayMenuAccount(user) {
    $("#menu").find(".login").addClass("d-none");
    $("#menu").find(".sign-up").addClass("d-none");
    $("#menu").find(".sign-up").after(`<div idUser="${user.id}" class="account col-lg-3 col-md-2 col-sm-2 border-0 px-lg-0">
        <a href="tai_khoan.jsp">
            <button type="button" class="btn d-flex float-lg-end  me-xl-4 me-lg-2" id="button-account">
                <div class="avatar p-1 bg-white rounded-circle d-flex align-items-center justify-content-center" style="width: 25px; height: 25px">
                    <img src="${user.avatar}" alt="avatar.png"  class="d-md-line" width="18" height="18">
                </div>
                <span class="d-lg-block d-md-none ms-2 overflow-x-hidden d-block" style="max-width: 130px; white-space: nowrap">${user.fullName}</span>
            </button>
        </a>
    </div>`);
}

function hidenMenuAccount(){
    $("#menu").find(".account").remove();
    $("#menu").find(".login").removeClass("d-none");
    $("#menu").find(".sign-up").removeClass("d-none");
}
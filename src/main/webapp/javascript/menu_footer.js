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

    linkMenuDisplayProduct();
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

function linkMenuDisplayProduct() {
    $("#offcanvasNavbar").html(`
                        <div class="offcanvas-body">
                            <ul class="navbar-nav m-auto">
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a id-category-group="1" href="product-booth?id-category-group=1&id-category=0&page=1"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        <span>Kính mát</span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="product-booth?id-category-group=1&id-category=1&page=1">Kính mát
                                            nam</a></li>
                                        <li><a class="dropdown-item" href="product-booth?id-category-group=1&id-category=2&page=1">Kính mát
                                            nữ</a></li>
                                        <li><a class="dropdown-item" href="product-booth?id-category-group=1&id-category=3&page=1">Kính
                                            đi ngày và đêm</a></li>
                                        <li><a class="dropdown-item" href="product-booth?id-category-group=1&id-category=4&page=1">Kính đổi
                                            màu</a></li>
                                        <li><a class="dropdown-item" href="product-booth?id-category-group=1&id-category=5&page=1">Kính lọc ánh sáng
                                            xanh</a></li>
                                        <li><a class="dropdown-item"  href="product-booth?id-category-group=1&id-category=6&page=1">Kính Mắt Clip on 2
                                            Lớp</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a id-category-group="2" href="product-booth?id-category-group=2&id-category=0&page=1"
                                       class="nav-link dropdown-toggle px-4 rounded" type="button">
                                        Mắt kính trẻ em
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item"
                                               href="product-booth?id-category-group=2&id-category=7&page=1">Gọng Kính Trẻ Em</a>
                                        </li>
                                        <li><a class="dropdown-item"
                                               href="product-booth?id-category-group=2&id-category=8&page=1">Kính Mát Trẻ Em</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a id-category-group="3" href="product-booth?id-category-group=3&id-category=0&page=1"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        Gọng kính
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="product-booth?id-category-group=3&id-category=9&page=1">Gọng
                                            kính nữa khung</a></li>
                                        <li><a class="dropdown-item" href="product-booth?id-category-group=3&id-category=10&page=1">Gọng
                                            kính khoan</a></li>
                                        <li><a class="dropdown-item" href="product-booth?id-category-group=3&id-category=11&page=1">Gọng
                                            kính tròn</a></li>
                                        <li><a class="dropdown-item" href="product-booth?id-category-group=3&id-category=12&page=1">Gọng
                                            kính titan</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a id-category-group="4" href="product-booth?id-category-group=4&id-category=0&page=1"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        Tròng kính
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item"
                                               href="product-booth?id-category-group=4&id-category=13&page=1">Tròng kính
                                            chống ánh sáng xanh</a></li>
                                        <li><a class="dropdown-item" href="product-booth?id-category-group=4&id-category=14&page=1">Tròng
                                            kính đổi màu</a></li>
                                        <li><a class="dropdown-item" href="product-booth?id-category-group=4&id-category=15&page=1">Tròng
                                            kính màu</a></li>
                                        <li><a class="dropdown-item"
                                               href="product-booth?id-category-group=4&id-category=16&page=1">Tròng kính cho
                                            gọng khoan</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a id-category-group="0" href="product-booth?id-category-group=0&id-category=0&page=1" class="menu-item nav-link px-4 rounded">Khuyến mãi</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="lien_he.jsp" class="nav-link px-4 rounded">Liên hệ</a>
                                </li>
                            </ul>
                        </div>
        `);

    $("#offcanvasNavbarPolicy").html(`
                        <div class="offcanvas-body">
                            <ul class="navbar-nav m-auto">
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a id-category-group="1" href="../product-booth?id-category-group=1&id-category=0&page=1"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        <span>Kính mát</span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="../product-booth?id-category-group=1&id-category=1&page=1">Kính mát
                                            nam</a></li>
                                        <li><a class="dropdown-item" href="../product-booth?id-category-group=1&id-category=2&page=1">Kính mát
                                            nữ</a></li>
                                        <li><a class="dropdown-item" href="../product-booth?id-category-group=1&id-category=3&page=1">Kính
                                            đi ngày và đêm</a></li>
                                        <li><a class="dropdown-item" href="../product-booth?id-category-group=1&id-category=4&page=1">Kính đổi
                                            màu</a></li>
                                        <li><a class="dropdown-item" href="../product-booth?id-category-group=1&id-category=5&page=1">Kính lọc ánh sáng
                                            xanh</a></li>
                                        <li><a class="dropdown-item"  href="../product-booth?id-category-group=1&id-category=6&page=1">Kính Mắt Clip on 2
                                            Lớp</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a id-category-group="2" href="../product-booth?id-category-group=2&id-category=0&page=1"
                                       class="nav-link dropdown-toggle px-4 rounded" type="button">
                                        Mắt kính trẻ em
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item"
                                               href="../product-booth?id-category-group=2&id-category=7&page=1">Gọng Kính Trẻ Em</a>
                                        </li>
                                        <li><a class="dropdown-item"
                                               href="../product-booth?id-category-group=2&id-category=8&page=1">Kính Mát Trẻ Em</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a id-category-group="3" href="../product-booth?id-category-group=3&id-category=0&page=1"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        Gọng kính
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="../product-booth?id-category-group=3&id-category=9&page=1">Gọng
                                            kính nữa khung</a></li>
                                        <li><a class="dropdown-item" href="../product-booth?id-category-group=3&id-category=10&page=1">Gọng
                                            kính khoan</a></li>
                                        <li><a class="dropdown-item" href="../product-booth?id-category-group=3&id-category=11&page=1">Gọng
                                            kính tròn</a></li>
                                        <li><a class="dropdown-item" href="../product-booth?id-category-group=3&id-category=12&page=1">Gọng
                                            kính titan</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a id-category-group="4" href="../product-booth?id-category-group=4&id-category=0&page=1"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        Tròng kính
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item"
                                               href="../product-booth?id-category-group=4&id-category=13&page=1">Tròng kính
                                            chống ánh sáng xanh</a></li>
                                        <li><a class="dropdown-item" href="../product-booth?id-category-group=4&id-category=14&page=1">Tròng
                                            kính đổi màu</a></li>
                                        <li><a class="dropdown-item" href="../product-booth?id-category-group=4&id-category=15&page=1">Tròng
                                            kính màu</a></li>
                                        <li><a class="dropdown-item"
                                               href="../product-booth?id-category-group=4&id-category=16&page=1">Tròng kính cho
                                            gọng khoan</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a id-category-group="0" href="../product-booth?id-category-group=0&id-category=0&page=1" class="menu-item nav-link px-4 rounded">Khuyến mãi</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="../lien_he.jsp" class="nav-link px-4 rounded">Liên hệ</a>
                                </li>
                            </ul>
                        </div>
        `);
}
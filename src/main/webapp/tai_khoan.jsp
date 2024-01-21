<%@ page import="model.bean.User" %>
<%@ page import="model.service.CartService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="bootstrap-5.3.2-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="bootstrap-5.3.2-dist/css/bootstrap.min.css">
    <script src="bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="fontawesome-free-6.4.2-web/css/all.css">
    <link rel="stylesheet" href="css/menu_footer.css">
    <link rel="stylesheet" href="css/tai_khoan.css">
    <link rel="icon" href="images/logo/logo_icon.png">

    <script src="jquery/jquery-3.7.1.slim.min.js"></script>
    <script src="jquery/jquery-3.7.1.min.js"></script>

    <title>Tài khoản</title>
</head>
<%User user = (User) session.getAttribute("user");%>
<body>
<header id="menu">
    <nav class="navbar navbar-expand-lg pb-0">
        <div class="container-xxl m-md-auto mt-2">
            <div class="row">
                <div class="logo col-lg-2 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                    <a href="index.jsp" class="navbar-brand me-5">
                        <img src="images/logo/logo.png" alt="logo.png">
                        KIMI
                    </a>
                </div>
                <div class="search col-lg-5 col-md-6 col-sm-6 border-0 px-lg-0 px-md-5">
                    <form class="d-flex input-group">
                        <input class="form-control border-0 ps-3" type="text" name="search" id="search"
                               placeholder="Nhập tên sản phẩm!">
                        <span class="input-group-text  border-0"><a class="nav-link" href="#"><i
                                class="fa-solid fa-magnifying-glass"></i></a></span>
                    </form>
                </div>
                <div class="login col-lg-2 col-md-1 col-sm-1 border-0 px-lg-0">
                    <a href="dang_nhap.jsp">
                        <button type="button" class="btn d-flex float-lg-end  me-xl-4 me-lg-2">
                            <span class="d-lg-inline d-md-none d-sm-none">Đăng nhập</span>
                            <span class="d-lg-none d-md-line material-symbols-outlined ms-1">login</span>
                        </button>
                    </a>
                </div>
                <div class="sign-up col-lg-1 col-md-1 col-sm-1 border-0 px-lg-0">
                    <a href="dang_ky.jsp">
                        <button type="button" class="btn d-flex float-lg-none">
                            <span class="d-lg-inline d-md-none  d-sm-none">Đăng ký</span>
                            <span class="d-lg-none d-md-line material-symbols-outlined ms-1">logout</span>
                        </button>
                    </a>
                </div>
                <div class="cart col-lg-2 col-md-1 col-sm-1 border-0 px-lg-0">
                    <a href="gio_hang.jsp">
                        <button type="button" class="btn d-flex float-lg-none">
                            <span class="d-lg-inline d-md-none  d-sm-none">Giỏ hàng</span>
                            <span class="icon d-flex">
                                <span class="material-symbols-outlined">
                                    shopping_cart
                                </span>
                                <span id="amount-product" class="amount-product">
                                    <%
                                        CartService cart = (CartService) session.getAttribute("cart");
                                        if (cart == null) cart = new CartService();
                                    %>
                                    <%=cart.getTotalProduct()%>
                                </span>
                            </span>
                        </button>
                    </a>
                </div>
                <div class="menu-product col-lg-12 col-md-1 col-sm-1">
                    <!--Icon 3 dấu gạch mang hiển thị menu-->
                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasNavbar"
                            aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!--Các mục trong menu-->
                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                         aria-labelledby="offcanvasNavbarLabel">
                        <div class="offcanvas-body">
                            <ul class="navbar-nav m-auto">
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="DisplayProduct?idCategoryGroup=1&page=1"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        <span>Kính mát</span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=1&page=1">Kính mát
                                            nam</a></li>
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=2&page=1">Kính mát
                                            nữ</a></li>
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=3&page=1">Kính
                                            đi ngày và đêm</a></li>
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=4&page=1">Kính đổi
                                            màu</a></li>
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=5&page=1">Kính lọc
                                            ánh sáng
                                            xanh</a></li>
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=6&page=1">Kính Mắt
                                            Clip on 2
                                            Lớp</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="DisplayProduct?idCategoryGroup=2&page=1"
                                       class="nav-link dropdown-toggle px-4 rounded" type="button">
                                        Mắt kính trẻ em
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item"
                                               href="DisplayProduct?idCategory=7&page=1">Gọng Kính Trẻ Em</a>
                                        </li>
                                        <li><a class="dropdown-item"
                                               href="DisplayProduct?idCategory=8&page=1">Kính Mát Trẻ Em</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="DisplayProduct?idCategoryGroup=3&page=1"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        Gọng kính
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=9&page=1">Gọng
                                            kính nữa khung</a></li>
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=10&page=1">Gọng
                                            kính khoan</a></li>
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=11&page=1">Gọng
                                            kính tròn</a></li>
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=12&page=1">Gọng
                                            kính titan</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="DisplayProduct?idCategoryGroup=4&page=1"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        Tròng kính
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item"
                                               href="DisplayProduct?idCategory=13&page=1">Tròng kính
                                            chống ánh sáng xanh</a></li>
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=14&page=1">Tròng
                                            kính đổi màu</a></li>
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=15&page=1">Tròng
                                            kính màu</a></li>
                                        <li><a class="dropdown-item"
                                               href="DisplayProduct?idCategory=16&page=1">Tròng kính cho
                                            gọng khoan</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="DisplayProduct?idCategory=0&page=1"
                                       class="menu-item nav-link px-4 rounded">Khuyến mãi</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="lien_he.jsp" class="nav-link px-4 rounded">Liên hệ</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>

<main id="main" class="mt-5 pb-5" user-id="<%=user.getId()%>">
    <div class="container">
        <div class="row justify-content-center">
            <!--Phần menu-->
            <div class="account-page-sidebar col-3">
                <div class="account-sidebar-header list-group align-items-center">
                    <div class="account-sidebar-avatar list-group-item  border-0">
                        <div class="display-avatar p-3 rounded-circle d-flex align-items-center justify-content-center">
                            <img src="images/logo/logo.png" alt="" width="100px" id="avatar">
                        </div>
                        <div class="change-avatar position-absolute">
                            <input class="d-none" type="file" accept="image/jpeg,image/png" id="input-avatar">
                            <label for="input-avatar"><i class="fa-solid fa-user-pen fs-5"></i></label>
                        </div>
                    </div>
                    <div class="account-sidevar-name list-group-item  border-0">
                        <h3>Hi, <b>Nguyễn Lam</b></h3>
                    </div>
                </div>
                <div class="account-sidebar-menu mt-3">
                    <ul>
                        <li>
                            <button class="active" data-bs-target="0">Thông tin tài khoản</button>
                        </li>
                        <li>
                            <button data-bs-target="1" class="bill-history">Lịch sử mua hàng</button>
                        </li>
                        <li>
                            <button data-bs-target="2">Đánh giá sản phẩm</button>
                        </li>
                        <li>
                            <a href="logout">
                                <button id="logout">Đăng xuất</button>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <!--Phần trang-->
            <div class="main-content col-9">
                <!--Bắt đầu page-->
                <div class="page-content account-page-content active">
                    <span class="fs-1 title-page-content">Thông tin tài khoản</span>
                    <div class="body-page-content account-page-detail account-page-info mt-3">
                        <div class="table-responsive">
                            <div class="table overflow-x-hidden  pb-5">
                                <div class="row">
                                    <div class="col-4"><span>Email</span></div>
                                    <div class="col-8 "><span>kiminonawa1305@gmail.com</span></div>
                                </div>
                                <div class="row">
                                    <div class="col-4"><span>Mật khẩu</span></div>
                                    <div class="col-8 "><span>*********************</span></div>
                                </div>
                                <div class="row">
                                    <div class="col-4"><span>Họ tên</span></div>
                                    <div class="col-8 "><span>Nguyễn Đình Lam</span></div>
                                </div>
                                <div class="row">
                                    <div class="col-4"><span>Giới tính</span></div>
                                    <div class="col-8">
                                        <span>Nam</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4"><span>Ngày sinh</span></div>
                                    <div class="col-8"><span>13/05/2003</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Kết thúc page-->

                <!--Bắt đầu page-->
                <div class="page-content bill-history-page-content">
                    <span class="fs-1 title-page-content">Lịch sử mua hàng</span>
                    <div class="body-page-content mt-2">
                        <div class="menu menu-bill">
                            <button type="button" class="menu-item menu-bill-item active" data-action="">
                                Tất cả
                            </button>
                            <button type="button" class="menu-item menu-bill-item" data-action="Chờ xác nhận">
                                Chờ xác nhận
                            </button>
                            <button type="button" class="menu-item menu-bill-item" data-action="Đang vận chuyển">
                                Vận chuyển
                            </button>
                            <button type="button" class="menu-item menu-bill-item" data-action="Thành công">
                                Thành công
                            </button>
                            <button type="button" class="menu-item menu-bill-item" data-action="Đã hủy">
                                Đã hủy
                            </button>
                        </div>
                        <div class="display-content display-bills">
                        </div>
                    </div>
                </div>
                <!--Kết thúc page-->

                <!--Bắt đầu page-->
                <div class="page-content review-page-content">
                    <span class="fs-1 title-page-content">Đánh giá sản phẩm!</span>
                    <div class="body-page-content mt-2">
                        <div class="menu menu-review">
                            <button type="button" class="menu-item menu-review-item active" data-action="Chưa đánh giá">
                                Chưa đánh giá
                            </button>
                            <button type="button" class="menu-item menu-review-item" data-action="Đã đánh giá">
                                Đã đánh giá
                            </button>
                        </div>
                        <div class="display-content display-reviews">
                            <div class="body-bill-item row  align-items-center ms-2">
                                <div class="bill-id col-2"><span>#3</span></div>
                                <div class="col-9 d-flex">
                                    <div>
                                        <img style="width: 35px" class="rounded-circle" src="images/avatar/default_avatar.png"></img>
                                    </div>
                                    <div class="customer-info ms-2 w-100">
                                        <p class="customer-name">Nguyễn Đình Lam Đẹp Zai Nhất</p>
                                        <p class="customer-email">kiminonawa1305@gmail.com</p>
                                    </div>
                                </div>
                                <div class="bill-edit col-1">
                                    <a href="review?action=write-review&bill-id=3&product-id=3">
                                       <span class="material-symbols-outlined">rate_review</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Kết thúc page-->
            </div>
        </div>
    </div>
</main>

<footer id="footer" class="footer">
    <div class="container">
        <div class="footer-top row">
            <div class="footer-top-item col">
                <h5>Mắt Kính KIMI
                </h5>
                <div class="footer-content footer-contact">
                    <div class="ft_map">
                    </div>
                    <ul>
                        <li class="contact-1"><i class="fa-solid fa-map-location-dot px-1"></i><span
                                class="px-1">Khu phố 6, Phường Linh Trung, Quận Thủ Đức, TP. Hồ Chí Minh</span>
                        </li>
                        <li class="contact-2"><i class="fa-solid fa-phone px-1"></i><b><span
                                class="px-1">0855354919</span></b> ( 9:00 - 21:00 )
                        </li>
                        <li class="contact-3"><i class="fa-solid fa-business-time px-1"></i><span class="px-1">9:00 - 20:00 ( Kể cả T7 và CN )</span>
                        </li>
                        <li class="contact-4"><i class="fa-solid fa-envelope px-1"></i><span class="px-1">matkinhkimi@gmail.com</span>
                        </li>
                        <li class="contact-5"><a href="https://www.facebook.com/profile.php?id=100045667640701"><i
                                class="fa-brands fa-facebook-f px-1"></i><span
                                class="px-1 hover"><b>KIMI</b> </span></a></li>
                        <li class="contact-6"><p>Kiểm tra thị lực miễn phí &amp; cắt kính lấy liền.</p></li>
                        <li class="contact-7"><p>Hỗ trợ trả góp lãi suất 0% thẻ tín dụng.</p></li>
                    </ul>
                </div>
            </div>

            <div class="footer-top-item col">
                <h5>HỖ TRỢ KHÁCH HÀNG
                </h5>
                <div class="footer-content footer-contact">
                    <div class="ft_map">

                    </div>
                    <ul>
                        <li><a class="hover" href="policy_pages/huong_dan_mua_hang_online.jsp">Hướng dẫn mua hàng
                            online</a></li>
                        <li><a class="hover" href="policy_pages/chinh_sach_thanh_toan_va_giao_nhan.jsp">Chính sách
                            thanh toán, giao nhận</a></li>
                        <li><a class="hover" href="policy_pages/chinh_sach_bao_mat.jsp">Chính sách bảo mật</a></li>
                        <li><a class="hover" href="policy_pages/chinh_sach_bao_hanh.jsp">Chính sách bảo hành</a></li>
                        <li><a class="hover" href="policy_pages/chinh_sach_doi_tra_va_hoan_tien.jsp">Chính sách đổi
                            trả và hoàn tiền</a></li>
                        <li><a class="hover" href="policy_pages/kiem_tra_don_hang.jsp">Kiểm tra đơn hàng</a></li>
                    </ul>
                </div>

            </div>
        </div>
        <div class="row footer-bot text-center border-3">
            <div class="logo col-lg-3 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                <a href="index.jsp">
                    <img src="images/logo/logo.png" alt="logo.png">
                    <span>KIMI</span>
                </a>
            </div>
            <div class="col"><span>© 2023 - Tất cả các quyền thuộc về KIMI</span></div>
        </div>
    </div>
</footer>
<script src="javascript/menu_footer.js"></script>
<script src="javascript/tai_khoan.js"></script>
<script type="text/javascript">
    <%if(user != null){%>
    const user = new User();
    user.setId(<%=user.getId()%>);
    user.setAvatar("<%=user.getAvatar()%>");
    user.setFullName("<%=user.getFullName()%>");
    displayMenuAccount(user);
    <%} else{%>
    hidenMenuAccount();
    <%}%>
</script>
</body>
</html>
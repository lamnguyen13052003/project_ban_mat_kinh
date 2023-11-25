<%@ page import="model.bean.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="bootstrap-5.3.2-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="bootstrap-5.3.2-dist/css/bootstrap.min.css">
    <script src="bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="fontawesome-free-6.4.2-web/css/all.css">
    <link rel="stylesheet" href="css/menu_footer.css">
    <link rel="stylesheet" href="css/gio_hang.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="icon" href="logo_icon.png">

    <script src="jquery/jquery-3.7.1.slim.min.js"></script>
    <script src="jquery/jquery-3.7.1.min.js"></script>

    <title>Giỏ hàng</title>
</head>
<body>
<header id="menu">
    <nav class="navbar navbar-expand-lg pb-0">
        <div class="container-xxl m-md-auto mt-2">
            <div class="row">
                <div class="logo col-lg-2 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                    <a href="index.jsp" class="navbar-brand me-5">
                        <img src="logo.png" alt="logo.png">
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
                        <button type="button" class="btn d-flex float-lg-none active">
                            <span class="d-lg-inline d-md-none  d-sm-none">Giỏ hàng</span>
                            <span class="icon d-flex">
                                <span class="material-symbols-outlined">
                                    shopping_cart
                                </span>
                                <span id="amount-product" class="amount-product">0</span>
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
                                    <a href="product/kinh_mat/kinh_mat.jsp"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        <span>Kính mát</span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="product/kinh_mat/kinh_mat_nam.jsp">Kính mát
                                            nam</a></li>
                                        <li><a class="dropdown-item" href="product/kinh_mat/kinh_mat_nu.jsp">Kính mát
                                            nữ</a></li>
                                        <li><a class="dropdown-item" href="product/kinh_mat/kinh_mat_ngay_va_dem.jsp">Kính
                                            đi ngày và đêm</a></li>
                                        <li><a class="dropdown-item" href="product/kinh_mat/kinh_doi_mau.jsp">Kính đổi
                                            màu</a></li>
                                        <li><a class="dropdown-item"
                                               href="product/kinh_mat/kinh_loc_anh_sang_xanh.jsp">Kính lọc ánh sáng
                                            xanh</a></li>
                                        <li><a class="dropdown-item"
                                               href="product/kinh_mat/kinh_mat_clip_on_hai_lop.jsp">Kính Mắt Clip on 2
                                            Lớp</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="product/mat_kinh_tre_em/mat_kinh_tre_em.jsp"
                                       class="nav-link dropdown-toggle px-4 rounded" type="button">
                                        Mắt kính trẻ em
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item"
                                               href="product/mat_kinh_tre_em/gong_kinh_tre_em.jsp">Gọng Kính Trẻ Em</a>
                                        </li>
                                        <li><a class="dropdown-item"
                                               href="product/mat_kinh_tre_em/kinh_mat_tre_em.jsp">Kính Mát Trẻ Em</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="product/gong_kinh/gong_kinh.jsp"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        Gọng kính
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="product/gong_kinh/gong_kinh_nua_khung.jsp">Gọng
                                            kính nữa khung</a></li>
                                        <li><a class="dropdown-item" href="product/gong_kinh/gong_kinh_khoan.jsp">Gọng
                                            kính khoan</a></li>
                                        <li><a class="dropdown-item" href="product/gong_kinh/gong_kinh_tron.jsp">Gọng
                                            kính tròn</a></li>
                                        <li><a class="dropdown-item" href="product/gong_kinh/gong_kinh_titan.jsp">Gọng
                                            kính titan</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="product/trong_kinh/trong_kinh.jsp"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        Tròng kính
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item"
                                               href="product/trong_kinh/trong_kinh_chong_anh_sang_xanh.jsp">Tròng kính
                                            chống ánh sáng xanh</a></li>
                                        <li><a class="dropdown-item" href="product/trong_kinh/trong_kinh_doi_mau.jsp">Tròng
                                            kính đổi màu</a></li>
                                        <li><a class="dropdown-item" href="product/trong_kinh/trong_kinh_mau.jsp">Tròng
                                            kính màu</a></li>
                                        <li><a class="dropdown-item"
                                               href="product/trong_kinh/trong_kinh_cho_gong_khoan.jsp">Tròng kính cho
                                            gọng khoan</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="khuyen_mai.jsp" class="nav-link px-4 rounded">Khuyến mãi</a>
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

<main id="main" class="mt-5 pb-5">
    <div class="container rounded cart">
        <form>
            <div class="row no-gutters">
                <div class="col-md-8">
                    <div class="product-details mr-2">
                        <!--Quay về-->
                        <div class="d-flex flex-row align-items-center">
                            <a href="index.jsp">
                                <i class="fa fa-long-arrow-left"></i>
                                <span class="ms-2">Quay lại trang chủ</span>
                            </a>
                        </div>
                        <hr>
                        <!--Phần header-->
                        <div class="cart-header">
                            <h6 class="mb-0">Giỏ hàng</h6>
                            <div class="d-flex justify-content-between">
                                <span>Bạn đang có 4 sản phẩm</span>
                            </div>
                        </div>
                        <!--Danh sách sản phẩm-->
                        <div class="list-product cart-body" id="list-product">
                            <!--Sản phẩm-->
                            <div class="product">
                                <input type="checkbox" name="select-product">
                                <div class="info-product">
                                    <img class="rounded"
                                         src="images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-JC052/gong-kinh-can-tre-em-hato-052-s01_master.png">
                                    <div class="ms-2">
                                        <span class="fw-bold d-block name-product">Gọng kính cận trẻ em 1</span>
                                        <span class="option">Màu xanh</span>
                                    </div>
                                </div>
                                <div class="change-amount">
                                    <button type="button" class="down"><span
                                            class="material-symbols-outlined">arrow_left</span></button>
                                    <input type="number" name="amount-product"
                                           class="amount-product" min="1" value="1" disabled>
                                    <button type="button" class="up"><span
                                            class="material-symbols-outlined">arrow_right</span></button>
                                </div>
                                <div class="price">
                                    <span class="price">120,000</span>
                                    <span>₫</span>
                                </div>
                                <div class="total-price">
                                    <span class="total-money">120,000</span>
                                    <span>₫</span>
                                </div>
                                <button class="cancel text-danger">x</button>
                            </div>
                            <!--Kết thúc sản phẩm-->
                            <!--Sản phẩm-->
                            <div class="product">
                                <input type="checkbox" name="select-product">
                                <div class="info-product">
                                    <img class="rounded"
                                         src="images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-JC052/gong-kinh-can-tre-em-hato-052-s01_master.png">
                                    <div class="ms-2">
                                        <span class="fw-bold d-block name-product">Gọng kính cận trẻ em 2</span>
                                        <span class="option">Màu xanh</span>
                                    </div>
                                </div>
                                <div class="change-amount">
                                    <button type="button" class="down"><span
                                            class="material-symbols-outlined">arrow_left</span></button>
                                    <input type="number" name="amount-product"
                                           class="amount-product " min="1" value="1" disabled>
                                    <button type="button" class="up"><span
                                            class="material-symbols-outlined">arrow_right</span></button>
                                </div>
                                <div class="price">
                                    <span class="price">120,000</span>
                                    <span>₫</span>
                                </div>
                                <div class="total-price">
                                    <span class="total-money">120,000</span>
                                    <span>₫</span>
                                </div>
                                <button class="cancel text-danger">x</button>
                            </div>
                            <!--Kết thúc sản phẩm-->
                            <!--Sản phẩm-->
                            <div class="product">
                                <input type="checkbox" name="select-product">
                                <div class="info-product">
                                    <img class="rounded"
                                         src="images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-JC052/gong-kinh-can-tre-em-hato-052-s01_master.png">
                                    <div class="ms-2">
                                        <span class="fw-bold d-block name-product">Gọng kính cận trẻ em 3</span>
                                        <span class="option">Màu xanh</span>
                                    </div>
                                </div>
                                <div class="change-amount">
                                    <button type="button" class="down"><span
                                            class="material-symbols-outlined">arrow_left</span></button>
                                    <input type="number" name="amount-product"
                                           class="amount-product " min="1" value="1" disabled>
                                    <button type="button" class="up"><span
                                            class="material-symbols-outlined">arrow_right</span></button>
                                </div>
                                <div class="price">
                                    <span class="price">120,000</span>
                                    <span>₫</span>
                                </div>
                                <div class="total-price">
                                    <span class="total-money">120,000</span>
                                    <span>₫</span>
                                </div>
                                <button class="cancel text-danger">x</button>
                            </div>
                            <!--Kết thúc sản phẩm-->
                            <!--Sản phẩm-->
                            <div class="product">
                                <input type="checkbox" name="select-product">
                                <div class="info-product">
                                    <img class="rounded"
                                         src="images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-JC052/gong-kinh-can-tre-em-hato-052-s01_master.png">
                                    <div class="ms-2">
                                        <span class="fw-bold d-block name-product">Gọng kính cận trẻ em 4</span>
                                        <span class="option">Màu xanh</span>
                                    </div>
                                </div>
                                <div class="change-amount">
                                    <button type="button" class="down"><span
                                            class="material-symbols-outlined">arrow_left</span></button>
                                    <input type="number" name="amount-product"
                                           class="amount-product " min="1" value="1" disabled>
                                    <button type="button" class="up"><span
                                            class="material-symbols-outlined">arrow_right</span></button>
                                </div>
                                <div class="price">
                                    <span class="price">120,000</span>
                                    <span>₫</span>
                                </div>
                                <div class="total-price">
                                    <span class="total-money">120,000</span>
                                    <span>₫</span>
                                </div>
                                <button class="cancel text-danger">x</button>
                            </div>
                            <!--Kết thúc sản phẩm-->
                        </div>
                    </div>
                </div>
                <!--Thanh toán-->
                <div class="col-md-4" id="pay">
                    <div class="payment-info">
                        <div class="d-flex justify-content-between align-items-center">
                            <span>Thanh toán</span>
                        </div>
                        <!--Hình thức thanh toán-->
                        <div class="pay-option">
                            <span class="type d-block mt-3 mb-1">Hình thức thanh toán</span>
                            <div class="list-option-pay pb-2">
                                <label class="radio" for="cash">
                                    <input type="radio" name="pay" value="cash" id="cash" checked>
                                    <span>
                                        <img src="images/icon/cash.png" alt="cash.png" >
                                    </span>
                                </label>
                                <label for="transfer" class="radio" data-bs-toggle="modal" data-bs-target="#qr-pay">
                                    <input type="radio" name="pay" value="transfer" id="transfer">
                                    <span>
                                        <img src="images/icon/transfer.png" alt="cash.png">
                                    </span>
                                </label>
                            </div>
                        </div>
                        <div class="form-info">
                            <form action="">
                                <div>
                                    <label class="credit-pay-label" for="full-name">Họ và tên <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control info-payer" placeholder="Họ và tên"
                                           id="full-name"></div>
                                <div>
                                    <label class="credit-pay-label" for="phone-number">Số điện thoại <span
                                            class="text-danger">*</span></label>
                                    <input type="tel" class="form-control info-payer" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" required
                                           placeholder="Nhập số điện thoại"
                                           id="phone-number">
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="credit-pay-label" for="tp-tinh">Thành phố/Tỉnh:</label>
                                        <select class="form-control info-payer" id="tp-tinh">
                                            <option value="hanoi">Hà Nội</option>
                                            <option value="hochiminh">Hồ Chí Minh</option>
                                            <option value="danang">Đà Nẵng</option>
                                            <option value="hue">Huế</option>
                                            <option value="haiduong">Hải Dương</option>
                                            <!-- Thêm các tỉnh/thành phố khác ở đây -->
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="credit-pay-label" for="quan-huyen">Quận/Huyện</label>
                                        <select id="quan-huyen" name="quan-huyen" class="form-control info-payer">
                                            <option value="quan1">Quận 1</option>
                                            <option value="quan2">Quận 2</option>
                                            <option value="quan3">Quận 3</option>
                                            <option value="quan4">Quận 4</option>
                                            <option value="quan5">Quận 5</option>
                                            <!-- Thêm các quận/huyện khác ở đây -->
                                        </select>
                                    </div>
                                </div>
                                <div>
                                    <label class="credit-pay-label" for="full-address">Địa chỉ cụ thể <span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control info-payer" required
                                           placeholder="số xx, thôn xx, huyện xx, tỉnh xx" id="full-address">
                                </div>
                            </form>
                        </div>
                        <hr class="line">
                        <div class="money">
                            <div class="d-flex justify-content-between information">
                                <span>Tổng hóa đơn</span>
                                <p class="m-0 p-0">
                                    <span>3,000,000</span>
                                    <span>₫</span>
                                </p>
                            </div>
                            <div class="d-flex justify-content-between information">
                                <span>Phí ship</span>
                                <p class="m-0 p-0">
                                    <span>20,000</span>
                                    <span>₫</span>
                                </p>
                            </div>
                            <div class="d-flex justify-content-between information">
                                <span>Tổng trả: </span>
                                <p class="m-0 p-0">
                                    <span>3,020,000</span>
                                    <span>₫</span>
                                </p>
                            </div>
                            <a href="thanh_toan_thanh_cong.jsp">
                                <button class="btn btn-primary btn-block d-flex justify-content-center mt-3 w-100"
                                        type="button">
                                    <span>Thanh toán<i class="fa fa-long-arrow-right ms-1"></i></span>
                                </button>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="qr-pay" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                     aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog ">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Mã thanh toán</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <img src="images/qr.png" alt="qr.png">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>

<footer id="footer" class="footer">
    <div class="container ">
        <div class="footer-top row">
            <div class="footer-top-item col">
                <h5>Mắt Kính KIMI
                </h5>
                <div class="footer-content footer-contact">
                    <div class="ft_map">

                    </div>
                    <ul>
                        <li class="contact-1"><i class="fa-solid fa-map-location-dot px-1"></i><span class="px-1">Khu phố 6, Phường Linh Trung, Quận Thủ Đức, TP. Hồ Chí Minh</span>
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
                        <li><a class="hover" href="policy_pages/chinh_sach_thanh_toan_va_giao_nhan.jsp">Chính sách thanh
                            toán, giao nhận</a></li>
                        <li><a class="hover" href="policy_pages/chinh_sach_bao_mat.jsp">Chính sách bảo mật</a></li>
                        <li><a class="hover" href="policy_pages/chinh_sach_bao_hanh.jsp">Chính sách bảo hành</a></li>
                        <li><a class="hover" href="policy_pages/chinh_sach_doi_tra_va_hoan_tien.jsp">Chính sách đổi trả và
                            hoàn tiền</a></li>
                        <li><a class="hover" href="policy_pages/kiem_tra_don_hang.jsp">Kiểm tra đơn hàng</a></li>
                    </ul>
                </div>

            </div>
        </div>
        <div class="row footer-bot text-center border-3">
            <div class="logo col-lg-3 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                <a href="index.jsp">
                    <img src="logo.png" alt="logo.png">
                    <span>KIMI</span>
                </a>
            </div>
            <div class="col"><span>© 2023 - Tất cả các quyền thuộc về KIMI</span></div>
        </div>
    </div>
</footer>
<script src="javascript/menu_footer.js"></script>
<script src="javascript/gio_hang.js"></script>
<script type="text/javascript">
    <%User user = (User) session.getAttribute("user");
    if(user != null){%>
    const user = new User();
    user.setId(<%=user.getId()%>);
    user.setAvatar("images/avatar/<%=user.getAvatar()%>");
    user.setFullName("<%=user.getFullName()%>");
    displayMenuAccount(user);
    <%} else{%>
    hidenMenuAccount();
    <%}%>
</script>
</body>
</html>
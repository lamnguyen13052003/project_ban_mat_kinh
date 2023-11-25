<%@ page import="model.bean.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../bootstrap-5.3.2-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../bootstrap-5.3.2-dist/css/bootstrap.min.css">
    <script src="../bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../fontawesome-free-6.4.2-web/css/all.css">
    <link rel="stylesheet" href="../css/menu_footer.css">
    <link rel="icon" href="../logo_icon.png">

    <script src="../jquery/jquery-3.7.1.slim.min.js"></script>
    <script src="../jquery/jquery-3.7.1.min.js"></script>

    <title>Thế giới mắt kính</title>
</head>
<body>
<header id="menu">
    <nav class="navbar navbar-expand-lg pb-0">
        <div class="container-xxl m-md-auto mt-2">
            <div class="row">
                <div class="logo col-lg-2 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                    <a href="../index.jsp" class="navbar-brand me-5">
                        <img src="../logo.png" alt="logo.png">
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
                    <a href="../dang_nhap.jsp">
                        <button type="button" class="btn d-flex float-lg-end  me-xl-4 me-lg-2">
                            <span class="d-lg-inline d-md-none d-sm-none">Đăng nhập</span>
                            <span class="d-lg-none d-md-line material-symbols-outlined ms-1">login</span>
                        </button>
                    </a>
                </div>
                <div class="sign-up col-lg-1 col-md-1 col-sm-1 border-0 px-lg-0">
                    <a href="../dang_ky.jsp">
                        <button type="button" class="btn d-flex float-lg-none">
                            <span class="d-lg-inline d-md-none  d-sm-none">Đăng ký</span>
                            <span class="d-lg-none d-md-line material-symbols-outlined ms-1">logout</span>
                        </button>
                    </a>
                </div>
                <div class="cart col-lg-2 col-md-1 col-sm-1 border-0 px-lg-0">
                    <a href="../gio_hang.jsp">
                        <button type="button" class="btn d-flex float-lg-none">
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
                                    <a href="../product/kinh_mat/kinh_mat.jsp"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        <span>Kính mát</span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="../product/kinh_mat/kinh_mat_nam.jsp">Kính
                                            mát
                                            nam</a></li>
                                        <li><a class="dropdown-item" href="../product/kinh_mat/kinh_mat_nu.jsp">Kính
                                            mát
                                            nữ</a></li>
                                        <li><a class="dropdown-item"
                                               href="../product/kinh_mat/kinh_mat_ngay_va_dem.jsp">Kính
                                            đi ngày và đêm</a></li>
                                        <li><a class="dropdown-item" href="../product/kinh_mat/kinh_doi_mau.jsp">Kính
                                            đổi
                                            màu</a></li>
                                        <li><a class="dropdown-item"
                                               href="../product/kinh_mat/kinh_loc_anh_sang_xanh.jsp">Kính lọc ánh sáng
                                            xanh</a></li>
                                        <li><a class="dropdown-item"
                                               href="../product/kinh_mat/kinh_mat_clip_on_hai_lop.jsp">Kính Mắt Clip on
                                            2
                                            Lớp</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="../product/mat_kinh_tre_em/mat_kinh_tre_em.jsp"
                                       class="nav-link dropdown-toggle px-4 rounded" type="button">
                                        Mắt kính trẻ em
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item"
                                               href="../product/mat_kinh_tre_em/gong_kinh_tre_em.jsp">Gọng Kính Trẻ
                                            Em</a>
                                        </li>
                                        <li><a class="dropdown-item"
                                               href="../product/mat_kinh_tre_em/kinh_mat_tre_em.jsp">Kính Mát Trẻ
                                            Em</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="../product/gong_kinh/gong_kinh.jsp"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        Gọng kính
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item"
                                               href="../product/gong_kinh/gong_kinh_nua_khung.jsp">Gọng
                                            kính nữa khung</a></li>
                                        <li><a class="dropdown-item" href="../product/gong_kinh/gong_kinh_khoan.jsp">Gọng
                                            kính khoan</a></li>
                                        <li><a class="dropdown-item" href="../product/gong_kinh/gong_kinh_tron.jsp">Gọng
                                            kính tròn</a></li>
                                        <li><a class="dropdown-item" href="../product/gong_kinh/gong_kinh_titan.jsp">Gọng
                                            kính titan</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="../product/trong_kinh/trong_kinh.jsp"
                                       class="nav-link dropdown-toggle px-4 rounded"
                                       type="button">
                                        Tròng kính
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item"
                                               href="../product/trong_kinh/trong_kinh_chong_anh_sang_xanh.jsp">Tròng
                                            kính
                                            chống ánh sáng xanh</a></li>
                                        <li><a class="dropdown-item"
                                               href="../product/trong_kinh/trong_kinh_doi_mau.jsp">Tròng
                                            kính đổi màu</a></li>
                                        <li><a class="dropdown-item" href="../product/trong_kinh/trong_kinh_mau.jsp">Tròng
                                            kính màu</a></li>
                                        <li><a class="dropdown-item"
                                               href="../product/trong_kinh/trong_kinh_cho_gong_khoan.jsp">Tròng kính
                                            cho
                                            gọng khoan</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="../khuyen_mai.jsp" class="nav-link px-4 rounded">Khuyến mãi</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="../lien_he.jsp" class="nav-link px-4 rounded">Liên hệ</a>
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
    <div class="container">
        <div class="title mb-5">
            <div class="h1">HƯỚNG DẪN MUA HÀNG ONLINE</div>
            <div>
                <span>Khi mua hàng Online, bạn có thể lựa chọn một trong cách mua hàng sau.</span>
            </div>
        </div>
        <div class="tutorial">
            <div class="way mb-5">
                <span class="h5 fw-bold text-decoration-underline d-block mb-4">Cách 1:</span>
                <div class="text">
                    <span>
                        Gọi điện đến tổng đài (Miễn phí cuộc gọi đến) 0855354919 từ 8h30 đến 20h00 tất cả các ngày trong tuần. Nhân viên bán hàng Online sẽ ghi nhận thông tin đặt hàng của bạn.
                    </span>
                </div>
            </div>
            <div class="way">
                <p class="h5">
                    <span class="fw-bold text-decoration-underline">Cách 2:</span>
                    <span>Đặt hàng trên website</span>
                </p>
                <div class="step">
                    <p>
                        <span class="h6 text-decoration-underline fw-bold">Bước 1:</span>
                        <span>Bạn có thể truy cập vào website matkinhkimi.com.vn và thực hiện các cách đặt hàng đơn giản sau:</span>
                    </p>
                    <p class="ms-4">- Nhập thông tin khi đã biết sản phẩm vào ô tìm kiếm, bạn sẽ có kết quả ngay sau khi
                        hoàn thành.</p>
                    <p class="ms-4">- Click vào từng danh mục sản phẩm để tìm kiếm</p>
                    <p class="ms-4">- Chat để được tư vấn và đặt hàng vào ô chát góc bên phải của màn hình</p>
                </div>
                <div class="step">
                    <p>
                        <span class="h6 text-decoration-underline fw-bold">Bước 2: </span>
                        <span>Tìm được sản phẩm cần mua:</span>
                    </p>
                    <p class="ms-4">- Sau khi tìm được sản phẩm cần mua, bạn tiến hành đặt hàng hoặc nếu muốn mua thêm
                        các sản phẩm khác bạn hãy thêm sản phẩm vào giỏ hàng và quay trở lại sản phẩm khác để tiến hàng
                        mua thêm.</p>
                    <p class="ms-4 mt-5">* Qúa trình này có thể lặp lại cho đến khi quý khách hoàn tất việc bỏ tất cả
                        các sản phẩm cần đặt mua vào giỏ hàng. </p>
                    <p class="ms-4">- Tại trang giỏ hàng, bạn có thể bấm nút "Xoá" nếu muốn huỷ sản phẩm đã chọn để mua
                        sản phẩm khác.</p>
                    <p class="ms-4">- Sau khi đã chọn được sản phẩm cần mua, bạn bấm vào nút THANH TOÁN và điền đầy đủ
                        thông tin cá nhân bảng thông tin</p>
                    <p class="ms-4 mt-5">* Thông tin cá nhân người nhận hàng cần được điền chính xác và đầy đủ để sản
                        phẩm đến tay khách hàng nhanh nhất.</p>
                    <p class="ms-4">- Chọn hình thức thanh toán</p>
                    <p class="ms-5">+ Thanh toán khi nhận hàng</p>
                    <p class="ms-5">+ Thanh toán online qua cổng Napas bằng thẻ ATM nội địa</p>
                    <p class="ms-5">+ Thanh toán online qua cổng Napas bằng thẻ Visa/Master Card</p>
                    <p class="ms-4">- Nếu có mã giảm giá, bạn hãy điền đầy đủ ngay dưới ô <span class="h5 fw-bold">"MÃ GIẢM GIÁ"</span>
                    </p>
                    <p class="ms-4">- Sau khi điền đầy đủ thông tin và kiểm tra lại đơn hàng, giá tiền, bạn hãy bấm vào
                        nút <span class="fw-bold h5">HOÀN TẤT ĐƠN HÀNG</span> gửi về cho Hato.</p>
                    <p class="ms-4">- Hato sẽ gửi cho bạn Email hoặc sẽ gọi điện lại để xác nhận đơn hàng và thông tin
                        giao hàng.</p>
                </div>
            </div>
        </div>
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
                        <li><a class="hover" href="huong_dan_mua_hang_online.jsp">Hướng dẫn mua hàng online</a>
                        </li>
                        <li><a class="hover" href="chinh_sach_thanh_toan_va_giao_nhan.jsp">Chính sách thanh toán,
                            giao nhận</a></li>
                        <li><a class="hover" href="chinh_sach_bao_mat.jsp">Chính sách bảo mật</a></li>
                        <li><a class="hover" href="chinh_sach_bao_hanh.jsp">Chính sách bảo hành</a></li>
                        <li><a class="hover" href="chinh_sach_doi_tra_va_hoan_tien.jsp">Chính sách đổi trả và hoàn
                            tiền</a></li>
                        <li><a class="hover" href="kiem_tra_don_hang.jsp">Kiểm tra đơn hàng</a></li>
                    </ul>
                </div>

            </div>
        </div>
        <div class="row footer-bot text-center border-3">
            <div class="logo col-lg-3 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                <a href="../index.jsp">
                    <img src="../logo.png" alt="logo.png">
                    <span>KIMI</span>
                </a>
            </div>
            <div class="col"><span>© 2023 - Tất cả các quyền thuộc về KIMI</span></div>
        </div>
    </div>
</footer>

<script src="../javascript/menu_footer.js"></script>
<script src="../javascript/chinh_sach.js"></script>
<script type="text/javascript">
    <%User user = (User) session.getAttribute("user");
    if(user != null){%>
    const user = new User();
    user.setId(<%=user.getId()%>);
    user.setAvatar("../images/avatar/<%=user.getAvatar()%>");
    user.setFullName("<%=user.getFullName()%>");
    displayMenuAccount(user);
    <%} else{%>
    hidenMenuAccount();
    <%}%>
</script>
</body>
</html>
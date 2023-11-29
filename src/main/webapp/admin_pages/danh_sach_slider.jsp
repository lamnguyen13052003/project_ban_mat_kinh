<%@ page import="model.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.ReviewImage" %>
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
    <link rel="stylesheet" href="css/danh_sach_slider.css">
    <link rel="icon" href="logo_icon.png">

    <script src="jquery/jquery-3.7.1.slim.min.js"></script>
    <script src="jquery/jquery-3.7.1.min.js"></script>

    <title>Danh sách hình ảnh trong thanh trượt</title>
</head>
<body>
<header id="menu">
    <nav class="navbar navbar-expand-lg pb-0">
        <div class="container-xxl m-md-auto mt-2">
            <div class="row">
                <div class="logo col-lg-2 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                    <a href="danh_sach_tai_khoan.jsp" class="navbar-brand me-5">
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
                                    <a href="danh_sach_tai_khoan.jsp" class="nav-link px-4 rounded">Danh sách khách
                                        hàng</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="danh_sach_san_pham.jsp" class="nav-link px-4 rounded">Danh sách sản
                                        phẩm</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="danh_sach_hoa_don.jsp" class="nav-link px-4 rounded ">Danh sách hóa
                                        đơn</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="../banner" class="nav-link px-4 rounded active">Danh sách hình
                                        ảnh thanh trượt</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>

<div id="main" class="mt-5 pb-5">
    <div class="container">
        <div class="frame-boder row p-3 my-5">
            <div class="title"><span>Danh sách hình ảnh trong thanh trượt</span></div>
            <div class="col-10">
                <div class="edit-img row row-cols-2">
                    <%
                            List<ReviewImage>   urls = (List<ReviewImage>) request.getAttribute("slideShowImages");
                            for(ReviewImage ri : urls){
                    %>
                    <div class="p-3">
                        <div class="item-img col">
                            <img class="img-fluid " name="slideShowImages"  src="<%=ri.getUrlImage()%>" alt="">
                            <div class="check-box-img">
                                <input class="form-check-input " type="checkbox" id="check-img-01">
                            </div>
                        </div>
                    </div>
                    <% }
                   %>
                    <div class="p-3 d-none">
                        <div class="item-img col">
                            <img class="img-fluid z-0" src="images/img_slide/slideShow_2.png" alt="">
                            <div class="check-box-img">
                                <input class="form-check-input " type="checkbox" value="" id="check-img-02">
                            </div>
                        </div>
                    </div>
                    <div class="p-3 d-none">
                        <div class="item-img col">
                            <img class="img-fluid z-0" src="images/img_slide/slideShow_3_resize1.png" alt="">
                            <div class="check-box-img">
                                <input class="form-check-input " type="checkbox" value="" id="check-img-03">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-2 p-4">
                <div class="btn-edit-img row row-cols-1 ">
                    <button class="remove-img col" type="button"><span><i class="fa-solid fa-trash"></i></span><span
                            class="px-2">Xóa</span></button>
                    <button class="select-all-img col" type="button"><span><i
                            class="fa-solid fa-check-double"></i></span><span class="px-2">Chọn tất cả</span></button>
                    <button class="add-img col" type="button"><span><i class="fa-solid fa-circle-plus"></i></span><span
                            class="px-2">Thêm ảnh</span></button>
                </div>
            </div>
        </div>
        <%--        quan ly banner--%>
        <div class="frame-boder frame-banner row p-3">
            <div class="title"><span>Danh sách hình ảnh hiện thị</span></div>
            <div class="row">
                <div class="edit-img row row-cols-2">
                    <div class="p-3">
                        <div class="item-img col">
                            <img class="img-fluid " src="images/img_slide/slideShow_1.png" alt="">
                            <div class="text-banner"><span>Đăng nhập</span></div>
                            <div class="upload-img">
                                <input class="form-check-input " type="file" value="" name="banner-login"
                                       id="banner-login" accept="image/png, image/jpg" hidden>
                                <label for="banner-login"><i class="fa-solid fa-arrow-up-from-bracket"></i></label>
                            </div>
                        </div>
                    </div>

                    <div class="p-3">
                        <div class="item-img col">
                            <img class="img-fluid z-0 " src="images/img_slide/slideShow_2.png" alt="">
                            <div class="text-banner"><span>Đăng ký</span></div>
                            <div class="upload-img">
                                <input class="form-check-input " type="file" value="" name="banner-signup"
                                       id="banner-signup" accept="image/png, image/jpg" hidden>
                                <label for="banner-signup"><i class="fa-solid fa-arrow-up-from-bracket"></i></label>
                            </div>
                        </div>
                    </div>
                    <div class="p-3">
                        <div class="item-img col">
                            <img class="img-fluid z-0 " src="images/img_slide/slideShow_3_resize1.png" alt="">
                            <div class="text-banner"><span>Quảng cáo</span></div>
                            <div class="upload-img">
                                <input class="form-check-input " type="file" value="" name="banner-pr" id="banner-pr"
                                       accept="image/png, image/jpg" hidden>
                                <label for="banner-pr"><i class="fa-solid fa-arrow-up-from-bracket"></i></label>
                            </div>
                        </div>
                    </div>
                    <div class="p-3">
                        <div class="item-img col">
                            <img class="img-fluid z-0" src="images/img_slide/slideShow_3_resize1.png" alt="">
                            <div class="text-banner"><span>Logo</span></div>
                            <div class="upload-img">
                                <input class="form-check-input " type="file" value="" name="banner-logo"
                                       id="banner-logo" accept="image/png, image/jpg" hidden>
                                <label for="banner-logo"><i class="fa-solid fa-arrow-up-from-bracket"></i></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

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
        </div>
        <div class="row footer-bot text-center border-3">
            <div class="logo col-lg-3 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                <a href="danh_sach_tai_khoan.jsp">
                    <img src="logo.png" alt="logo.png">
                    <span>KIMI</span>
                </a>
            </div>
            <div class="col"><span>© 2023 - Tất cả các quyền thuộc về KIMI</span></div>
        </div>
    </div>
</footer>

<script src="javascript/menu_footer.js"></script>
<script src="javascript/admin_page.js"></script>
<script src="javascript/danh_sach_slider.js"></script>
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
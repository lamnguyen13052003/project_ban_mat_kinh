<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.BannerImage" %>
<%@ page import="java.util.ArrayList" %>
<%User user = (User) session.getAttribute("user");%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="bootstrap-5.3.2-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="bootstrap-5.3.2-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome-free-6.4.2-web/css/all.css">
    <link rel="stylesheet" href="css/menu_footer.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/san_pham.css">
    <link rel="icon" href="logo_icon.png">

    <script src="bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>
    <script src="jquery/jquery-3.7.1.slim.min.js"></script>
    <script src="jquery/jquery-3.7.1.min.js"></script>

<%--    <script>
        console.log("loadding");
        $.ajax({
            url: "BannerImageController",
            method: "GET",
            success: function(response){
            },
            error: function () {
                console.log("Error");
            }
        });
    </script>--%>

    <title>Trag chủ</title>
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
                                        <li><a class="dropdown-item" href="DisplayProduct?idCategory=5&page=1">Kính lọc ánh sáng
                                            xanh</a></li>
                                        <li><a class="dropdown-item"  href="DisplayProduct?idCategory=6&page=1">Kính Mắt Clip on 2
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
                                    <a href="DisplayProduct?idCategory=0&page=1" class="menu-item nav-link px-4 rounded">Khuyến mãi</a>
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
<!--    section 1-->
<section id="silder-section">
    <div id="slider">
        <a href="#" style="display: block">
            <div class="" id="section_slider">
                <div class="container-slider">
                    <div id="myCarousel" class="carousel">
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <%
                                List<BannerImage> urls = (List<BannerImage>) request.getAttribute("bannerImages");
                                urls = urls == null ? new ArrayList<BannerImage>() : urls;
                                for(BannerImage url: urls){
                            %>
                            <div class="item active slide z-n1">
                                <img src="<%= url.getUrlImage()%>" alt="">
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <button type="button" class="slick-prev slick-arrow z-3 left">
                            <i class="fa-solid fa-arrow-left"></i>
                        </button>
                        <button type="button" class="slick-next slick-arrow z-3 right">
                            <i class="fa-solid fa-arrow-right"></i>
                        </button>
                        <ul class="slick-dots  z-3" style="display: flex;" role="tablist">
                            <li class=" px-1" role="presentation">
                                <button class="slick-active slick" type="button" role="tab" id="slick-slide-control00"
                                        aria-controls="slick-slide00"
                                        aria-label="1 of 3" tabindex="-1">
                                </button>
                            </li>
                            <li class="px-1" role="presentation">
                                <button class=" slick" id="slick-slide-control01" type="button" role="tab"
                                        aria-controls="slick-slide01"
                                        aria-label="2 of 3" tabindex="-1">
                                </button>
                            </li>
                            <li role="presentation" class="px-1">
                                <button class="slick" id="slick-slide-control02" type="button" role="tab"
                                        aria-controls="slick-slide02"
                                        aria-label="3 of 3" tabindex="0" aria-selected="true">
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </a>
    </div>
</section>
<section class="home-product-slider">
    <div class="container">
        <div class="home-product-slider-wrap">
            <div class="home-product-slider-wrap-header">
                <div class="section-title-all">
                    <div>
                        <h2>Sản phẩm nổi bật</h2>
                    </div>
                </div>
            </div>
            <div id="carouselExampleIndicators" class="carousel slide mb-5 d-block position-relative ">
                <!--Các nút bên dưới hình-->
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                            class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>

                <!--Danh sách các hình-->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="show-item-sale  row row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-sm-1 mb-4 d-flex justify-content-center py-3">
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="show-item-sale row row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-sm-1 mb-4 d-flex justify-content-center py-3">
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="show-item-sale row row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-sm-1 mb-4 d-flex justify-content-center py-3">
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                        </div>
                    </div>
                </div>

                <!--2 Nút chuyển qua và lại-->
                <button class="carousel-control-prev carousel-control-color " type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </button>
                <button class="carousel-control-next carousel-control-color" type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </button>
            </div>
        </div>
    </div>
</section>
<section class="home-banner">
    <div class="container">
        <div class="home-banner-wrap row text-center">
            <div class="home-banner-wrap-left col">
                <h2>TRÒNG KÍNH CRIZAL ROCK GIẢM 20%</h2>
                <p>BỀN BỈ GẤP 3 LẦN THẾ HỆ TRƯỚC
                </p>
                <a href="#">Mua ngay</a>
            </div>
            <div class="home-banner-wrap-right col">
                <%
                    BannerImage bannerPR = (BannerImage) request.getAttribute("bannerPRImages");
                %>
                <img class=" ls-is-cached lazyloaded" src="<%= bannerPR.getUrlImage()%>"
                     alt="home-banner-right">
                <% %>
            </div>
        </div>
    </div>
</section>
<section class="home-product">
    <div class="container">
        <div class="home-product-slider-wrap">
            <div class="home-product-slider-wrap-header">
                <div class="section-title-all">
                    <div>
                        <h2>Sản phẩm khuyến mãi</h2>
                    </div>
                    <a class="" href="khuyen_mai.jsp" data-hover="Xem thêm">Xem thêm <i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </div>
            <div id="carouselExampleIndicators-01" class="carousel slide mb-5 d-block position-relative ">
                <!--Các nút bên dưới hình-->
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators-01" data-bs-slide-to="0"
                            class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators-01" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators-01" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>

                <!--Danh sách các hình-->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="show-item-sale  row row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-sm-1 mb-4 d-flex justify-content-center py-3">
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="show-item-sale row row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-sm-1 mb-4 d-flex justify-content-center py-3">
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="show-item-sale row row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-sm-1 mb-4 d-flex justify-content-center py-3">
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua
                                            ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                            <!--Ô hiển thị-->
                            <div class="pro-loop col rounded-3">
                                <!--Phạm vi hiển thị trong ô-->
                                <div class="pro-loop-wrap position-relative">
                                    <!--Phần hình ảnh-->
                                    <div class="pro-loop-image position-relative">

                                        <!--Hiển thị hêt hàng-->
                                        <div class="pro-loop-sd z-2 position-absolute">
                                            <span>Hết hàng</span>
                                        </div>

                                        <!--Hiển thị quà tặng-->
                                        <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                                            <img class="lazyload" src="images/qua_tang.jpg" alt="icon quà tặng">
                                        </div>

                                        <!--Hiển thị hình ảnh-->
                                        <a href="/products/kinh-mat-gap-tron-oem-2015"
                                           class="pro-loop-image-item d-block">
                                            <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                                            <picture class="img-hidden-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh1_zinmy-blue-protect-1.58.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                            <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                                            <picture class="img-show-when-hover">
                                                <img class="lazyloaded  rounded-3"
                                                     src="images/product/kinh_mat/anhsangxanh2_zinmy-blue-sun-1.60.png"
                                                     alt=" Kính Mát Gập Tròn OEM 2015 ">
                                            </picture>
                                        </a>
                                    </div>

                                    <!--hiển thị sản phẩm đang là sản phẩm hot-->
                                    <div class="pro-loop-sold position-absolute">
                                        <label>
                                            <img src="images/hot.jpg" alt="pro-loop-sold">
                                        </label>
                                    </div>

                                    <!--Hiển thị tên thương hiệu-->
                                    <div class="pro-loop-brand text-center">
                                        <span class="pro-loop-vendor d-block">Tên thương hiệu</span>
                                    </div>

                                    <!--Hiển thị tên sản phẩm-->
                                    <h3 class="pro-loop-name text-center">
                                        <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">Tên sản
                                            phẩm</a>
                                    </h3>


                                    <!--hiển thị giá-->
                                    <div class="pro-loop-price text-center mt-0">
                                        <p class="fw-bold d-inline me-3">200,000 <span> ₫</span></p>
                                        <del>250,000 <span> ₫</span></del>
                                    </div>

                                    <!--Hiển thị đánh giá và số lượng bán-->
                                    <div class="sold_qty text-center">
                                        <!--Phần đánh giá sao-->
                                        <div class="prod-review-loop   d-inline-block">
                                            <!--Danh sách ngôi sao-->
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li class="checked">
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!--số lượng đánh giá-->
                                            <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
                                        </div>

                                        <!--Đường cắt ngang-->
                                        <span class="h-line d-inline-block"></span>

                                        <!--Phần hiển thị số lượng đã bán-->
                                        <div class="sold_qty_num  d-inline-block">
                                            <p class="m-0">
                                                Đã bán: <span>12</span>
                                            </p>
                                        </div>
                                    </div>

                                    <!--2 nút thao tác-->
                                    <div class="pro-loop-bottom">
                                        <button type="button" class="f-button setAddCartLoop" data-type="add-cart"
                                                data-id="">
                                            Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">
                                            Mua ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--End 1 ô sản phẩm-->

                        </div>
                    </div>
                </div>

                <!--2 Nút chuyển qua và lại-->
                <button class="carousel-control-prev carousel-control-color " type="button"
                        data-bs-target="#carouselExampleIndicators-01"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </button>
                <button class="carousel-control-next carousel-control-color" type="button"
                        data-bs-target="#carouselExampleIndicators-01"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </button>
            </div>
        </div>
    </div>
</section>


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
                    <img src="logo.png" alt="logo.png">
                    <span>KIMI</span>
                </a>
            </div>
            <div class="col"><span>© 2023 - Tất cả các quyền thuộc về KIMI</span></div>
        </div>
    </div>
</footer>
<script src="javascript/menu_footer.js"></script>
<script src="javascript/index.js"></script>
<script type="text/javascript">
    <%if(user != null){%>
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
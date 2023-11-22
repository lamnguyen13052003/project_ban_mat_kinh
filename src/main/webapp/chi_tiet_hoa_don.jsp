<%@ page import="bean.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="bootstrap-5.3.2-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="bootstrap-5.3.2-dist/css/bootstrap.min.css">
    <script src="bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="fontawesome-free-6.4.2-web/css/all.css">
    <link rel="stylesheet" href="css/menu_footer.css">
    <link rel="stylesheet" href="css/chi_tiet_hoa_don.css">
    <link rel="icon" href="logo_icon.png">

    <script src="jquery/jquery-3.7.1.slim.min.js"></script>
    <script src="jquery/jquery-3.7.1.min.js"></script>

    <title>Chi tiết hóa đơn</title>
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
    <div class="container p-2">
        <!--        top-->
        <div class="in4-bill-top d-flex justify-content-between">
            <div class="in4-left">
                <div class="id-bill-and-in4-ship d-flex align-items-center justify-content-around">
                    <div class="id-bill "><p>
                        <h3 class="fw-bold">Hóa đơn: #<span>xxx</span></h3></p></div>
                    <div class="in4-ship px-3 mx-5"><span>Đang trên đường giao</span></div>
                </div>
                <div class="time-order py-2"><p><span>dd/mm/yyyy, </span><span>hh:mm</span></p></div>
            </div>
            <div class="in4-right ">
                <button type="button"><i class="fa-solid fa-trash"></i> Hủy đơn hàng</button>
            </div>
        </div>

        <!--        sản phẩm và thông tin khác hàng-->
        <div class="item-and-in4-customer mb-3 row">
            <!--                thông tin sản phẩm-->
            <div class="p-3 col-8">
                <div class="in4-item-frame">
                    <div class="col-name-item p-3 row">
                        <div class="col-6 ">Sản phẩm</div>
                        <div class="col-2">Đơn giá</div>
                        <div class="col-2">Số lượng</div>
                        <div class="col-2">Thành tiền</div>
                    </div>

                    <div class="list-item">
                        <!--                    bắt đầu 1 hàng sản phẩm-->
                        <div class="item row py-2 text-center">
                            <div class="col-5 d-flex">
                                <div class="img-item px-4">
                                    <img class="d-none" src="" alt="">
                                    <div class="img-60x60 text-center">
                                        <span>Hình ảnh<br>60x60</span>
                                    </div>
                                </div>
                                <div class="in4-item">
                                    <p><span>Tên sản phẩm</span><br><span
                                            style="font-size: 12px; color: rgba(0, 0, 0, 0.5)">option sản phẩm nếu có</span>
                                    </p>
                                </div>
                                <div></div>
                            </div>
                            <div class="col-2"><span>1,300,000</span></div>
                            <div class="col-2"><span>10</span></div>
                            <div class="col-2"><span>13,000,000</span></div>
                            <div class="col-1 pe-5"><i class="fa-regular fa-pen-to-square"></i></div>
                        </div>
                        <!--                    kết thúc 1 hàng sản phẩm-->

                        <!--                    bắt đầu 1 hàng sản phẩm-->
                        <div class="item row py-2 text-center">
                            <div class="col-5 d-flex">
                                <div class="img-item px-4">
                                    <img class="d-none" src="" alt="">
                                    <div class="img-60x60 text-center">
                                        <span>Hình ảnh<br>60x60</span>
                                    </div>
                                </div>
                                <div class="in4-item">
                                    <p><span>Tên sản phẩm</span><br><span
                                            style="font-size: 12px; color: rgba(0, 0, 0, 0.5)">option sản phẩm nếu có</span>
                                    </p>
                                </div>
                                <div></div>
                            </div>
                            <div class="col-2"><span>1,300,000</span></div>
                            <div class="col-2"><span>10</span></div>
                            <div class="col-2"><span>13,000,000</span></div>
                            <div class="col-1 pe-5"><i class="fa-regular fa-pen-to-square"></i></div>
                        </div>
                        <!--                    kết thúc 1 hàng sản phẩm-->

                        <!--                    bắt đầu 1 hàng sản phẩm-->
                        <div class="item row py-2 text-center">
                            <div class="col-5 d-flex">
                                <div class="img-item px-4">
                                    <img class="d-none" src="" alt="">
                                    <div class="img-60x60 text-center">
                                        <span>Hình ảnh<br>60x60</span>
                                    </div>
                                </div>
                                <div class="in4-item">
                                    <p><span>Tên sản phẩm</span><br><span
                                            style="font-size: 12px; color: rgba(0, 0, 0, 0.5)">option sản phẩm nếu có</span>
                                    </p>
                                </div>
                                <div></div>
                            </div>
                            <div class="col-2"><span>1,300,000</span></div>
                            <div class="col-2"><span>10</span></div>
                            <div class="col-2"><span>13,000,000</span></div>
                            <div class="col-1 pe-5"><i class="fa-regular fa-pen-to-square"></i></div>
                        </div>
                        <!--                    kết thúc 1 hàng sản phẩm-->

                        <!--                    bắt đầu 1 hàng sản phẩm-->
                        <div class="item row py-2 text-center">
                            <div class="col-5 d-flex">
                                <div class="img-item px-4">
                                    <img class="d-none" src="" alt="">
                                    <div class="img-60x60 text-center">
                                        <span>Hình ảnh<br>60x60</span>
                                    </div>
                                </div>
                                <div class="in4-item">
                                    <p><span>Tên sản phẩm</span><br><span
                                            style="font-size: 12px; color: rgba(0, 0, 0, 0.5)">option sản phẩm nếu có</span>
                                    </p>
                                </div>
                                <div></div>
                            </div>
                            <div class="col-2"><span>1,300,000</span></div>
                            <div class="col-2"><span>10</span></div>
                            <div class="col-2"><span>13,000,000</span></div>
                            <div class="col-1 pe-5"><i class="fa-regular fa-pen-to-square"></i></div>
                        </div>
                        <!--                    kết thúc 1 hàng sản phẩm-->

                        <!--                    bắt đầu 1 hàng sản phẩm-->
                        <div class="item row py-2 text-center">
                            <div class="col-5 d-flex">
                                <div class="img-item px-4">
                                    <img class="d-none" src="" alt="">
                                    <div class="img-60x60 text-center">
                                        <span>Hình ảnh<br>60x60</span>
                                    </div>
                                </div>
                                <div class="in4-item">
                                    <p><span>Tên sản phẩm</span><br><span
                                            style="font-size: 12px; color: rgba(0, 0, 0, 0.5)">option sản phẩm nếu có</span>
                                    </p>
                                </div>
                                <div></div>
                            </div>
                            <div class="col-2"><span>1,300,000</span></div>
                            <div class="col-2"><span>10</span></div>
                            <div class="col-2"><span>13,000,000</span></div>
                            <div class="col-1 pe-5"><i class="fa-regular fa-pen-to-square"></i></div>
                        </div>
                        <!--                    kết thúc 1 hàng sản phẩm-->

                        <!--                    bắt đầu 1 hàng sản phẩm-->
                        <div class="item row py-2 text-center">
                            <div class="col-5 d-flex">
                                <div class="img-item px-4">
                                    <img class="d-none" src="" alt="">
                                    <div class="img-60x60 text-center">
                                        <span>Hình ảnh<br>60x60</span>
                                    </div>
                                </div>
                                <div class="in4-item">
                                    <p><span>Tên sản phẩm</span><br><span
                                            style="font-size: 12px; color: rgba(0, 0, 0, 0.5)">option sản phẩm nếu có</span>
                                    </p>
                                </div>
                                <div></div>
                            </div>
                            <div class="col-2"><span>1,300,000</span></div>
                            <div class="col-2"><span>10</span></div>
                            <div class="col-2"><span>13,000,000</span></div>
                            <div class="col-1 pe-5"><i class="fa-regular fa-pen-to-square"></i></div>
                        </div>
                        <!--                    kết thúc 1 hàng sản phẩm-->

                        <!--                    bắt đầu 1 hàng sản phẩm-->
                        <div class="item row py-2 text-center">
                            <div class="col-5 d-flex">
                                <div class="img-item px-4">
                                    <img class="d-none" src="" alt="">
                                    <div class="img-60x60 text-center">
                                        <span>Hình ảnh<br>60x60</span>
                                    </div>
                                </div>
                                <div class="in4-item">
                                    <p><span>Tên sản phẩm</span><br><span
                                            style="font-size: 12px; color: rgba(0, 0, 0, 0.5)">option sản phẩm nếu có</span>
                                    </p>
                                </div>
                                <div></div>
                            </div>
                            <div class="col-2"><span>1,300,000</span></div>
                            <div class="col-2"><span>10</span></div>
                            <div class="col-2"><span>13,000,000</span></div>
                            <div class="col-1 pe-5"><i class="fa-regular fa-pen-to-square"></i></div>
                        </div>
                        <!--                    kết thúc 1 hàng sản phẩm-->

                        <!--                    bắt đầu 1 hàng sản phẩm-->
                        <div class="item row py-2 text-center">
                            <div class="col-5 d-flex">
                                <div class="img-item px-4">
                                    <img class="d-none" src="" alt="">
                                    <div class="img-60x60 text-center">
                                        <span>Hình ảnh<br>60x60</span>
                                    </div>
                                </div>
                                <div class="in4-item">
                                    <p><span>Tên sản phẩm</span><br><span
                                            style="font-size: 12px; color: rgba(0, 0, 0, 0.5)">option sản phẩm nếu có</span>
                                    </p>
                                </div>
                                <div></div>
                            </div>
                            <div class="col-2"><span>1,300,000</span></div>
                            <div class="col-2"><span>10</span></div>
                            <div class="col-2"><span>13,000,000</span></div>
                            <div class="col-1 pe-5"><i class="fa-regular fa-pen-to-square"></i></div>
                        </div>
                        <!--                    kết thúc 1 hàng sản phẩm-->
                    </div>

                    <!--hiện thị tổng số tiền cần trả-->
                    <div class="show-total-money py-3 mx-5 d-flex align-items-center justify-content-end">
                        <div class="show-total px-3 ">
                            <ul>
                                <li><span>Tổng hóa đơn:</span><span>130,000,000 <span>₫</span></span> </li>
                                <li><span>Phí vận chuyển:</span><span>20,000 <span>₫</span></span></li>
                                <li><span>Tổng tiền phải trả:</span><span>130,020,000 <span>₫</span></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="p-3 col-4">
                <!--                thông tin khách hàng-->
                <div class="in4-customer " >
                    <div class="col-name-in4-customer"><h4 class="px-3 py-3 mb-2">Thông tin khách hàng</h4></div>
                    <div class=" d-flex px-3 py-1">
                        <div class="avatar-customer">
                            <img src="logo.png" alt="avatar.png">
                        </div>
                        <div class="info-customer ms-2 w-100">
                            <p class="name-customer">Nguyễn Đình A</p>
                            <p class="email-customer">kiminonawa1305@gmail.com</p>
                        </div>
                    </div>
                    <div class="tong-san-pham d-flex align-items-start justify-content-start  px-3 pt-1 pb-3">
                        <div class="icon-cart d-flex align-items-center justify-content-center"><i class="fa-solid fa-cart-shopping"></i></div>
                        <p>Tổng sản phẩm: <span>12</span></p>
                    </div>
                    <div class="address  px-3 pb-2 pt-2">
                        <div class="edit-address d-flex align-items-center justify-content-between">
                            <p>Địa chỉ</p>
                            <button id="edit" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#editAddressModal">
                                <i class="fa-solid fa-pen"></i>
                            </button>

                        </div>

                        <p><span>Họ và tên: </span><span class="name-customer">Nguyễn Đình Lam</span></p>
                        <p><span>Số điện thoại: </span><span class="number-phone-customer">0855354919</span></p>
                        <p><span>Địa chỉ: </span><span class="address-customer">abc.xyz</span></p>

                        <!--                    dialog sửa địa chỉ-->
                        <!-- Button trigger modal -->

                        <!-- Modal -->
                        <div class="modal fade" id="editAddressModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Chỉnh sửa thông tin</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body" id="form">
                                        <div class="mb-3">
                                            <label for="input-email" class="form-label">Họ và tên</label>
                                            <input type="text" class="form-control" id="input-email" placeholder="Nhập họ và tên">
                                        </div>
                                        <div class="mb-3">
                                            <label for="input-phone-number" class="form-label">Số điện thoại</label>
                                            <input type="text" class="form-control" id="input-phone-number" placeholder="Nhập số điện thoại">
                                        </div>
                                        <div class="mb-3">
                                            <label for="input-address" class="form-label">Địa chỉ</label>
                                            <input type="text" class="form-control" id="input-address" placeholder="Nhập địa chỉ">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                        <button id="save" type="button" class="btn"  data-bs-dismiss="modal" style="background-color: var(--color-blue-origin); color: #FFFFFF">Lưu</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!--        Kết thúc sản phẩm và thông tin khác hàng-->

<!--        lộ trình vận chuyển-->
        <div class="trip-ship  p-4">
            <p class="p-2" style="font-size: 20px">Lộ trình vận chuyển hàng</p>
            <div class="show-list-trip p-3">
<!--                bắt đầu một lộ trình-->
                <div class="trip d-flex justify-content-between">
                    <div class="in4-trip">
                        <div class="icon-trip d-flex justify-content-between">
                            <span><i class="fa-solid fa-circle"></i></span>
                           <div class="has-one-line px-2">
                               <p>Đã nhận đơn hàng</p>
                               <p>Đã nhận đơn hàng mã: <span>#<span>xxxxx</span></span></p>
                           </div>
                        </div>
                    </div>
                    <div class="time-trip">
                        <span><span>dd/mm/yyy</span>, <span>hh:mm</span></span>
                    </div>
                </div>
<!--                kết thúc một lộ trình-->

                <!--                bắt đầu một lộ trình-->
                <div class="trip d-flex justify-content-between">
                    <div class="in4-trip">
                        <div class="icon-trip d-flex justify-content-between">
                            <span><i class="fa-solid fa-circle"></i></span>
                            <div class="has-one-line px-2">
                                <p>Đang chuẩn bị đơn hàng</p>
                                <p>Đang kiểm tra số lượng trong kho và chuẩn bị đơn hàng</p>
                            </div>
                        </div>
                    </div>
                    <div class="time-trip">
                        <span><span>dd/mm/yyy</span>, <span>hh:mm</span></span>
                    </div>
                </div>
                <!--                kết thúc một lộ trình-->

                <!--                bắt đầu một lộ trình-->
                <div class="trip d-flex justify-content-between">
                    <div class="in4-trip">
                        <div class="icon-trip d-flex justify-content-between">
                            <span><i class="fa-solid fa-circle"></i></span>
                            <div class="has-one-line px-2">
                                <p>Đã chuyển cho người vận chuyển</p>
                                <p>Đã chuyển cho người vận chuyển <span>Họ tên</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="time-trip">
                        <span><span>dd/mm/yyy</span>, <span>hh:mm</span></span>
                    </div>
                </div>
                <!--                kết thúc một lộ trình-->

                <!--                bắt đầu một lộ trình-->
                <div class="trip d-flex justify-content-between">
                    <div class="in4-trip">
                        <div class="icon-trip d-flex justify-content-between">
                            <span><i class="fa-solid fa-circle"></i></span>
                            <div class="has-one-line px-2">
                                <p>Đã đến khu vực bạn nhận hàng</p>
                                <p>Đã đến địa điểm <span>abc.xyz</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="time-trip">
                        <span><span>dd/mm/yyy</span>, <span>hh:mm</span></span>
                    </div>
                </div>
                <!--                kết thúc một lộ trình-->

                <!--                bắt đầu một lộ trình-->
                <div class="trip d-flex justify-content-between">
                    <div class="in4-trip">
                        <div class="icon-trip d-flex align-items-center justify-content-between">
                            <span><i class="fa-solid fa-circle"></i></span>
                            <div class="da-giao px-2">
                                <p>Đã giao</p>
                                <p>Đơn hàng của bạn đã được giao</p>
                            </div>
                        </div>
                    </div>
                    <div class="time-trip">
                        <span><span>dd/mm/yyy</span>, <span>hh:mm</span></span>
                    </div>
                </div>
                <!--                kết thúc một lộ trình-->
            </div>
        </div>

        <!--Kết thúc phần lộ trình-->
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
                        <li><a class="hover" href="policy_pages/huong_dan_mua_hang_online.html">Hướng dẫn mua hàng online</a>
                        </li>
                        <li><a class="hover" href="policy_pages/chinh_sach_thanh_toan_va_giao_nhan.html">Chính sách thanh toán,
                            giao nhận</a></li>
                        <li><a class="hover" href="policy_pages/chinh_sach_bao_mat.html">Chính sách bảo mật</a></li>
                        <li><a class="hover" href="policy_pages/chinh_sach_bao_hanh.html">Chính sách bảo hành</a></li>
                        <li><a class="hover" href="policy_pages/chinh_sach_doi_tra_va_hoan_tien.html">Chính sách đổi trả và
                            hoàn tiền</a></li>
                        <li><a class="hover" href="policy_pages/kiem_tra_don_hang.html">Kiểm tra đơn hàng</a></li>
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
<script src="javascript/admin_page.js"></script>
<script src="javascript/chi_tiet_hoa_don.js"></script>
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
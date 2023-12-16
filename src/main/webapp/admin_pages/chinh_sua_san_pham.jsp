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
    <link rel="stylesheet" href="../css/them_san_pham.css">
    <link rel="icon" href="../logo_icon.png">

    <script src="../jquery/jquery-3.7.1.slim.min.js"></script>
    <script src="../jquery/jquery-3.7.1.min.js"></script>

    <title>Chỉnh sửa sản phẩm</title>
</head>
<body>
<header id="menu">
    <nav class="navbar navbar-expand-lg pb-0">
        <div class="container-xxl m-md-auto mt-2">
            <div class="row">
                <div class="logo col-lg-2 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                    <a href="quan_ly_tai_khoan.jsp" class="navbar-brand me-5">
                        <img src="../images/logo/logo.png" alt="logo.png">
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
                <div class="menu-product col-lg-12 col-md-1 col-sm-1">
                    <!--Icon 3 dấu gạch mang hiển thị menu-->
                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasNavbarAdmin"
                            aria-controls="offcanvasNavbarAdmin" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!--Các mục trong menu-->
                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbarAdmin"
                         aria-labelledby="offcanvasNavbarAdminLabel">
                        <div class="offcanvas-body">
                            <ul class="navbar-nav m-auto">
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="quan_ly_tai_khoan.jsp" class="nav-link px-4 rounded">Quản lý tài khoản</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="quan_ly_san_pham.jsp" class="nav-link px-4 rounded">Quản lý sản
                                        phẩm</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="quan_ly_hoa_don.jsp" class="nav-link px-4 rounded">Quản lý hóa đơn</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="quan_ly_banner.jsp" class="nav-link px-4 rounded">Quản lý banner</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>

<main id="main" class=" mt-5 pb-5">
    <div class="container position-relative">
        <form action="">
            <section class="left">
                <div class="input-info-product input">
                    <h4 class="input-info-product-title title">
                        Thông tin sản phẩm
                    </h4>

                    <div class="input-info-product-body mb-4">
                        <div class="row mb-4">
                            <div class="col">
                                <input type="text" class="w-100" name="name-product" id="name-product"
                                       placeholder="Tên sản phẩm" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <select class="w-100" type="text" name="type-product" id="type-product" required>
                                    <optgroup label="Kính mát">
                                        <option value="kinh_mat_nam">Kính mát nam</option>
                                        <option value="kinh_mat_nu">Kính mát nữ</option>
                                        <option value="kinh_di_ngay_va_dem">Kính đi ngày và đêm</option>
                                        <option value="kinh_doi_mau">Kinh đổi màu</option>
                                        <option value="kinh_loc_anh_sang_xanh">Kính lọc ánh sánh xanh</option>
                                        <option value="kinh_mat_clip_on_2_lop">Kính mắt clip on 2 lớp</option>
                                    </optgroup>
                                    <optgroup label="Mắt kính trẻ em">
                                        <option value="gong_kinh_tre_em">Gọng kính trẻ em</option>
                                        <option value="kinh_mat_tre_em">Kính mát trẻ em</option>
                                    </optgroup>
                                    <optgroup label="Gọng kính">
                                        <option value="gong_kinh_nua_khung">Gọng kính nữa khung</option>
                                        <option value="gong_kinh_khoan">Gọng kính khoan</option>
                                        <option value="gong_kinh_tron">Gọng kính tròn</option>
                                        <option value="gong_kinh_titan">Gọng kính titan</option>
                                    </optgroup>
                                    <optgroup label="Tròng kính">
                                        <option value="trong_kinh_trong_anh_sang_xanh">Tròng kính chống ánh sáng xanh
                                        </option>
                                        <option value="trong_kinh_doi_mau">Tròng kính đổi màu</option>
                                        <option value="trong_kinh_mau">Tròng kính màu</option>
                                        <option value="trong_kinh_cho_gong_khoan">Tròng kính cho gọng khoan</option>
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="input-expanded-info-product">
                        <div class="input-expanded-info-product-header text-editor-header">
                            <button type="button" class="btn"
                                    data-element="bold">
                                <i class="fa fa-bold"></i>
                            </button>
                            <button type="button" class="btn"
                                    data-element="italic">
                                <i class="fa fa-italic"></i>
                            </button>
                            <button type="button" class="btn"
                                    data-element="underline">
                                <i class="fa fa-underline"></i>
                            </button>
                            <button type="button" class="btn"
                                    data-element="insertUnorderedList">
                                <i class="fa fa-list-ul"></i>
                            </button>
                            <button type="button" class="btn"
                                    data-element="insertOrderedList">
                                <i class="fa fa-list-ol"></i>
                            </button>

                            <button type="button" class="btn"
                                    data-element="justifyLeft">
                                <i class="fa fa-align-left"></i>
                            </button>
                            <button type="button" class="btn"
                                    data-element="justifyCenter">
                                <i class="fa fa-align-center"></i>
                            </button>
                            <button type="button" class="btn"
                                    data-element="justifyRight">
                                <i class="fa fa-align-right"></i>
                            </button>
                            <button type="button" class="btn"
                                    data-element="justifyFull">
                                <i class="fa fa-align-justify"></i>
                            </button>
                            <button type="button" class="btn"
                                    data-element="createLink">
                                <i class="fa fa-link"></i>
                            </button>
                            <label type="button" class="btn" data-element="insertImage"
                                   for="input-img-for-expanded-info-product">
                                <i class="fa fa-image"></i>
                                <input type="file" hidden="" id="input-img-for-expanded-info-product"
                                       accept="image/png,image/jpeg">
                            </label>
                        </div>


                        <div class="input-expanded-info-product-body" id="frame-content">
                            <div class="content-product ms-2 me-2" contenteditable="true">
                                <div>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>

                    <button type="button" data-bs-toggle="modal" data-bs-target="#dialog-input-link"
                            id="button-show-input-link" hidden="">
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="dialog-input-link" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm Link</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <input type="url" id="input-link" value="">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                            id="button-save-url">Save changes
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="input-img-product input">
                    <h4 class="input-img-product-title title">
                        Ảnh minh họa
                    </h4>

                    <div class="input-img-product-body">
                        <div class="input" id="input-img">
                            <label for="input-img-product" class="d-"><span
                                    class="material-symbols-outlined">cloud_upload</span></label>
                            <input type="file" name="input-img-product" id="input-img-product"
                                   accept="image/jpeg,image/png" hidden="">
                        </div>
                    </div>
                </div>

                <div class="input-option-product input">
                    <h4 class="input-option-product-title title">
                        Sự lựa chọn
                    </h4>

                    <div class="input-option-product-body" id="frame-input-option-product">
                        <div id="input-option-product"></div>
                    </div>

                    <div class="input-option-product-footer">
                        <button type="button" class="btn button-add" id="add-option">
                            Thêm sự lựa chọn sản phẩm
                        </button>
                    </div>
                </div>

                <div class="input-amount-and-release-date-product input">
                    <h4 class="input-amount-and-release-date-product-title title">
                        Số lượng
                    </h4>

                    <div class="input-amount-and-release-date-product-body">
                        <div class="input-amount-product mb-0">
                            <label for="amount-product">Số lượng sản phẩm</label>
                            <input type="text" class="amount-product" required id="amount-product" placeholder="100">
                        </div>
                    </div>
                </div>
            </section>
            <section class="right">
                <div class="input-price-product input">
                    <h4 class="input-price-product-title title">
                        Giá sản phẩm
                    </h4>

                    <div class="input-price-product-body">
                        <input type="number" class="w-100 mb-0" name="price-product" id="price-product"
                               placeholder="Giá sản phẩm" required>
                        <div class="list-sale-product">
                            <div id="input-sale-product"></div>
                        </div>
                    </div>

                    <hr>
                    <div class="input-price-product-footer mt-3">
                        <button type="button" class="btn button-add" id="add-sale-product">Thêm giảm giá</button>
                    </div>
                </div>

                <div class="input-filter-product input">
                    <h4 class="input-filter-product-title title">
                        Bộ lọc sản phẩm
                    </h4>

                    <div class="input-filter-product-body">
                        <select class="w-100" name="select-brand-product" id="select-brand-product">
                            <option value="brand_1">Thương hiệu 1</option>
                            <option value="brand_2">Thương hiệu 2</option>
                            <option value="brand_3">Thương hiệu 3</option>
                        </select>
                        <select class="w-100" name="select-material-product" id="select-material-product">
                            <option value="material_1">Chất liệu a</option>
                            <option value="material_2">Chất liệu b</option>
                            <option value="material_3">Chất liệu c</option>
                        </select>
                        <select class="w-100" name="select-type-product" id="select-type-product">
                            <option value="type_1">Kiểu 1</option>
                            <option value="type_2">Kiểu 2</option>
                            <option value="type_3">Kiểu 3</option>
                        </select>
                    </div>
                </div>

                <div class="button-action row">
                    <div class="col-6">
                        <button class="w-100  py-2 rounded" type="reset">
                            <a class="text-light rounded" href="quan_ly_san_pham.jsp">Hủy</a>
                        </button>
                    </div>
                    <div class="col-6">
                        <button class="w-100 rounded py-2" type="submit">
                            <a class="text-light " href="quan_ly_san_pham.jsp">Lưu</a></button>
                    </div>
                </div>
            </section>
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
        </div>
        <div class="row footer-bot text-center border-3">
            <div class="logo col-lg-3 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                <a href="quan_ly_tai_khoan.jsp">
                    <img src="../images/logo/logo.png" alt="logo.png">
                    <span>KIMI</span>
                </a>
            </div>
            <div class="col"><span>© 2023 - Tất cả các quyền thuộc về KIMI</span></div>
        </div>
    </div>
</footer>

<script src="../javascript/menu_footer.js"></script>
<script src="../javascript/admin_page.js"></script>
<script src="../javascript/them_san_pham.js"></script>
<script src="../javascript/form_des.js"></script>
<script type="text/javascript">
    <%User user = (User) session.getAttribute("user");
    if(user != null){%>
    const user = new User();
    user.setId(<%=user.getId()%>);
    user.setAvatar("../<%=user.getAvatar()%>");
    user.setFullName("<%=user.getFullName()%>");
    displayMenuAccount(user);
    <%} else{%>
    hidenMenuAccount();
    <%}%>
</script>
</body>
</html>
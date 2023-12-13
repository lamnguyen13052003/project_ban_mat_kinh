<%@ page import="model.bean.User" %>
<%@ page import="model.bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
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
    <link rel="stylesheet" href="../css/admin_pages.css">
    <link rel="icon" href="../logo_icon.png">

    <script src="../jquery/jquery-3.7.1.slim.min.js"></script>
    <script src="../jquery/jquery-3.7.1.min.js"></script>

    <title>Quản lý sản phẩm</title>
</head>
<body>
<header id="menu">
    <nav class="navbar navbar-expand-lg pb-0">
        <div class="container-xxl m-md-auto mt-2">
            <div class="row">
                <div class="logo col-lg-2 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                    <a href="danh_sach_tai_khoan.jsp" class="navbar-brand me-5">
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
                                <li class="nav-item dropdown pe-lg-5 pe-md-0 ">
                                    <a href="danh_sach_tai_khoan.jsp" class="nav-link px-4 rounded">Danh sách tài khoản</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0 ">
                                    <a href="danh_sach_san_pham.jsp" class="nav-link px-4 rounded active">Danh sách sản
                                        phẩm</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="danh_sach_hoa_don.jsp" class="nav-link px-4 rounded">Danh sách hóa đơn</a>
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
    <div class="container">
        <div class="display-product">
            <div class="filter pb-4">
                <div class="filter_header ms-4">
                    <span>Bộ lọc</span>
                </div>

                <div class="filter-body row">
                    <div class="option-filter col-4">
                        <div class="filter-item">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Trạng thái
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Tất cả</a></li>
                                    <li><a class="dropdown-item" href="#">Còn hàng</a></li>
                                    <li> <a class="dropdown-item" href="#">Hết hàng</a> </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="option-filter col-4">
                        <div class="filter-item">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    ---------------Thương hiệu---------------
                                </button>
                                <ul class="dropdown-menu" id="list-brand-name">
                                    <div class="dropdown-title text-secondary">---------------Thương hiệu---------------</div>
                                    <li><a class="dropdown-item" href="#">Tất cả</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="option-filter col-4">
                        <div class="filter-item">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    ---------------Danh mục---------------
                                </button>
                                <ul class="dropdown-menu">
                                    <div class="dropdown-title text-secondary">---------------Danh mục---------------</div>
                                    <li><a class="dropdown-item" href="#">Tất cả</a></li>
                                    <li><a class="dropdown-item" href="#">Kính mát</a></li>
                                    <li>
                                        <ul>
                                            <li><a class="dropdown-item" href="#">Kính mát nam</a></li>
                                            <li><a class="dropdown-item" href="#">Kính mát nữ</a></li>
                                            <li><a class="dropdown-item" href="#">Kính đi ngày và đêm</a></li>
                                            <li><a class="dropdown-item" href="#">Kính đổi màu</a></li>
                                            <li><a class="dropdown-item" href="#">Kính lọc ánh sáng xanh</a></li>
                                            <li><a class="dropdown-item" href="#">Kính mắt clip on 2 lớp</a></li>
                                        </ul>
                                    </li>
                                    <li><a class="dropdown-item" href="#">Mắt kính trẻ em</a></li>
                                    <li>
                                        <ul>
                                            <li><a class="dropdown-item" href="#">Gọng kính trẻ en</a></li>
                                            <li><a class="dropdown-item" href="#">Kính mát trẻ em</a></li>
                                        </ul>
                                    </li>
                                    <li><a class="dropdown-item" href="#">Gọng kính</a></li>
                                    <li>
                                        <ul>
                                            <li><a class="dropdown-item" href="#">Gọng kính nữa khung</a></li>
                                            <li><a class="dropdown-item" href="#">Gọng kính khoan</a></li>
                                            <li><a class="dropdown-item" href="#">Gọng kính tròn</a></li>
                                            <li><a class="dropdown-item" href="#">Gọng kính titan</a></li>
                                        </ul>
                                    </li>
                                    <li><a class="dropdown-item" href="#">Tròng kính</a></li>
                                    <li>
                                        <ul>
                                            <li><a class="dropdown-item" href="#">Tròng kính chống ánh sáng xanh</a></li>
                                            <li><a class="dropdown-item" href="#">Tròng kính đổi màu</a></li>
                                            <li><a class="dropdown-item" href="#">Tròng kính màu</a></li>
                                            <li><a class="dropdown-item" href="#">Tròng kính cho gọng khoan</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="search pb-4">
                <div class="search_header ms-4">
                    <span>Tìm kiếm</span>
                </div>

                <div class="search-body row">
                    <div class="option-search col-10">
                        <div class="search-item rounded">
                            <input type="text" name="search-name-product" id="search-name-product"
                                   placeholder="Nhập tên sản phẩm">
                            <label for="search-name-product" class="d-flex align-items-center p-1"><span
                                    class="material-symbols-outlined ps-1 fs-3">search</span></label>
                        </div>
                    </div>

                    <div class="addProduct col-2">
                        <a href="chinh_sua_san_pham.jsp">
                            <button class="btn d-flex" data-bs-toggle="modal" data-bs-target="#form-add-product">
                                <span>Thêm sản phẩm</span>
                                <span class="material-symbols-outlined">add</span>
                            </button>
                        </a>
                    </div>
                </div>
            </div>

            <div class="table">
                <div class="row header-table  align-items-center ps-4">
                    <div class="col-4">Sản phẩm</div>
                    <div class="col-2">Dòng sản phẩm</div>
                    <div class="col-1">Số lượng</div>
                    <div class="col-1">Đã bán</div>
                    <div class="col-2">Giá tiền</div>
                    <div class="col-1 px-2">Trạng thái</div>
                    <div class="col-1"></div>
                </div>

                <!--phần thân-->
                <div class="body-table">
                    <%
                        NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.of("vi", "VN"));
                        List<Product> products = (List<Product>) request.getAttribute("products");
                    for(Product product : products){%>
                    <div class="product row ps-4">
                        <div class="col-4 d-flex">
                            <div class="img-product">
                                <img src="../logo.png" alt="hinh_anh.png">
                            </div>
                            <div class="info-product ms-2 w-100">
                                <p class="name-product"><%=product.getName()%></p>
                                <p class="id-product">#<%=product.getId()%></p>
                                <select>
                                    <option value="">Đỏ</option>
                                    <option value="">Xanh</option>
                                    <option value="">Tím</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-2 type-product">Kính mắt trẻ em</div>
                        <div class="col-1 amount-product te">2222</div>
                        <div class="col-1 amount-product-bought">1231</div>
                        <div class="col-2 price"><%=nf.format(product.getPrice())%></div>
                        <div class="col-1 status">Còn hàng</div>
                        <div class="col-1"><span class="material-symbols-outlined">edit</span></div>
                    </div>
                    <%}%>
                </div>
                <!--kết thúc thân-->

                <!--Phần footer, coppy-->
                <div class="footer-table row p-4 d-flex align-items-center">
                    <div class="text-amount-account col-8 ">
                        <span class="ps-0 pe-0">Tổng số sản phẩm: </span>
                        <span class="amount ps-0 pe-0">100</span>
                        <span class="ps-0 pe-0"> sản phẩm</span>
                    </div>
                    <div class="change-page-display-list col-4 d-flex ps-5">
                        <button id="prev" class="d-flex align-items-center justify-content-center"><span
                                class="material-symbols-outlined">chevron_left</span></button>
                        <button class="d-flex align-items-center justify-content-center button-number active"
                                data-target="1">1
                        </button>
                        <button class="d-flex align-items-center justify-content-center button-number" data-target="2">2
                        </button>
                        <button class="d-flex align-items-center justify-content-center button-number" data-target="3">3
                        </button>
                        <button class="d-flex align-items-center justify-content-center button-number" data-target="">
                            ...
                        </button>
                        <button class="d-flex align-items-center justify-content-center button-number" data-target="14">
                            14
                        </button>
                        <button class="d-flex align-items-center justify-content-center button-number" data-target="15">
                            15
                        </button>
                        <button id="next" class="d-flex align-items-center justify-content-center"><span
                                class="material-symbols-outlined">chevron_right</span></button>
                    </div>
                </div>
                <!--kết thúc footer-->
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
        </div>
        <div class="row footer-bot text-center border-3">
            <div class="logo col-lg-3 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                <a href="danh_sach_tai_khoan.jsp">
                    <img src="../logo.png" alt="logo.png">
                    <span>KIMI</span>
                </a>
            </div>
            <div class="col"><span>© 2023 - Tất cả các quyền thuộc về KIMI</span></div>
        </div>
    </div>
</footer>

<script src="../javascript/menu_footer.js"></script>
<script src="../javascript/admin_page.js"></script>
<script src="../javascript/product_manager.js"></script>
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
<%@ page import="bean.User" %>
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
    <link rel="stylesheet" href="../css/danh_sach_tai_khoan.css">
    <link rel="icon" href="../logo_icon.png">

    <script src="../jquery/jquery-3.7.1.slim.min.js"></script>
    <script src="../jquery/jquery-3.7.1.min.js"></script>

    <title>Quản lý tài khoản</title>
</head>
<body>
<header id="menu">
    <nav class="navbar navbar-expand-lg pb-0">
        <div class="container-xxl m-md-auto mt-2">
            <div class="row">
                <div class="logo col-lg-2 col-md-2 col-sm-2 border-0 px-lg-0 px-md-5">
                    <a href="danh_sach_tai_khoan.html" class="navbar-brand me-5">
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
                            data-bs-target="#offcanvasNavbar"
                            aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!--Các mục trong menu-->
                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                         aria-labelledby="offcanvasNavbarLabel">
                        <div class="offcanvas-body">
                            <ul class="navbar-nav m-auto">
                                <li class="nav-item dropdown pe-lg-5 pe-md-0 ">
                                    <a href="danh_sach_tai_khoan.html" class="nav-link px-4 rounded active">Danh sách
                                        tài khoản</a>
                                </li>
                                <li class="nav-item dropdown pe-lg-5 pe-md-0">
                                    <a href="danh_sach_san_pham.jsp" class="nav-link px-4 rounded">Danh sách sản
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
        <div class="search pb-4">
            <div class="search_header ms-4">
                <span>Tìm kiếm</span>
            </div>

            <div class="option-search row">
                <div class="col-3">
                    <div class="search-item rounded">
                        <input type="text" name="search-account-id" id="search-account-id"
                               placeholder="Nhập mã tài khoản">
                        <label for="search-account-id" class="d-flex align-items-center p-1"><span
                                class="material-symbols-outlined ps-1 fs-3">search</span></label>
                    </div>
                </div>
                <div class="col-3">
                    <div class="search-item rounded">
                        <input type="text" name="search-account-name" id="search-account-name"
                               placeholder="Nhập tên tài khoản">
                        <label for="search-account-name" class="d-flex align-items-center p-1"><span
                                class="material-symbols-outlined ps-1 fs-3">search</span></label>
                    </div>
                </div>
                <div class="col-3">
                    <select class="py-2 rounded w-75" name="input-account-role" id="input-account-role">
                        <option value="all" selected>tất cả</option>
                        <option value="0">admin</option>
                        <option value="2">shipper</option>
                        <option value="1">tài khoản</option>
                    </select>
                </div>
                <div class="col-3">
                    <select class="py-2 rounded w-75" name="input-lock-account" id="input-lock-account">
                        <option value="all" selected>tất cả</option>
                        <option value="1">Đã khóa</option>
                        <option value="0">Không khóa</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="table">
            <div class="header-table row align-items-center ps-4">
                <div class="col-2">Mã tài khoản</div>
                <div class="col-4">tài khoản</div>
                <div class="col-1 text-center">Giới tính</div>
                <div class="col-1 text-center">Tổng đơn hàng đặt</div>
                <div class="col-2 text-center">Tổng chi</div>
                <div class="col-1 text-center">Vai trò</div>
                <div class="col-1 text-center">Khóa tài khoản</div>
            </div>
            <div class="body-table">
                <div class="row account align-items-center ps-4" data-account-id="1" data-account-name="Nguyễn Đình A" data-lock-account="0" data-account-role="1">
                    <div class="col-2 id-account">#1</div>
                    <!--Phần avatar và text, coppy-->
                    <div class="col-4 d-flex">
                        <div class="avatar-account">
                            <img src="../logo.png" alt="avatar.png">
                        </div>
                        <div class="info-account ms-2 w-100">
                            <p class="name-account">Nguyễn Đình A</p>
                            <p class="email-account">kiminonawa1305@gmail.com</p>
                        </div>
                    </div>
                    <!--Kết thức phần avatar và text-->
                    <div class="col-1 text-center">Nam</div>
                    <div class="col-1 text-center">200</div>
                    <div class="col-2 text-center">
                        <span class="money-spend-account">13,000,000</span>
                        <span class="text-decoration-underline">đ</span>
                    </div>
                    <div class="col-1 px-0 text-center">
                        <select name="account-role" class="rounded py-1">
                            <option value="account">tài khoản</option>
                            <option value="admin">admin</option>
                            <option value="shipper">Shipper</option>
                        </select>
                    </div>
                    <div class="col-1 text-center">
                        <input type="checkbox" name="lock-account-account" value="#123">
                    </div>
                </div>

                <div class="row account align-items-center ps-4" data-account-id="2" data-account-name="Nguyễn Đình B" data-lock-account="0" data-account-role="0">
                    <div class="col-2 id-account">#2</div>
                    <!--Phần avatar và text, coppy-->
                    <div class="col-4 d-flex">
                        <div class="avatar-account">
                            <img src="../logo.png" alt="avatar.png">
                        </div>
                        <div class="info-account ms-2 w-100">
                            <p class="name-account">Nguyễn Đình B</p>
                            <p class="email-account">kiminonawa1305@gmail.com</p>
                        </div>
                    </div>
                    <!--Kết thức phần avatar và text-->
                    <div class="col-1 text-center">Nam</div>
                    <div class="col-1 text-center">200</div>
                    <div class="col-2 text-center">
                        <span class="money-spend-account">13,000,000</span>
                        <span class="text-decoration-underline">đ</span>
                    </div>
                    <div class="col-1 px-0 text-center">
                        <select name="account-role" class="rounded py-1">
                            <option value="account">tài khoản</option>
                            <option value="admin">admin</option>
                            <option value="shipper">Shipper</option>
                        </select>
                    </div>
                    <div class="col-1 text-center">
                        <input type="checkbox" name="lock-account-account" value="#123">
                    </div>
                </div>

                <div class="row account align-items-center ps-4" data-account-id="3" data-account-name="Nguyễn Đình C" data-lock-account="0" data-account-role="0">
                    <div class="col-2 id-account">#3</div>
                    <!--Phần avatar và text, coppy-->
                    <div class="col-4 d-flex">
                        <div class="avatar-account">
                            <img src="../logo.png" alt="avatar.png">
                        </div>
                        <div class="info-account ms-2 w-100">
                            <p class="name-account">Nguyễn Đình C</p>
                            <p class="email-account">kiminonawa1305@gmail.com</p>
                        </div>
                    </div>
                    <!--Kết thức phần avatar và text-->
                    <div class="col-1 text-center">Nam</div>
                    <div class="col-1 text-center">200</div>
                    <div class="col-2 text-center">
                        <span class="money-spend-account">13,000,000</span>
                        <span class="text-decoration-underline">đ</span>
                    </div>
                    <div class="col-1 px-0 text-center">
                        <select name="account-role" class="rounded py-1">
                            <option value="account">tài khoản</option>
                            <option value="admin">admin</option>
                            <option value="shipper">Shipper</option>
                        </select>
                    </div>
                    <div class="col-1 text-center">
                        <input type="checkbox" name="lock-account-account" value="#123">
                    </div>
                </div>

                <div class="row account align-items-center ps-4" data-account-id="4" data-account-name="Nguyễn Đình D" data-lock-account="1" data-account-role="1">
                    <div class="col-2 id-account">#4</div>
                    <!--Phần avatar và text, coppy-->
                    <div class="col-4 d-flex">
                        <div class="avatar-account">
                            <img src="../logo.png" alt="avatar.png">
                        </div>
                        <div class="info-account ms-2 w-100">
                            <p class="name-account">Nguyễn Đình D</p>
                            <p class="email-account">kiminonawa1305@gmail.com</p>
                        </div>
                    </div>
                    <!--Kết thức phần avatar và text-->
                    <div class="col-1 text-center">Nam</div>
                    <div class="col-1 text-center">200</div>
                    <div class="col-2 text-center">
                        <span class="money-spend-account">13,000,000</span>
                        <span class="text-decoration-underline">đ</span>
                    </div>
                    <div class="col-1 px-0 text-center">
                        <select name="account-role" class="rounded py-1">
                            <option value="account">tài khoản</option>
                            <option value="admin">admin</option>
                            <option value="shipper">Shipper</option>
                        </select>
                    </div>
                    <div class="col-1 text-center">
                        <input type="checkbox" name="lock-account-account" value="#123">
                    </div>
                </div>

                <div class="row account align-items-center ps-4" data-account-id="5" data-account-name="Nguyễn Đình E" data-lock-account="0" data-account-role="2">
                    <div class="col-2 id-account">#5</div>
                    <!--Phần avatar và text, coppy-->
                    <div class="col-4 d-flex">
                        <div class="avatar-account">
                            <img src="../logo.png" alt="avatar.png">
                        </div>
                        <div class="info-account ms-2 w-100">
                            <p class="name-account">Nguyễn Đình E</p>
                            <p class="email-account">kiminonawa1305@gmail.com</p>
                        </div>
                    </div>
                    <!--Kết thức phần avatar và text-->
                    <div class="col-1 text-center">Nam</div>
                    <div class="col-1 text-center">200</div>
                    <div class="col-2 text-center">
                        <span class="money-spend-account">13,000,000</span>
                        <span class="text-decoration-underline">đ</span>
                    </div>
                    <div class="col-1 px-0 text-center">
                        <select name="account-role" class="rounded py-1">
                            <option value="account">tài khoản</option>
                            <option value="admin">admin</option>
                            <option value="shipper">Shipper</option>
                        </select>
                    </div>
                    <div class="col-1 text-center">
                        <input type="checkbox" name="lock-account-account" value="#123">
                    </div>
                </div>

                <div class="row account align-items-center ps-4" data-account-id="6" data-account-name="Nguyễn Đình F" data-lock-account="1" data-account-role="2">
                    <div class="col-2 id-account">#6</div>
                    <!--Phần avatar và text, coppy-->
                    <div class="col-4 d-flex">
                        <div class="avatar-account">
                            <img src="../logo.png" alt="avatar.png">
                        </div>
                        <div class="info-account ms-2 w-100">
                            <p class="name-account">Nguyễn Đình F</p>
                            <p class="email-account">kiminonawa1305@gmail.com</p>
                        </div>
                    </div>
                    <!--Kết thức phần avatar và text-->
                    <div class="col-1 text-center">Nam</div>
                    <div class="col-1 text-center">200</div>
                    <div class="col-2 text-center">
                        <span class="money-spend-account">13,000,000</span>
                        <span class="text-decoration-underline">đ</span>
                    </div>
                    <div class="col-1 px-0 text-center">
                        <select name="account-role" class="rounded py-1">
                            <option value="account">tài khoản</option>
                            <option value="admin">admin</option>
                            <option value="shipper">Shipper</option>
                        </select>
                    </div>
                    <div class="col-1 text-center">
                        <input type="checkbox" name="lock-account-account" value="#123">
                    </div>
                </div>

                <div class="row account align-items-center ps-4" data-account-id="7" data-account-name="Nguyễn Đình G" data-lock-account="0" data-account-role="1">
                    <div class="col-2 id-account">#7</div>
                    <!--Phần avatar và text, coppy-->
                    <div class="col-4 d-flex">
                        <div class="avatar-account">
                            <img src="../logo.png" alt="avatar.png">
                        </div>
                        <div class="info-account ms-2 w-100">
                            <p class="name-account">Nguyễn Đình G</p>
                            <p class="email-account">kiminonawa1305@gmail.com</p>
                        </div>
                    </div>
                    <!--Kết thức phần avatar và text-->
                    <div class="col-1 text-center">Nam</div>
                    <div class="col-1 text-center">200</div>
                    <div class="col-2 text-center">
                        <span class="money-spend-account">13,000,000</span>
                        <span class="text-decoration-underline">đ</span>
                    </div>
                    <div class="col-1 px-0 text-center">
                        <select name="account-role" class="rounded py-1">
                            <option value="account">tài khoản</option>
                            <option value="admin">admin</option>
                            <option value="shipper">Shipper</option>
                        </select>
                    </div>
                    <div class="col-1 text-center">
                        <input type="checkbox" name="lock-account-account" value="#123">
                    </div>
                </div>
            </div>

            <!--Phần footer, coppy-->
            <div class="footer-table row p-4 d-flex align-items-center">
                <div class="text-amount-account col-8 ">
                    <span class="ps-0 pe-0">Tổng số tài khoản: </span>
                    <span class="amount ps-0 pe-0">100</span>
                    <span class="ps-0 pe-0"> tài khoản</span>
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
                    <button class="d-flex align-items-center justify-content-center button-number" data-target="">...
                    </button>
                    <button class="d-flex align-items-center justify-content-center button-number" data-target="14">14
                    </button>
                    <button class="d-flex align-items-center justify-content-center button-number" data-target="15">15
                    </button>
                    <button id="next" class="d-flex align-items-center justify-content-center"><span
                            class="material-symbols-outlined">chevron_right</span></button>
                </div>
            </div>
            <!--kết thúc footer-->
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
                <a href="danh_sach_tai_khoan.html">
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
<script src="../javascript/danh_sach_tai_khoan.js"></script>
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
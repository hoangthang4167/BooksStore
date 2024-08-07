<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Semicolons &mdash; Book Store</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
    <link rel="stylesheet" href="/static/customer/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/static/customer/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/customer/css/magnific-popup.css">
    <link rel="stylesheet" href="/static/customer/css/jquery-ui.css">
    <link rel="stylesheet" href="/static/customer/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/static/customer/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="/static/customer/css/aos.css">

    <link rel="stylesheet" href="/static/customer/css/style.css">
    <link rel="shortcut icon" type="image/png" href="/static/customer/images/logosemicolons.png" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@200;300;400;500;600;700;800&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

</head>
<body>

<div class="site-wrap">
    <header class="site-navbar" role="banner">
        <div class="site-navbar-top">
            <div class="container">
                <div class="row align-items-center">

                    <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
                        <c:if test="${showSearch}">
                            <form action="/shopCustomer/timSach" method="get" class="site-block-top-search">
                                <span class="icon icon-search2"></span> <input type="text"
                                                                               name="tenSach" value="${tenSach}"
                                                                               class="form-control border-0"
                                                                               placeholder="Tìm Kiếm Theo Tên Sách">
                            </form>
                        </c:if>
                    </div>
                    <div
                            class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
                        <div class="site-logo">
                            <a href="/indexCustomer" class="js-logo-clone">Semicolons</a>
                        </div>
                    </div>

                    <div class="col-6 col-md-4 order-3 order-md-3 text-right">
                        <div class="site-top-icons">
                            <ul>
                                <c:choose>
                                    <c:when test="${not empty sessionScope.nguoiDung}">
                                        <li class="dropdown">
                                            <a class="dropdown-toggle" id="profileDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="icon icon-person"></span>
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="profileDropdown">
                                                <a class="dropdown-item" href="/myprofileCustomer">Thông tin cá nhân</a>
                                                <a class="dropdown-item" href="/myOrders">Đơn hàng đã đặt</a>
                                                <a style=" text-decoration: none;" onmouseover="this.style.color='red'" onmouseout="this.style.color='#8c92a0'" class="dropdown-item" href="/logout">Đăng Xuất</a>
                                            </div>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="/loginForm"><span class="icon icon-person"></span></a></li>
                                    </c:otherwise>
                                </c:choose>
                                <li><a href="/view-to-cart" class="site-cart"> <span class="icon icon-shopping_cart"></span> <span class="count">${cartsize}</span></a></li>
                                <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <nav class="site-navigation text-right text-md-center"
             role="navigation">
            <div class="container">
                <ul class="site-menu js-clone-nav d-none d-md-block">
                    <li><a href="/indexCustomer">HOME</a></li>
                    <li class=""><a href="/aboutCustomer">About</a></li>
                    <li><a href="/shopCustomer">Shop</a></li>
                    <li><a href="/contactCustomer">Contact</a></li>
                    <li><a href="/FAQCustomer">FAQ</a></li>
                    <li><a href="/eventCustomer">Events</a></li>
                    <li><a href="/donhangchitiet/Bestsellingproductpage">Bestselling Books</a></li>

                </ul>
            </div>
        </nav>
    </header>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function(){
            // Khi liên kết được nhấp vào
            $('.dropdown-toggle').click(function(e){
                e.preventDefault();
                var $dropdownMenu = $(this).next('.dropdown-menu');

                // Ẩn tất cả các menu con khác trước khi hiển thị
                $('.dropdown-menu').not($dropdownMenu).hide();

                // Hiển thị hoặc ẩn menu con tương ứng
                $dropdownMenu.toggle();
            });

            // Ẩn menu con khi click bất kỳ đâu trên trang
            $(document).click(function(e) {
                if (!$(e.target).closest('.dropdown').length) {
                    $('.dropdown-menu').hide();
                }
            });
        });
    </script>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0"><a href="/indexCustomer">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Bestsellers</strong></div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-3 text-black">Bestsellers Tại Semicolons: </h2>
                </div>
                <div class="col-md-7">

                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="2000">
                        <ol class="carousel-indicators">
                            <c:forEach var="item" items="${a}" varStatus="loop">
                                <li data-target="#carouselExampleIndicators" data-slide-to="${loop.index}" class="<c:if test="${loop.index == 0}">active</c:if>"></li>
                            </c:forEach>
                        </ol>
                        <div class="carousel-inner">
                            <c:forEach var="item" items="${topOrders}" varStatus="loop">
                                <div class="carousel-item <c:if test="${loop.index == 0}">active</c:if>">
                                    <div class="container">
                                        <div class="row justify-content-center">
                                            <div class="mb-4" data-aos="fade-up" >
                                                <div class="block-4 text-center border" style="width: 400px">
                                                    <figure class="block-4-image">
                                                        <a href="/shopCustomer/shop-singleCustomer?maSach=${item.sach.maSach}">
                                                            <img src="/static/customer/images/DauSach/${item.sach.hinh}" style="height: 450px" alt="Image placeholder" class="img-fluid"></a>
                                                    </figure>
                                                    <div class="block-4-text p-4">
                                                        <h3>
                                                            <a href="/shopCustomer/shop-singleCustomer?maSach=${item.sach.maSach}">${item.sach.tenSach}</a>
                                                        </h3>
                                                        <p class="mb-0">Số lượng đã bán : ${item.soLuong}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>






                </div>
                <div class="col-md-5 ml-auto">

                    <div class=" pt-3 mb-4">
                        <h2 class="text-black">Khám Phá Các Thể Loại Sách Đang Hot Nhất</h2>
                    </div>
                    <p>Đặc trưng bởi sự đa dạng và chất lượng, cửa hàng Semicolons tự hào giới thiệu những tác phẩm bán chạy đa dạng, từ những tiểu thuyết gây nghiện đến sách hướng dẫn hữu ích</p>
                    <p>mang đến cho bạn trải nghiệm đọc sách tuyệt vời và đa chiều.</p>

                </div>



                </div>
            </div>
        </div>
    </div>

    <footer class="site-footer border-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="footer-heading mb-4">Điều hướng</h3>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <ul class="list-unstyled">
                                <li><a href="#">Bán trực tuyến</a></li>
                                <li><a href="#">Đặc trưng</a></li>
                                <li><a href="#">Giỏ hàng</a></li>
                                <li><a href="#">Người xây dựng cửa hàng</a></li>
                            </ul>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <ul class="list-unstyled">
                                <li><a href="#">Thương mại di động</a></li>
                                <li><a href="#">Vận chuyển thả</a></li>
                                <li><a href="#">Phát triển trang web</a></li>
                            </ul>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <ul class="list-unstyled">
                                <li><a href="#">Điểm bán hàng</a></li>
                                <li><a href="#">Phần cứng</a></li>
                                <li><a href="#">Phần mềm</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <h3 class="footer-heading mb-4">Khuyến Mãi</h3>
                    <a href="#" class="block-6">
                        <img src="/static/customer/images/sach2.jpg" alt="Image placeholder" class="img-fluid rounded mb-4">
                        <h3 class="font-weight-light  mb-0">Tìm những cuốn sách hoàn hảo của bạn</h3>
                        <p>Khuyến mãi từ 20 &mdash; 30/09, 2023</p>
                    </a>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="block-5 mb-5">
                        <h3 class="footer-heading mb-4">Thông tin liên hệ</h3>
                        <ul class="list-unstyled">
                            <li class="address">Đường Võ Nguyên Giáp, Hoài Mỹ, Hoài Nhơn, Bình Định</li>
                            <li class="phone"><a href="tel://23923929210">+84376758600</a></li>
                            <li class="email">ads.tranvannhan@gmail.com</li>
                        </ul>
                    </div>

                    <div class="block-7">
                        <form action="#" method="post">
                            <label for="email_subscribe" class="footer-heading">Đăng ký</label>
                            <div class="form-group">
                                <input type="text" class="form-control py-4" id="email_subscribe" placeholder="Email">
                                <input type="submit" class="btn btn-sm btn-primary" value="Gửi">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row pt-5 mt-5 text-center">
                <div class="col-md-12">
                    <p>

                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> &mdash; Proudly created with Tran Van Nhan and Trinh Duy Bao</a>

                    </p>
                </div>
            </div>
        </div>
    </footer>
</div>

<script src="/static/customer/js/jquery-3.3.1.min.js"></script>
<script src="/static/customer/js/jquery-ui.js"></script>
<script src="/static/customer/js/popper.min.js"></script>
<script src="/static/customer/js/bootstrap.min.js"></script>
<script src="/static/customer/js/owl.carousel.min.js"></script>
<script src="/static/customer/js/jquery.magnific-popup.min.js"></script>
<script src="/static/customer/js/aos.js"></script>

<script src="/static/customer/js/main.js"></script>

</body>
</html>
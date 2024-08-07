<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Header</title>
</head>
<body>
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

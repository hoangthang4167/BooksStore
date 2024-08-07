<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Semicolons &mdash; Book Store</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
    <link rel="stylesheet" href="/static/customer/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/static/customer/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/customer/css/magnific-popup.css">
    <link rel="stylesheet" href="/static/customer/css/jquery-ui.css">
    <link rel="stylesheet" href="/static/customer/css/owl.carousel.min.css">
    <link rel="stylesheet"
          href="/static/customer/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="/static/customer/css/aos.css">

    <link rel="stylesheet" href="/static/customer/css/style.css">
    <link rel="shortcut icon" type="image/png"
          href="/static/customer/images/logosemicolons.png"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Dosis:wght@200;300;400;500;600;700;800&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
</head>
<body>

<div class="site-wrap">
    <%@ include file="header.jsp" %>
    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="/indexCustomer">Home</a> <span class="mx-2 mb-0">/</span> <strong
                        class="text-black">Shop</strong>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">

            <div class="row mb-5">
                <div class="col-md-9 order-2">

                    <div class="row">
                        <div class="col-md-12 mb-5">
                            <div class="float-md-left mb-4">
                                <h2 class="text-black h5">Shop All</h2>
                            </div>
                            <div class="d-flex">
                                <div class="dropdown mr-1 ml-md-auto"></div>
                                <div class="btn-group">
                                    <button type="button"
                                            class="btn btn-secondary btn-sm dropdown-toggle"
                                            id="dropdownMenuReference" data-toggle="dropdown">Reference
                                    </button>
                                    <div class="dropdown-menu"
                                         aria-labelledby="dropdownMenuReference">
                                        <a class="dropdown-item" href="/shopCustomer">Relevance</a>
                                        <a class="dropdown-item" href="/shopCustomer?sortOrder=lth">Price, low to
                                            high</a> <a
                                            class="dropdown-item" href="/shopCustomer?sortOrder=htl">Price, high to
                                        low</a>
                                        <%--<div class="dropdown-divider"></div>--%>
                                        <%--<a
                                            class="dropdown-item" href="/shopCustomer?sortOrder=az">Name, A to Z</a> <a
                                            class="dropdown-item" href="/shopCustomer?sortOrder=za">Name, Z to A</a>--%>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-5">
                        <c:forEach var="item" items="${dsSach.content}">
                            <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                                <div class="block-4 text-center border">
                                    <figure class="block-4-image">
                                        <a href="/shopCustomer/shop-singleCustomer?maSach=${item.maSach}">
                                            <img src="/static/customer/images/DauSach/${item.hinh}"
                                                 alt="Image placeholder" class="img-fluid"></a>
                                    </figure>
                                    <div class="block-4-text p-4">
                                        <h3>
                                            <a href="/shopCustomer/shop-singleCustomer?maSach=${item.maSach}">${item.tenSach}</a>
                                        </h3>
                                        <p class="mb-0">${item.tacGia}</p>
                                            <%-- Convert giá thành chuỗi --%>
                                        <c:set var="formattedPrice" value="${item.gia}" />
                                            <%-- Tạo hàm JavaScript để định dạng số theo mong muốn --%>
                                        <script>
                                            function formatNumber(num) {
                                                return num.toLocaleString('vi', { minimumFractionDigits: 0 });
                                            }
                                        </script>
                                            <%-- Gọi hàm JavaScript để hiển thị số --%>
                                        <p class="text-primary font-weight-bold">
                                            <script>document.write(formatNumber(${formattedPrice}));</script> VNĐ
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="row" data-aos="fade-up">
                        <div class="col-md-12 text-center">
                            <div class="site-block-27">
                                <ul>
                                    <li><a href="?mL=${item.maLoai}&p=0&tenSach=${tenSach}">&lt;</a></li>
                                    <li>
                                        <a href="?mL=${item.maLoai}&p=${dsSach.number - 1}&tenSach=${tenSach}">&lt;&lt;</a>
                                    </li>
                                    <li>
                                        <a href="?mL=${item.maLoai}&p=${dsSach.number + 1}&tenSach=${tenSach}">&gt;&gt;</a>
                                    </li>
                                    <li>
                                        <a href="?mL=${item.maLoai}&p=${dsSach.totalPages - 1}&tenSach=${tenSach}">&gt;</a>
                                    </li>
                                    <%--										<li><a href="<%= request.getRequestURI() %>?mL=${item.maLoai}&p=0">&lt;</a></li>--%>
                                    <%--										<li><a href="<%= request.getRequestURI() %>?mL=${item.maLoai}&p=${dsSach.number - 1}">&lt;&lt;</a></li>--%>
                                    <%--										<li><a href="<%= request.getRequestURI() %>?mL=${item.maLoai}&p=${dsSach.number + 1}">&gt;&gt;</a></li>--%>
                                    <%--										<li><a href="<%= request.getRequestURI() %>?mL=${item.maLoai}&p=${dsSach.totalPages - 1}">&gt;</a></li>--%>
                                    <%--										<li><a href="/shopCustomer/loaiSach?mL=${item.maLoai}&p=0">&lt;</a></li>--%>
                                    <%--										<li><a href="/shopCustomer/loaiSach?mL=${item.maLoai}&p=${dsSach.number - 1}">&lt;&lt;</a></li>--%>
                                    <%--										<li><a href="/shopCustomer/loaiSach?mL=${item.maLoai}&p=${dsSach.number + 1}">&gt;&gt;</a></li>--%>
                                    <%--										<li><a href="/shopCustomer/loaiSach?mL=${item.maLoai}&p=${dsSach.totalPages - 1}">&gt;</a></li>--%>
                                    <%--<li><a href="/shopCustomer?p=0">&lt;</a></li>
                                    <li><a href="/shopCustomer?p=${dsSach.number-1}">&lt;&lt;</a></li>
                                    <!-- class="active" -->
                                    <li><a href="/shopCustomer?p=${dsSach.number+1}">&gt;&gt;</a></li>
                                    <li><a href="/shopCustomer?p=${dsSach.totalPages-1}">&gt;</a></li>--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 order-1 mb-5 mb-md-0">
                    <div class="border p-4 rounded mb-4">
                        <h3 class="mb-3 h6 text-uppercase text-black d-block">THỂ
                            LOẠI</h3>
                        <ul class="list-unstyled mb-0">

                            <c:forEach var="item" items="${dsLoaiSachVaSoLuong}">
                                <li class="mb-1"><a
                                        href="/shopCustomer/loaiSach?mL=${item.maLoai}&p=0"
                                        class="d-flex"><span>${item.tenLoai}</span><span
                                        class="text-black ml-auto">(${item.soluongsach})</span></a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
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
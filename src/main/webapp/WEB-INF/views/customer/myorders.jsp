<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--pageEncoding="UTF-8"%>--%>
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
    <link rel="shortcut icon" type="image/png" href="/static/customer/images/logosemicolons.png"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@200;300;400;500;600;700;800&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">

</head>
<body>

<div class="site-wrap">
    <%@ include file="header.jsp" %>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0"><a href="/indexCustomer">Home</a> <span class="mx-2 mb-0">/</span> <strong
                        class="text-black">My Orders</strong></div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">Mã Đơn Hàng</th>
                        <th scope="col">Tên Người Đặt</th>
                        <th scope="col">Ngày Đặt Hàng</th>
                        <th scope="col">Địa Chỉ</th>
                        <th scope="col">Tổng Tiền</th>
                        <th scope="col">Xem Chi Tiết</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="donHang" items="${listOrder}">
                    <tr>
                        <td>${donHang.maDonHang}</td>
                        <td>${donHang.nguoiDung.tenNguoiDung}</td>
                        <td><fmt:formatDate value="${donHang.ngayDatHang}" pattern="dd/MM/yyyy"/></td>
                        <td>${donHang.diaChi}</td>
                        <td>
                            <!-- Đặt biến totalPrice ở mức trên của vòng lặp -->
                            <c:set var="totalPrice" value="0" scope="request" />
                            <c:forEach var="item" items="${donHang.dsDonHangChiTiet}">
                                <!-- Cộng giá tiền (giá tiền * số lượng) vào biến tổng -->
                                <c:set var="subtotal" value="${item.sach.gia * item.soLuong}" />
                                <c:set var="totalPrice" value="${totalPrice + subtotal}" />
                            </c:forEach>
                            <script>
                                function formatNumber(num) {
                                    return num.toLocaleString('vi', {minimumFractionDigits: 0});
                                }
                            </script>
                            <p><script>document.write(formatNumber(${totalPrice}));</script> VNĐ</p>
                            <c:set var="totalPrice" value="0"/>
                        </td>
                        <td class="text-center">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${donHang.maDonHang}">
                                Xem Chi Tiết
                            </button>
                        </td>
                    <tr>
                        <div class="modal fade" id="exampleModal${donHang.maDonHang}" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Sản phẩm có trong đơn hàng</h5>
                                    </div>
                                    <div class="modal-body">
                                        <div class="h-25 mx-auto w-100 mt-2 p-0 d-flex align-items-center">
                                            <div class="h-100 w-25 d-flex align-items-center justify-content-center">
                                                Hình Ảnh
                                            </div>
                                            <div class="w-25 text-center">
                                                Tên Sách
                                            </div>
                                            <div class="w-25 text-center">
                                                Giá Tiền
                                            </div>
                                            <div class="w-25 text-center">
                                                Số Lượng
                                            </div>
                                        </div>
                                        <c:forEach var="item" items="${donHang.dsDonHangChiTiet}">
                                            <div class="h-25 mx-auto w-100 mt-2 p-0 d-flex align-items-center">
                                                <div class="h-100 w-25 d-flex align-items-center justify-content-center">
                                                    <a href="/shopCustomer/shop-singleCustomer?maSach=${item.sach.maSach}">
                                                        <img class="mx-auto"
                                                             src="/static/customer/images/DauSach/${item.sach.hinh}"
                                                             alt="Hình ảnh sách"
                                                             width="100px"></a>
                                                </div>
                                                <div class="w-25 text-center">
                                                    <a href="/shopCustomer/shop-singleCustomer?maSach=${item.sach.maSach}">
                                                            <p style="color: #8c92a0">${item.sach.tenSach}</p></a>
                                                </div>
                                                <div class="w-25 text-center">
                                                    <c:set var="formattedPrice" value="${item.sach.gia}"/>
                                                    <script>
                                                        function formatNumber(num) {
                                                            return num.toLocaleString('vi', {minimumFractionDigits: 0});
                                                        }
                                                    </script>
                                                    <p>
                                                        <script>document.write(formatNumber(${formattedPrice}));</script>
                                                        VNĐ
                                                    </p>
                                                </div>
                                                <div class="w-25 text-center">
                                                    <p>${item.soLuong}</p>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </tbody>
                    <script>
                        $(document).ready(function () {
                            $('button[data-toggle="modal"]').click(function () {
                                var maDonHang = $(this).data('ma-don-hang');
                                $('#exampleModal' + maDonHang).modal('show');
                            });
                        });
                    </script>
                </table>
            </div>
        </div>
    </div>
    <style>

    </style>
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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--	pageEncoding="UTF-8"%>--%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
                    <a href="/indexCustomer">Home</a> <span class="mx-2 mb-0">/</span>
                    <a href="/view-to-cart">Cart</a> <span class="mx-2 mb-0">/</span>
                    <strong class="text-black">Checkout</strong>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">

            <div class="row">
                <div class="col-md-6 mb-5 mb-md-0">
                    <h2 class="h3 mb-3 text-black">Chi tiết thanh toán</h2>
                    <div class="p-3 p-lg-5 border">
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_fname" class="text-black">Họ Và Tên <span
                                        class="text-danger">*</span></label> <input type="text"
                                                                                    class="form-control" id="c_fname"
                                                                                    name="c_fname"
                                                                                    value="${sessionScope.nguoiDung.tenNguoiDung}"
                                                                                    disabled>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_address" class="text-black">Địa Chỉ <span
                                        class="text-danger">*</span></label> <input type="text"
                                                                                    class="form-control" id="c_address"
                                                                                    name="c_address"
                                                                                    placeholder="Street address"
                                                                                    value="${sessionScope.nguoiDung.diaChi}"
                                                                                    disabled>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_phone" class="text-black">Số Điện Thoại <span
                                        class="text-danger">*</span></label> <input type="text"
                                                                                    class="form-control" id="c_phone"
                                                                                    name="c_phone"
                                                                                    placeholder="Phone Number"
                                                                                    value="${sessionScope.nguoiDung.soDienThoai}"
                                                                                    disabled>
                            </div>
                        </div>

                        <div class="form-group row mb-5">
                            <div class="col-md-12">
                                <label for="c_email" class="text-black">Email <span
                                        class="text-danger">*</span></label> <input type="text"
                                                                                    class="form-control" id="c_email"
                                                                                    name="c_phone"
                                                                                    placeholder="Phone Number"
                                                                                    value="${sessionScope.nguoiDung.email}"
                                                                                    disabled>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h3 mb-3 text-black">Đơn hàng của bạn</h2>
                            <div class="p-3 p-lg-5 border">
                                <table class="table site-block-order-table mb-5">
                                    <thead>
                                    <th>Sản Phẩm</th>
                                    <th>Tổng tiền</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${cart}">
                                        <tr>
                                            <td>${item.tensach}<strong class="mx-2">x</strong>
                                                    ${item.soluong}
                                            </td>
                                            <td>${item.soluong * item.gia}</td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td class="text-black font-weight-bold"><strong>Tổng
                                            tiền đơn hàng</strong></td>
                                        <td class="text-black font-weight-bold"><strong>$
                                            ${tongtien}</strong></td>
                                    </tr>
                                    </tbody>
                                </table>

                                <div class="border p-3 mb-3">
                                    <h3 class="h6 mb-0">
                                        <a class="d-block" data-toggle="collapse"
                                           href="#collapsebank" role="button" aria-expanded="false"
                                           aria-controls="collapsebank">Chuyển khoản trực tiếp</a>
                                    </h3>

                                    <div class="collapse" id="collapsebank">
                                        <div class="py-2">
                                            <p class="mb-0">Thực hiện thanh toán trực tiếp vào tài
                                                khoản ngân hàng của chúng tôi. Vui lòng không thay đổi nội dung chuyển
                                                tiền.</p>
                                            <p class="mb-0" style="color: #0b0b0b; font-weight: bold">Quét Mã QR.</p>
                                            <div class="row">
                                                <div class="col-6">
                                                    <img class="w-100" src="/static/customer/images/qrcode.png">
                                                </div>
                                                <div class="col-6">
                                                    <img class="w-75 mb-1"
                                                         src="/static/customer/images/Logo-Vietcombank.webp">
                                                    <p class="mb-0">Ngân Hàng: Vietcombank</p>
                                                    <p class="mb-0">Số Tài Khoản: 0051000567257</p>
                                                    <p class="mb-0">Chủ Tài Khoản: Trần Văn Nhân</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="border p-3 mb-5">
                                    <h3 class="h6 mb-0">
                                        <a class="d-block" data-toggle="collapse"
                                           href="#collapsepaypal" role="button" aria-expanded="false"
                                           aria-controls="collapsepaypal">Thanh Toán Khi Nhận Hàng</a>
                                    </h3>

                                    <div class="collapse" id="collapsepaypal">
                                        <div class="py-2">
                                            <p class="mb-0">Chúng tôi sẽ thu tiền khi hàng được giao đến tay bạn. Vui
                                                lòng chuẩn bị tiền mặt hoặc chuyển khoản cho người giao hàng.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <a href="/checkout">
                                        <button
                                                class="btn btn-primary btn-lg py-3 btn-block">Đặt
                                            hàng
                                        </button>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- </form> -->
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
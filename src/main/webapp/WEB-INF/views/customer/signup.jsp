<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@200;300;400;500;600;700;800&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
    <link rel="shortcut icon" type="image/png" href="/static/customer/images/logosemicolons.png"/>
    <link rel="stylesheet" href="/static/css/login.css">
</head>

<body>
<div class="site-wrap">
    <%@ include file="header.jsp" %>
    <div class="site-section mt-0 pt-3">
        <div class="container mt-0">
            <div class="row mt-0">
                <div class="w-75 mx-auto mt-0">
                    <h2 class="h3 mb-3 text-black">Đăng Ký</h2>
                </div>
                <div class="w-75 mx-auto">
                    <form:form action="/signup" modelAttribute="acc" method="post">
                        <div class="p-0 p-lg-3 border">
                            <div class="form-group row mb-3">
                                <div class="w-75 mx-auto">
                                    <label for="username" class="text-black">Tên Đăng Nhập <span
                                            class="text-danger">*</span></label>
                                    <form:input path="tenDangNhap" id="username" class="form-control"
                                                type="text" placeholder="Nhập Tên Đăng Nhập"/>
                                    <form:errors path="tenDangNhap" class="err"/>
                                    <c:if test="${errUserNameExist}"><span class="err">Tên Đăng Nhập đã tồn tại trên hệ thống !</span></c:if>
                                </div>
                                <div class="w-75 mx-auto mt-2">
                                    <label for="password" class="text-black">Mật Khẩu <span class="text-danger">*</span></label>
                                    <form:input path="matKhau" class="form-control" id="password"
                                                type="password" placeholder="Nhập Mật Khẩu"/>
                                    <form:errors path="matKhau" class="err"/>
                                </div>
                                <div class="w-75 mx-auto mt-2">
                                    <label for="repassword" class="text-black">Xác Nhận Mật Khẩu <span
                                            class="text-danger">*</span></label>
                                    <input name="xNMatKhau" class="form-control" id="repassword"
                                           type="password" placeholder="Nhập Xác Nhận Mật Khẩu" value="${xnMK}">
                                    <c:if test="${err}"><span class="err">Vui lòng nhập Xác Nhận Mật Khẩu</span></c:if>
                                    <c:if test="${errNoEquals}"><span class="err">Xác Nhận Mật Khẩu không trùng với Mật Khẩu</span></c:if>
                                </div>
                                <div class="w-100 mx-auto mt-2 row">
                                    <div class="col-6">
                                        <label for="fullname" class="text-black">Họ Và Tên <span
                                                class="text-danger">*</span></label>
                                        <form:input path="tenNguoiDung" class="form-control" id="fullname"
                                                    type="text" placeholder="Nhập Họ Và Tên"/>
                                        <form:errors path="tenNguoiDung" class="err"/>
                                    </div>
                                    <div class="col-6">
                                        <label for="phone" class="text-black">Số Điện Thoại <span
                                                class="text-danger">*</span></label>
                                        <form:input path="soDienThoai" class="form-control" id="phone"
                                                    type="text" placeholder="Nhập Số Điện Thoại"/>
                                        <form:errors path="soDienThoai" class="err"/>
                                    </div>
                                </div>
                                <div class="w-75 mx-auto mt-2">
                                    <label for="address" class="text-black">Địa Chỉ <span
                                            class="text-danger">*</span></label>
                                    <form:input path="diaChi" class="form-control" id="address"
                                                type="text" placeholder="Nhập Địa Chỉ"/>
                                    <form:errors path="diaChi" class="err"/>
                                </div>
                                <div class="w-75 mx-auto mt-2">
                                    <label for="email" class="text-black">Email <span
                                            class="text-danger">*</span></label>
                                    <form:input path="email" class="form-control" id="email"
                                                type="email" placeholder="Nhập Địa Chỉ"/>
                                    <form:errors path="email" class="err"/>
                                </div>
                            </div>
                            <div class="text-center">
                                <c:if test="${mess}"><span class="success fs-5">Tạo Tài Khoản Thành Công</span></c:if>
                            </div>
                            <div class="form-group row mt-4">
                                <div class="col-lg-12">
                                    <input type="submit"
                                           class="btn btn-primary btn-lg btn-block fs2 rounded w-75 mx-auto"
                                           value="Đăng Ký">
                                </div>
                            </div>
                            <div class="text-center mt-4 mb-4">
                                <span>Bạn Đã Có Tài Khoản ? </span><a class="ms-2" href="/loginForm">Đăng Nhập</a>
                            </div>
                        </div>
                    </form:form>
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
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
                    <h2 class="h3 mb-3 text-black">Đăng Nhập</h2>
                </div>
                <div class="w-75 mx-auto">
                    <form action="/login" method="post">
                        <div class="p-3 p-lg-5 border">
                            <div class="form-group row mb-3">
                                <div class="w-75 mx-auto">
                                    <label for="username" class="text-black">Tên Đăng Nhập <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="username" name="tenDangNhap" placeholder="Nhập Tên Đăng Nhập">
                                </div>
                                <div class="w-75 mx-auto mt-3">
                                    <label for="password" class="text-black">Mật Khẩu <span class="text-danger">*</span></label>
                                    <input type="password" class="form-control" id="password" name="matKhau" placeholder="Nhập Mật Khẩu">
                                </div>
                            </div>
                            <div class="text-center">
                                <c:if test="${errACC}">
                                    <span class="err">Sai Tên Đăng Nhập hoặc Mật Khẩu</span>
                                </c:if>
                                <c:if test="${errRong}">
                                    <span class="err">Không Được Bỏ Trống Tên Đăng Nhập hoặc Mật Khẩu</span>
                                </c:if>
                            </div>
                            <div class="form-group row mt-4">
                                <div class="col-lg-12">
                                    <input type="submit" class="btn btn-primary btn-lg btn-block fs2 rounded w-75 mx-auto" value="Đăng Nhập">
                                </div>
                            </div>
                            <div class="text-center mt-4 mb-4">
                                <span>Don't have an account ?</span><a class="ms-2"
                                                                       href="/signupForm">Sign Up</a>
                            </div>
                        </div>
                    </form>
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
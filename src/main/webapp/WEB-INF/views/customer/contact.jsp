<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <style>
        .alert-container {
            width: 50%;
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #f2dede;
            color: #a94442;
            padding: 15px;
            border-radius: 5px;
            z-index: 9999;
        }
    </style>
    s
</head>
<body>

<div class="site-wrap">
    <%@ include file="header.jsp" %>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0"><a href="/indexCustomer">Home</a> <span class="mx-2 mb-0">/</span> <strong
                        class="text-black">Contact</strong></div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-3 text-black">Liên lạc</h2>
                </div>
                <div class="col-md-7">

                    <form action="/send/contact" method="post">
                        <div class="p-3 p-lg-5 border">
                            <script>
                                document.addEventListener('DOMContentLoaded', function() {
                                    const alertContainer = document.querySelector('.alert-container');

                                    alertContainer.style.display = 'none';

                                    // Hiển thị hoặc ẩn thông báo khi click vào nó
                                    alertContainer.addEventListener('click', function(event) {
                                        event.stopPropagation(); // Ngăn chặn sự lan truyền của sự kiện click đến body
                                    });

                                    // Ẩn thông báo khi click vào vùng trống bên ngoài
                                    document.body.addEventListener('click', function() {
                                        alertContainer.style.display = 'none';
                                    });

                                    // Hiển thị thông báo
                                    function showAlert(message, isSuccess) {
                                        const alertSpan = alertContainer.querySelector('span');
                                        alertSpan.textContent = message;
                                        alertContainer.style.backgroundColor = isSuccess ? '#dff0d8' : '#f2dede';
                                        alertContainer.style.display = 'block';
                                    }

                                    // Sử dụng mã JSTL để gọi hàm showAlert từ Controller
                                    <c:if test="${not empty message}">
                                    showAlert("${message}", "${message.startsWith('Gửi Tin Nhắn Thành Công')}");
                                    </c:if>
                                });
                            </script>
                            <div class="alert-container text-center">
                                <span style="font-size: 50px"></span>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <label for="fname" class="text-black">Họ <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="fname" name="fname">
                                </div>
                                <div class="col-md-6">
                                    <label for="lname" class="text-black">Tên <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="lname" name="lname">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_email" class="text-black">Email <span
                                            class="text-danger">*</span></label>
                                    <input type="email" class="form-control" id="c_email" name="from" placeholder="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="subject" class="text-black">Chủ đề </label>
                                    <input type="text" class="form-control" id="subject" name="subject">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="message" class="text-black">Tin Nhắn </label>
                                    <textarea name="message" id="message" cols="30" rows="7"
                                              class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="GỬI TIN NHẮN">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-5 ml-auto">
                    <div class="p-4 border mb-3">
                        <span class="d-block text-primary h6 text-uppercase">Hồ Chí Minh</span>
                        <p class="mb-0">375 Bình Thành, Bình Hưng Hòa B, Bình Tân, Hồ Chí Minh</p>
                    </div>
                    <div class="p-4 border mb-3">
                        <span class="d-block text-primary h6 text-uppercase">Bình Định</span>
                        <p class="mb-0">Đường Võ Nguyên Giáp, Hoài Mỹ, Hoài Nhơn, Bình Định</p>
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
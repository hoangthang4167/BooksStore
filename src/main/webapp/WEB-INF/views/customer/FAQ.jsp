<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--	pageEncoding="UTF-8"%>--%>
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
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@200;300;400;500;600;700;800&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
    <link rel="shortcut icon" type="image/png" href="/static/customer/images/logosemicolons.png"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
          integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Roboto&display=swap");

        .wrapper {
            max-width: 60%;
            margin: auto;
        }

        .wrapper > p,
        .wrapper > h1 {
            margin: 1.5rem 0;
            text-align: center;
        }

        .wrapper > h1 {
            letter-spacing: 3px;
        }

        .accordion {
            background-color: white;
            color: rgba(0, 0, 0, 0.8);
            cursor: pointer;
            font-size: 1.2rem;
            width: 100%;
            padding: 2rem 2.5rem;
            border: none;
            outline: none;
            transition: 0.4s;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: bold;
        }

        .accordion i {
            font-size: 1.6rem;
        }

        .active,
        .accordion:hover {
            background-color: #f1f7f5;
        }

        .pannel {
            margin: 20px;
            padding: 0 2rem 2.5rem 2rem;
            background-color: white;
            overflow: hidden;
            background-color: #f1f7f5;
            display: none;
        }

        .pannel p {
            color: rgba(0, 0, 0, 0.7);
            font-size: 1.2rem;
            line-height: 1.4;
        }

        .faq {
            border: 1px solid rgba(0, 0, 0, 0.2);
            margin: 10px 0;
        }

        .faq.active {
            border: none;
        }
    </style>
</head>
<body>

<div class="site-wrap">
    <%@ include file="header.jsp" %>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0"><a href="/indexCustomer">Home</a> <span class="mx-2 mb-0">/</span> <strong
                        class="text-black">FAQ</strong></div>
            </div>
        </div>
    </div>

    <div class="wrapper">
        <h1>CÁC CÂU HỎI THƯỜNG GẶP</h1>
        <div class="faq">
            <button class="accordion p-3">
                Làm thế nào để đặt một đơn hàng?
                <i class="arrow fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel pb-3">
                <p>
                    Để đặt hàng, bạn có thể chọn sản phẩm, thêm vào giỏ hàng, và tiếp tục quy trình thanh toán.
                    Xác nhận đơn hàng sẽ được gửi đến email của bạn.
                </p>
            </div>
        </div>
        <div class="faq">
            <button class="accordion p-3">
                Làm thế nào để tìm kiếm sách theo tác giả hoặc thể loại ?
                <i class="fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel pb-3">
                <p>
                    Trang web cung cấp hộp tìm kiếm và bộ lọc tùy chọn để bạn có thể dễ dàng tìm kiếm sách theo tác giả,
                    thể loại, hoặc từ khóa cụ thể.
                </p>
            </div>
        </div>

        <div class="faq">
            <button class="accordion p-3">
                Tôi đã đặt hàng nhưng chưa nhận được xác nhận. Làm thế nào để kiểm tra tình trạng đơn hàng?
                <i class="arrow fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel pb-3">
                <p>
                    Đăng nhập vào tài khoản của bạn và kiểm tra mục "Đơn hàng đã đặt".
                    Nếu bạn không nhìn thấy thông tin, hãy kiểm tra hòm thư spam hoặc liên hệ với chúng tôi qua
                    support@example.com.
                </p>
            </div>
        </div>

        <div class="faq">
            <button class="accordion p-3 pb-3">
                Tôi quên mật khẩu của mình. Làm cách nào để khôi phục?
                <i class="arrow fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel">
                <p>
                    Trên trang đăng nhập, chọn "Quên mật khẩu" và nhập địa chỉ email của bạn.
                    Một liên kết để khôi phục mật khẩu sẽ được gửi đến email của bạn.
                </p>
            </div>
        </div>
        <div class="faq">
            <button class="accordion p-3">
                Làm thế nào để liên hệ với bộ phận hỗ trợ khách hàng?
                <i class="arrow fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel pb-3">
                <p>
                    Bạn có thể liên hệ với chúng tôi qua trang Liên Hệ hoặc gửi email đến support@example.com.
                    Chúng tôi sẽ phản hồi trong thời gian sớm nhất.
                </p>
            </div>
        </div>

        <div class="faq">
            <button class="accordion p-3">
                Tôi muốn đề xuất một sách mới để thêm vào cửa hàng. Làm thế nào tôi có thể làm điều đó?
                <i class="arrow fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel pb-3">
                <p>
                    Chúng tôi rất hoan nghênh đề xuất từ cộng đồng. Vui lòng sử dụng trang Liên Hệ
                    để gửi thông tin về cuốn sách bạn muốn thêm vào cửa hàng.
                </p>
            </div>
        </div>

        <div class="faq">
            <button class="accordion p-3">
                Sách của tôi bị hỏng hoặc không đúng. Làm thế nào để đổi mới?
                <i class="arrow fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel pb-3">
                <p>
                    Chúng tôi xin lỗi về sự bất tiện này. Hãy liên hệ với chúng tôi qua trang Liên Hệ
                    và chúng tôi sẽ sắp xếp việc đổi mới hoặc hoàn trả.
                </p>
            </div>
        </div>


        <div class="faq">
            <button class="accordion p-3">
                Làm thế nào để đổi thông tin tài khoản?
                <i class="arrow fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel pb-3">
                <p>
                    Bạn có đổi thông tin tài khoản sau khi đăng nhập vào trang web của chúng tôi. Hãy kiểm tra ở menu có 1 icon hình người. Và bạn có thể chọn tuỳ chọn "Thông tin tài khoản".
                </p>
            </div>
        </div>


    </div>

    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;
        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function () {
                this.classList.toggle("active");
                this.parentElement.classList.toggle("active");

                var pannel = this.nextElementSibling;

                if (pannel.style.display === "block") {
                    pannel.style.display = "none";
                } else {
                    pannel.style.display = "block";
                }
            });
        }
    </script>


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
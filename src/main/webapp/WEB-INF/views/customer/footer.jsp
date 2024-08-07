<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Header</title>
</head>
<body>
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
              <li><a href="/loginForm">Đăng Nhập</a></li>
              <li><a href="/signupForm">Đăng Ký</a></li>
              <li><a href="/forgotPassword">Quên Mật Khẩu</a></li>
              <li><a href="/myprofileCustomer">Thông Tin Cá Nhân</a></li>
            </ul>
          </div>
          <div class="col-md-6 col-lg-4">
            <ul class="list-unstyled">
              <li><a href="/indexCustomer">Trang Chủ</a></li>
              <li><a href="/shopCustomer">Cửa Hàng</a></li>
              <li><a href="/contactCustomer">Liên Hệ</a></li>
              <li><a href="/aboutCustomer">Thông Tin</a></li>
            </ul>
          </div>
          <div class="col-md-6 col-lg-4">
            <ul class="list-unstyled">
              <li><a href="">Sách Bán Chạy</a></li>
              <li><a href="#">Hỏi Đáp</a></li>
              <li><a href="#">Sự Kiện</a></li>
              <li><a href="/view-to-cart">Giỏ Hàng</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
        <h3 class="footer-heading mb-4">Khuyến Mãi</h3>
        <a href="#" class="block-6">
          <img src="/static/customer/images/sach2.jpg" alt="Image placeholder" class="img-fluid rounded mb-4">
          <h3 class="font-weight-light  mb-0">Tìm những cuốn sách hoàn hảo của bạn</h3>
          <p>Khuyến mãi từ 10 &mdash; 30/12, 2023</p>
        </a>
      </div>
      <div class="col-md-6 col-lg-3">
        <div class="block-5 mb-5">
          <h3 class="footer-heading mb-4">Thông tin liên hệ</h3>
          <ul class="list-unstyled">
            <li class="address">Đường Võ Nguyên Giáp, Hoài Mỹ, Hoài Nhơn, Bình Định</li>
            <li class="phone"><a href="tel://23923929210">+84376758600</a></li>
            <li class="email">customercare.semicolons@gmail.com</li>
          </ul>
        </div>

        <%--<div class="block-7">
          <form action="#" method="post">
            <label for="email_subscribe" class="footer-heading">Đăng ký</label>
            <div class="form-group">
              <input type="text" class="form-control py-4" id="email_subscribe" placeholder="Email">
              <input type="submit" class="btn btn-sm btn-primary" value="Gửi">
            </div>
          </form>
        </div>--%>
      </div>
    </div>
    <div class="row pt-5 mt-5 text-center">
      <div class="col-md-12">
        <p>
          Copyright &copy;<script>document.write(new Date().getFullYear());</script> &mdash; Proudly created with Semicolons Team</a>
        </p>
      </div>
    </div>
  </div>
</footer>
</body>
</html>

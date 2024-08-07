<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@200;300;400;500;600;700;800&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/png" href="/static/customer/images/logosemicolons.png" />
  </head>
  <body>
  
  <div class="site-wrap">

    <%@ include file="header.jsp" %>

    <div class="site-blocks-cover" style="background-image: url(/static/customer/images/sach.jpg);" data-aos="fade">
      <div class="container">
        <div class="row align-items-start align-items-md-center justify-content-end">
          <div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
            <h1 class="mb-2">Tìm những cuốn sách hoàn hảo của bạn</h1>
            <div class="intro-text text-center text-md-left">
                <a href="/shopCustomer" class="btn btn-sm btn-primary">Mua Ngay</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section site-section-sm site-blocks-1">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="">
            <div class="icon mr-4 align-self-start">
              <span class="icon-truck"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">Free Shipping</h2>
              <p>Mọi sản phẩm của Cửa Hàng khi đặt hàng trực tuyến đều được miễn phí vận chuyển. Nếu có phát sinh phí vận chuyển vui lòng liên hệ Cửa Hàng.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-refresh2"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">Free Returns</h2>
              <p>Mọi sản phẩm của Cửa Hàng khi nhận hàng nếu cảm thấy không hài lòng có thể trả lại cho cửa hàng. Mọi chi phí về vấn đề trả hàng đều được Cửa Hàng chi trả và hoàn toàn miễn phí.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="200">
            <div class="icon mr-4 align-self-start">
              <span class="icon-help"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">Customer Support</h2>
              <p>Chúng tôi luôn hỗ trợ khách hàng về mọi vấn đề khách hàng gặp phải trong quá trình mua sản phẩm của Cửa Hàng chúng tôi.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%--<div class="site-section block-3 site-blocks-2 bg-light">
      <div class="container">
        <!-- <div class="row justify-content-center">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>Sản phẩm nổi bật</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="nonloop-block-3 owl-carousel">
            
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="/static/customer/images/Anh1.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Tâm Lý Học Tội Phạm - Phác Họa Chân Dung Kẻ Phạm Tội</a></h3>
                    <p class="mb-0"></p>
                    <p class="text-primary font-weight-bold">$50</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="/static/customer/images/Anh2.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Thao Túng Tâm Lý - Nhận Diện, Thức Tỉnh Và Chữa Lành Những Tổn Thương Tiềm Ẩn</a></h3>
                    <p class="mb-0"></p>
                    <p class="text-primary font-weight-bold">$100</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="/static/customer/images/Anh3.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Nghĩ Giàu & Làm Giàu (Tái Bản 2020)</a></h3>
                    <p class="mb-0"></p>
                    <p class="text-primary font-weight-bold">$50</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="/static/customer/images/Anh4.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Chiến Tranh Tiền Tệ - Phần 1 - Ai Thực Sự Là Người Giàu Nhất Thế Giới? (Tái bản 2022)</a></h3>
                    <p class="mb-0"></p>
                    <p class="text-primary font-weight-bold">$70</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="/static/customer/images/Anh5.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Đắc Nhân Tâm (Tái Bản 2021)</a></h3>
                    <p class="mb-0"></p>
                    <p class="text-primary font-weight-bold">$120</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div> -->
      </div>
    </div>--%>
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
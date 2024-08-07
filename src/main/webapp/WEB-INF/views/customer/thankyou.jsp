<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="shortcut icon" type="image/png" href="/static/customer/images/logosemicolons.png" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@200;300;400;500;600;700;800&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
  </head>
  <body>
  
  <div class="site-wrap">
    <%@ include file="header.jsp" %>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="/indexCustomer">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Contact</strong></div>
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <span class="icon-check_circle display-3 text-success"></span>
            <h2 class="display-3 text-black">Cảm Ơn!</h2>
            <p class="lead mb-5">Đơn hàng của bạn đã được hoàn tất thành công.</p>
            <p><a href="/indexCustomer" class="btn btn-sm btn-primary">Back to Home</a></p>
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
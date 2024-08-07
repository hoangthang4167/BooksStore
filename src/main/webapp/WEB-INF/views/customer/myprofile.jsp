<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dosis:wght@200;300;400;500;600;700;800&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" type="image/png"
	href="/static/customer/images/logosemicolons.png" />
</head>

<body>

	<div class="site-wrap">
		<%@ include file="header.jsp" %>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="/indexCustomer">Home</a> <span class="mx-2 mb-0">/</span>
						<strong class="text-black">My Profile</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section border-bottom" data-aos="fade">
			<div class="container">
				<%--<div class="card-action row">
					<a
						style="text-align: center; display: block; width: 100%;">
						<button class="btn btn-danger mx-auto w-25 mb-4"
							style="font-size: 25px !important;">- Đăng Xuất -</button>
					</a>
				</div>--%>
				<form action="/editProfile" method="post">
					<div class="card">
						<div class="card-header">
							<div class="card-title">Thông Tin Cá Nhân</div>
						</div>
						<div class="card-body">
							<div class="form-group">
								<label>Tên Đăng Nhập</label> <input type="text"
									class="form-control" name="tenDangNhap" placeholder="Tên Đăng Nhập"
									value="${nguoiDung.tenDangNhap}">
							</div>
							<div class="form-group">
								<label>Mật Khẩu</label> <input type="text"
									class="form-control" name="matKhau" placeholder="Mật Khẩu"
									value="${nguoiDung.matKhau}">
							</div>
							<div class="form-group">
								<label>Địa Chỉ</label> <input type="text"
									class="form-control" name="diaChi" placeholder="Địa Chỉ"
									value="${nguoiDung.diaChi}">
							</div>
							<div class="form-group">
								<label>Số Điện Thoại</label> <input type="text"
									class="form-control" name="soDienThoai" placeholder="Số Điện Thoại"
									value="${nguoiDung.soDienThoai}">
							</div>
							<div class="form-group">
								<label >Số Điện Thoại</label> <input type="text"
								class="form-control" name="email" placeholder="Email"
								value="${nguoiDung.email}">
							</div>
						</div>
						<input type="hidden" name="maNguoiDung"
							value="${nguoiDung.maNguoiDung}">
						<div class="card-action row">
							<button type="submit" class="btn btn-warning mx-auto w-25 mb-2">Sửa
								Thông Tin</button>
						</div>
					</div>
				</form>
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
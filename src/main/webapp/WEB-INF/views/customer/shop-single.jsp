<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Semicolons &mdash; Book Store</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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
	href="/static/customer/images/logosemicolons.png" />
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
						<a href="/indexCustomer">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Shop</strong> <span class="mx-2 mb-0">/</span>
						<strong class="text-black">${sach.tenSach}</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<img src="/static/customer/images/DauSach/${sach.hinh}" alt="Image"
							class="img-fluid">
					</div>
					<div class="col-md-6">
						<h2 class="text-black">${sach.tenSach}</h2>
						<p class="mb-4" style="font-weight: bold; font-size: larger">Tác Giả: ${sach.tacGia}</p>

						<p>Năm Xuất Bản:
							<fmt:formatDate value="${sach.namXuatBan}" pattern="dd/MM/yyyy" />
						</p>
						<p>Nhà Xuất Bản: ${sach.nhaXuatBan}</p>
						<c:set var="formattedPrice" value="${sach.gia}" />
						<%-- Tạo hàm JavaScript để định dạng số theo mong muốn --%>
						<script>
							function formatNumber(num) {
								return num.toLocaleString('vi', { minimumFractionDigits: 0 });
							}
						</script>
						<%-- Gọi hàm JavaScript để hiển thị số --%>
						<p>
							<strong class="text-primary h4"><script>document.write(formatNumber(${formattedPrice}));</script> VNĐ</strong>
						</p>
						<form action="/add-to-cart" method="post">
							<div class="mb-5">
								<div class="input-group mb-3" style="max-width: 120px;">
									<div class="input-group-prepend">
										<button class="btn btn-outline-primary js-btn-minus"
											type="button">&minus;</button>
									</div>
									<input name="soLuong" type="text" class="form-control text-center" value="1"
										placeholder="" aria-label="Example text with button addon"
										aria-describedby="button-addon1">
									<div class="input-group-append">
										<button class="btn btn-outline-primary js-btn-plus"
											type="button">&plus;</button>
									</div>
								</div>
							</div>
							<input type="hidden" name="maSach" value="${sach.maSach}">
							<input type="hidden" name="tenSach" value="${sach.tenSach}">
							<input type="hidden" name="gia" value="${sach.gia}">
							<input type="hidden" name="hinh" value="${sach.hinh}">

							<div class="d-grid gap-2 d-md-block">
								<button type="submit" class="buy-now btn btn-primary">Thêm vào giỏ hàng</button>
								<div><button type="button" class="mt-3 btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"  style="font-size: 15px">- Xem Thử Nội Dung -</button></div>
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">${sach.tenSach}</h1>
											</div>
											<div class="modal-body">
												${sach.xemTruoc}
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
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
										<img src="/static/customer/images/Anh1.jpg"
											alt="Image placeholder" class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Tâm Lý Học Tội Phạm - Phác Họa Chân Dung Kẻ
												Phạm Tội</a>
										</h3>
										<p class="mb-0"></p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="/static/customer/images/Anh2.jpg"
											alt="Image placeholder" class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Thao Túng Tâm Lý - Nhận Diện, Thức Tỉnh Và
												Chữa Lành Những Tổn Thương Tiềm Ẩn</a>
										</h3>
										<p class="mb-0"></p>
										<p class="text-primary font-weight-bold">$100</p>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="/static/customer/images/Anh3.jpg"
											alt="Image placeholder" class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Nghĩ Giàu & Làm Giàu (Tái Bản 2020)</a>
										</h3>
										<p class="mb-0"></p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="/static/customer/images/Anh4.jpg"
											alt="Image placeholder" class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Chiến Tranh Tiền Tệ - Phần 1 - Ai Thực Sự Là
												Người Giàu Nhất Thế Giới? (Tái bản 2022)</a>
										</h3>
										<p class="mb-0"></p>
										<p class="text-primary font-weight-bold">$70</p>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="/static/customer/images/Anh5.jpg"
											alt="Image placeholder" class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Đắc Nhân Tâm (Tái Bản 2021)</a>
										</h3>
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
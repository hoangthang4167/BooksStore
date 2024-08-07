<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--	pageEncoding="UTF-8"%>--%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
						<a href="/indexCustomer">Home</a> <span class="mx-2 mb-0">/</span>
						<strong class="text-black">Cart</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row mb-5">
					<form class="col-md-12" method="post">
						<div class="site-blocks-table">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="product-thumbnail">Hình Ảnh</th>
										<th class="product-name">Tên Sản Phẩm</th>
										<th class="product-price">Giá</th>
										<th class="product-quantity">Số Lượng</th>
										<th class="product-total">Tổng Tiền</th>
										<th class="product-remove">Xóa</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${cart}">
										<tr>
											<td class="product-thumbnail">
												<a href="/shopCustomer/shop-singleCustomer?maSach=${item.masach}"><img
														src="/static/customer/images/DauSach/${item.hinh}" alt="Image"
														class="img-fluid"></a>
											</td>
											<td class="product-name">
												<a href="/shopCustomer/shop-singleCustomer?maSach=${item.masach}"><h2 class="h5 text-black">${item.tensach}</h2></a>

											</td>
											<c:set var="formattedPrice" value="${item.gia}" />
												<%-- Tạo hàm JavaScript để định dạng số theo mong muốn --%>
											<script>
												function formatNumber(num) {
													return num.toLocaleString('vi', { minimumFractionDigits: 0 });
												}
											</script>
											<td><script>document.write(formatNumber(${formattedPrice}));</script> VNĐ</td>
											<td>
												<div class="input-group mb-3" style="max-width: 120px;">
													<!-- <div class="input-group-prepend">
														<button class="btn btn-outline-primary js-btn-minus"
															type="button">&minus;</button>
													</div> -->
													<input name="soLuong${item.masach}" type="text"
														class="form-control text-center" value="${item.soluong}"
														placeholder="" aria-label="Example text with button addon"
														aria-describedby="button-addon1">
													<!-- <div class="input-group-append">
														<button class="btn btn-outline-primary js-btn-plus"
															type="button">&plus;</button>
													</div> -->
												</div>

											</td>
											<c:set var="formattedTotal" value="${item.gia * item.soluong}" />
												<%-- Tạo hàm JavaScript để định dạng số theo mong muốn --%>
											<td><script>document.write(formatNumber(${formattedTotal}));</script> VNĐ</td>
											<td><a href="/remove-to-cart?maSach=${item.masach}"
												class="btn btn-primary btn-sm">X</a></td>
										</tr>
										<input type="hidden" name="mS" value="${sach.masach}">
									</c:forEach>

								</tbody>
							</table>

							<!-- div class="col-md-12 mb-3 mb-md-0">
								<button class="btn btn-warning btn-sm btn-block">Sửa
									Giỏ Hàng</button>
							</div> -->
						</div>
					</form>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="row mb-5">
							<!-- <div class="col-md-6 mb-3 mb-md-0">
								<a hidden="/remove-cart"><button
										class="btn btn-primary btn-sm btn-block">Xóa Toàn Bộ
										Giỏ Hàng</button></a>

							</div> -->
							<c:if test="${buttonremove}">
								<div class="col-md-6">
									<a href="/remove-cart"><button
											class="btn btn-outline-primary btn-sm btn-block">Xóa
											Toàn Bộ Giỏ Hàng</button></a>
								</div>
							</c:if>
							<div class="col-md-6">
								<a href="/shopCustomer"><button
										class="btn btn-outline-primary btn-sm btn-block">Tiếp
										Tục Mua Sắm</button></a>
							</div>
						</div>
					</div>
					<div class="col-md-6 pl-5">
						<div class="row justify-content-end">
							<div class="col-md-7">
								<div class="row">
									<div class="col-md-12 text-right border-bottom mb-5">
										<h3 class="text-black h4 text-uppercase">Tổng Tiền Giỏ
											Hàng</h3>
									</div>
								</div>

								<div class="row mb-5">
									<div class="col-md-6">
										<span class="text-black">Tổng</span>
									</div>
									<div class="col-md-6 text-right">
										<c:set var="formattedTotalCart" value="${tongtien}" />
										<strong class="text-black"><script>document.write(formatNumber(${formattedTotalCart}));</script> VNĐ</strong>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<c:if test="${buttoncheckout}">
											<c:choose>
												<c:when test="${not empty sessionScope.nguoiDung}">
													<a href="/cart-to-checkout"><button
															class="btn btn-primary btn-lg py-3 btn-block">Tiến
														hành Thanh Toán</button></a>
												</c:when>
												<c:otherwise>
													<a href="/loginForm"><button
															class="btn btn-primary btn-lg py-3 btn-block">Tiến
														hành Thanh Toán</button></a>
												</c:otherwise>
											</c:choose>

										</c:if>
									</div>
								</div>
							</div>
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
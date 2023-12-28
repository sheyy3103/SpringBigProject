<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><tiles:insertAttribute name="title" /></title>
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
<!-- Nucleo Icons -->
<link
	href="${pageContext.servletContext.contextPath}/resources/assets/css/nucleo-icons.css"
	rel="stylesheet" />
<link
	href="${pageContext.servletContext.contextPath}/resources/assets/css/nucleo-svg.css"
	rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<!-- Material Icons -->
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Round"
	rel="stylesheet">
<!-- CSS Files -->
<link id="pagestyle"
	href="${pageContext.servletContext.contextPath}/resources/assets/css/material-dashboard.css?v=3.1.0"
	rel="stylesheet" />
<!-- Nepcha Analytics (nepcha.com) -->
<!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
<script defer data-site="YOUR_DOMAIN_HERE"
	src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
<style type="text/css">
.radius-0375 {
	border-radius: 0.375rem !important;
}
</style>
</head>
<body class="bg-gray-200">
	<main class="main-content  mt-0">
		<div class="page-header align-items-start min-vh-100"
			style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');">
			<span class="mask bg-gradient-dark opacity-6"></span>
			<div class="container my-auto">
				<div class="row">
					<div class="col-lg-4 col-md-8 col-12 mx-auto">
						<div class="card z-index-0 fadeIn3 fadeInBottom ">
							<div
								class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
								<div
									class="bg-gradient-primary shadow-primary py-3 pe-1 radius-0375">
									<h4 class="text-white font-weight-bolder text-center mb-0">Đăng nhập</h4>
								</div>
							</div>
							<small class="form-text text-danger text-center pt-2">${msg }</small>
							<div class="card-body ${!empty(msg) ? 'pt-0' : '' }">
								<form role="form" class="text-start"
									action="<c:url value='loginProcess' />" method='POST'>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<div class="input-group input-group-outline my-3">
										<label class="form-label">Tên đăng nhập</label> <input
											type="text" class="form-control" name="username">
									</div>
									<div class="radius-0 input-group input-group-outline mb-3">
										<label class="form-label">Mật khẩu</label> <input
											type="password" class="form-control" name="password">
									</div>
									<div class="text-center">
										<button type="submit"
											class="btn bg-gradient-primary w-100 my-4 mb-2 radius-0375">Đăng
											nhập</button>
									</div>
									<p class="mt-4 text-sm text-center">
										Chưa có tài khoản? <a href=""
											class="text-primary text-gradient font-weight-bold">Đăng
											kí</a>
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer position-absolute bottom-2 py-2 w-100">
				<div class="container">
					<div class="row align-items-center justify-content-lg-between">
						<div class="col-12 col-md-6 my-auto">
							<div
								class="copyright text-center text-sm text-white text-lg-start">
								© 2023, made and developed <span class="font-weight-bold">Sheyy
									(Chrsalism)</span> for a better web.
							</div>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</main>
	<!--   Core JS Files   -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/core/popper.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/core/bootstrap.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script>
		var win = navigator.platform.indexOf('Win') > -1;
		if (win && document.querySelector('#sidenav-scrollbar')) {
			var options = {
				damping : '0.5'
			}
			Scrollbar.init(document.querySelector('#sidenav-scrollbar'),
					options);
		}
	</script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/material-dashboard.min.js?v=3.1.0"></script>
</body>
</html>
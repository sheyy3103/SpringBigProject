<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="entities.AccountDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<style>
.text-right {
	text-align: right !important;
}

.border-0 {
	border-radius: 0 !important;
}

body {
	letter-spacing: 1px !important;
}

footer {
	letter-spacing: 1px !important;
}

.custom-file-input::-webkit-file-upload-button {
	visibility: hidden;
}

.custom-file-input::before {
	content: 'Chọn ảnh';
	display: inline-block;
	background: linear-gradient(top, #f9f9f9, #e3e3e3);
	border: 1px solid #999;
	border-radius: 3px;
	padding: 5px 8px;
	outline: none;
	white-space: nowrap;
	-webkit-user-select: none;
	cursor: pointer;
	text-shadow: 1px 1px #fff;
	font-weight: 700;
	font-size: 10pt;
}

.custom-file-input:active::before {
	background: -webkit-linear-gradient(top, #e3e3e3, #f9f9f9);
}

.list {
	list-style: none;
	padding: 0;
	margin: 0;
}

.list tr {
	position: relative;
	margin-bottom: 10px;
}
</style>
</head>
<body class="g-sidenav-show  bg-gray-200">
	<%!AccountDetails account = (AccountDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();%>
	<aside
		class="sidenav navbar navbar-vertical navbar-expand-xs my-3 fixed-start ms-3 border-0 bg-gradient-dark"
		id="sidenav-main">
		<div class="sidenav-header">
			<i
				class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
				aria-hidden="true" id="iconSidenav"></i> <a class="navbar-brand m-0"
				href="${pageContext.servletContext.contextPath}/quan-tri"> <img
				src="${pageContext.servletContext.contextPath}/<% out.print(account.getAvatar()); %>"
				class="navbar-brand-img" alt="main_logo"> <span
				class="ms-1 font-weight-bold text-light">Trang quản trị</span>
			</a>
		</div>
		<hr class="horizontal light mt-0 mb-2">
		<div class="collapse navbar-collapse w-auto"
			id="sidenav-collapse-main">
			<ul class="navbar-nav">
				<li class="nav-item border-0"><a
					class="nav-link text-white <tiles:insertAttribute name="dashboard" />"
					href="${pageContext.servletContext.contextPath}/quan-tri"> <span
						class="nav-link-text ms-1">Trang chủ</span>
				</a></li>
				<li class="nav-item"><a
					class="nav-link text-white <tiles:insertAttribute name="category" />"
					href="${pageContext.servletContext.contextPath}/quan-tri/danh-muc-truyen">
						<span class="nav-link-text ms-1">Danh mục truyện</span>
				</a></li>
				<li class="nav-item"><a
					class="nav-link text-white <tiles:insertAttribute name="story" />"
					href="${pageContext.servletContext.contextPath}/quan-tri/danh-sach-truyen">
						<span class="nav-link-text ms-1">Danh sách truyện</span>
				</a></li>
				<li class="nav-item"><a class="nav-link text-white "
					href="<c:url value='/logout'/>"> <span
						class="nav-link-text ms-1">Đăng xuất</span>
				</a></li>
			</ul>
		</div>

	</aside>
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
		<div class="container-fluid py-4">
			<tiles:insertAttribute name="body" />
		</div>
	</main>
	<footer class="footer position-absolute bottom-2 py-2 w-100">
		<div class="container-fluid px-5">
			<div class="row align-items-center justify-content-end">
				<div class="col-6">
					<div class="copyright text-right">
						© 2023, made and developed <span class="font-weight-bold">Sheyy
							(Chrsalism)</span> for a better web.
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--   Core JS Files   -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/core/popper.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/core/bootstrap.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/chartjs.min.js"></script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/material-dashboard.min.js?v=3.1.0"></script>
</body>
</html>
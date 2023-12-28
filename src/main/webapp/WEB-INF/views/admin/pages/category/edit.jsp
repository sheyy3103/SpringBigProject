<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<a
	href="${pageContext.servletContext.contextPath}/quan-tri/danh-muc-truyen">&#8592; Quay
	lại danh sách</a>
<h1 class="text-uppercase py-3">Chỉnh sửa "${category.categoryId }"</h1>
<small class="text-danger">${error }</small>
<f:form action="" method="post" modelAttribute="category">
	<div class="form-group">
		<label>Mã danh mục:</label>
		<f:input path="categoryId"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3"
			placeholder="Nhập mã danh mục..." readonly="true"/>
	</div>
	<div class="form-group">
		<label>Tên danh mục:</label>
		<f:input path="categoryName"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3"
			placeholder="Nhập tên danh mục..." />
	</div>
	<button type="submit" class="btn btn-primary rounded-0">Lưu
		lại</button>
</f:form>
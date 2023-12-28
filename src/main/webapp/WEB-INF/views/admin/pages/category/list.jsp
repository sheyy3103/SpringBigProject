<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="text-uppercase py-3">Danh mục truyện</h1>
<a
	href="${pageContext.servletContext.contextPath}/quan-tri/danh-muc-truyen/them-moi"
	class="btn btn-success rounded-0" title="Thêm một danh mục truyện mới">Thêm
	mới danh mục</a>
<table class=" table table-borderless table-striped">
	<tr>
		<th scope="col">#</th>
		<th scope="col">Tên danh mục</th>
		<th scope="col"></th>
	</tr>

	<c:forEach var="c" items="${categories }">
		<tr>
			<th scope="row">${c.categoryId }</th>
			<td>${c.categoryName }</td>
			<td class="text-right"><a
				href="${pageContext.servletContext.contextPath}/quan-tri/danh-muc-truyen/chinh-sua?id=${c.categoryId}"
				class="btn btn-primary rounded-0 mb-0"
				title="Chỉnh sửa ${c.categoryName }"> Chỉnh sửa </a> <a
				href="${pageContext.servletContext.contextPath}/quan-tri/danh-muc-truyen/xoa?id=${c.categoryId}"
				class="btn btn-danger rounded-0 mb-0" title="Xóa ${c.categoryName }"
				onclick="return confirm('Bạn có chắc sẽ xóa ${c.categoryName} chứ?')">
					Xóa </a></td>
		</tr>
	</c:forEach>

</table>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="text-uppercase py-3">Danh sách truyện</h1>
<div class="d-flex justify-content-between align-items-center">
	<a
		href="${pageContext.servletContext.contextPath}/quan-tri/danh-sach-truyen/them-moi"
		class="btn btn-success rounded-0" title="Thêm một truyện mới">Thêm
		mới truyện</a>
	<form class="d-flex align-items-center">
		<input class="bg-white px-2 py-2 border-0 outline-0"
			placeholder="Search..." name="keyword" value="${param.keyword }">
		<button class="btn btn-outline-secondary rounded-0 mb-0" type="submit">Search</button>
	</form>
</div>
<table class=" table table-borderless table-striped">
	<tr>
		<th scope="col">#</th>
		<th scope="col">Tên truyện</th>
		<th scope="col">Ảnh</th>
		<th scope="col">Tác giả</th>
		<th scope="col">Tên danh mục</th>
		<th scope="col"></th>
	</tr>

	<c:forEach var="s" items="${stories }">
		<tr>
			<th scope="row">${s.storyId }</th>
			<td>${s.storyName }</td>
			<td><img
				src="${pageContext.servletContext.contextPath}/${s.image}"
				style="width: 75px !important; height: auto;" /></td>
			<td>${s.authorName }</td>
			<td>${s.category.categoryName }</td>
			<td class="text-right"><a
				href="${pageContext.servletContext.contextPath}/quan-tri/danh-sach-truyen/chi-tiet?id=${s.storyId}"
				class="btn btn-info rounded-0 mb-0"
				title="Xem chi tiết truyện ${s.storyName}"> Xem </a> <a
				href="${pageContext.servletContext.contextPath}/quan-tri/danh-sach-truyen/chinh-sua?id=${s.storyId}"
				class="btn btn-primary rounded-0 mb-0"
				title="Chỉnh sửa truyện ${s.storyName }"> Chỉnh sửa </a> <a
				href="${pageContext.servletContext.contextPath}/quan-tri/danh-sach-truyen/xoa?id=${s.storyId}"
				class="btn btn-danger rounded-0 mb-0"
				title="Xóa truyện ${s.storyName}"
				onclick="return confirm('Bạn có chắc sẽ xóa truyện ${s.storyName} chứ?')">
					Xóa </a></td>
		</tr>
	</c:forEach>

</table>
<c:if test="${maxPage > 1 }">
	<nav class="d-flex">
		<ul class="pagination">
			<c:if test="${empty(param.keyword)}">
				<li class="page-item"><a
					class="page-link ${currentPage == 1  ? 'disabled' : '' }"
					href="?page=${currentPage - 1 }" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>

				</a></li>
			</c:if>
			<c:if test="${!empty(param.keyword)}">
				<li class="page-item"><a
					class="page-link ${currentPage == 1  ? 'disabled' : '' }"
					href="?keyword=${param.keyword }&page=${currentPage - 1 }"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span>

				</a></li>
			</c:if>
			<c:forEach var="i" begin="1" end="${maxPage }">
				<c:if test="${!empty(param.keyword)}">
					<li class="page-item"><a class="page-link"
						href="?keyword=${param.keyword }&page=${i }">${i }</a></li>
				</c:if>
				<c:if test="${empty(param.keyword)}">
					<li class="page-item"><a class="page-link" href="?page=${i }">${i }</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${empty(param.keyword)}">
				<li class="page-item"><a
					class="page-link ${currentPage == maxPage  ? 'disabled' : '' }"
					href="?page=${currentPage + 1 }" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
				</a></li>
			</c:if>
			<c:if test="${!empty(param.keyword)}">
				<li class="page-item"><a
					class="page-link ${currentPage == maxPage  ? 'disabled' : '' }"
					href="?keyword=${param.keyword }&page=${currentPage + 1 }"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
						class="sr-only">Next</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
</c:if>

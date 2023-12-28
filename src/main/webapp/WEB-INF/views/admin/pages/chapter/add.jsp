<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<a
	href="${pageContext.servletContext.contextPath}/quan-tri/danh-sach-truyen/chi-tiet?id=${chapter.storyId}">&#8592;
	Quay lại truyện</a>
<h1 class="text-uppercase py-3">thêm mới truyện</h1>
<small class="text-danger">${error }</small>
<f:form action="${pageContext.servletContext.contextPath}/quan-tri/danh-sach-truyen/chi-tiet/them-moi-chuong" method="post" modelAttribute="chapter">
	<div class="form-group">
		<label>Mã chương truyện:</label>
		<f:input path="chapterId"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3"
			placeholder="Nhập mã chương truyện..." />
	</div>
	<div class="form-group">
		<label>Chương truyện:</label>
		<f:input path="chapterNo"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3"
			placeholder="Nhập chương truyện..." />
	</div>
	<div class="form-group">
		<label>Tiêu đề:</label>
		<f:input path="title"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3"
			placeholder="Nhập tiêu đề..." />
	</div>
	<div class="form-group">
		<label>Nội dung:</label>
		<f:textarea path="content"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3" />
	</div>
	<div class="form-group">
		<label>Mã truyện:</label>
		<f:input path="storyId"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3"
			readonly="true" />
	</div>
	<button type="submit" class="btn btn-success rounded-0">Lưu
		lại</button>
</f:form>
<script
	src="${pageContext.servletContext.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace('content')
</script>
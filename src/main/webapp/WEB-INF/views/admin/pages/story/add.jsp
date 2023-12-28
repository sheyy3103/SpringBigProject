<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<a
	href="${pageContext.servletContext.contextPath}/quan-tri/danh-sach-truyen">&#8592;
	Quay lại danh sách</a>
<h1 class="text-uppercase py-3">thêm mới truyện</h1>
<small class="text-danger">${error }</small>
<f:form action="" method="post" modelAttribute="story"
	enctype="multipart/form-data">
	<div class="form-group">
		<label>Mã truyện:</label>
		<f:input path="storyId"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3"
			placeholder="Nhập mã truyện..." />
	</div>
	<div class="form-group">
		<label>Tên truyện:</label>
		<f:input path="storyName"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3"
			placeholder="Nhập tên truyện..." />
	</div>
	<div class="form-group">
		<label>Ảnh:</label> <input type="file" name="files" accept="image/*"
			id="imgInp"
			class="form-control rounded-0 border bg-white mb-3 px-2 custom-file-input" />
		<img id="blah" src="#" class="d-none"
			style="width: 125px !important; height: auto !important;" />
		<script type="text/javascript">
			imgInp.onchange = evt => {
				  const [file] = imgInp.files
				  if (file) {
				    blah.src = URL.createObjectURL(file)
				    var element = document.getElementById("blah");
				    element.classList.remove("d-none");
				  }
				}</script>
	</div>
	<div class="form-group">
		<label>Tên tác giả:</label>
		<f:input path="authorName"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3"
			placeholder="Nhập tên tác giả..." />
	</div>
	<div class="form-group">
		<label>Mô tả:</label>
		<f:textarea path="description"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3"
			placeholder="Viết gì đó..." rows="3" />
	</div>
	<div class="form-group">
		<label>Tình trạng:</label>
		<f:select path="status"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3">
			<f:option value="1">Đang tiến hành</f:option>
			<f:option value="0">Đã hoàn thành</f:option>
		</f:select>
	</div>
	<div class="form-group">
		<label>Danh mục truyện:</label>
		<f:select path="categoryId" items="${categories}"
			itemLabel="categoryName" itemValue="categoryId"
			cssClass="form-control rounded-0 border bg-white mb-3 px-3">
		</f:select>
	</div>
	<button type="submit" class="btn btn-success rounded-0">Lưu
		lại</button>
</f:form>

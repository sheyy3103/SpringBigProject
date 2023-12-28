<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="card rounded-0 bg-light">
	<div class="card-header py-1 bg-light">
		<a
			href="${pageContext.servletContext.contextPath}/quan-tri/danh-sach-truyen">&#8592;
			Quay lại danh sách</a>
	</div>
	<div class="card-body pt-1">
		<h3 class="card-title">${story.storyName }</h3>
		<div class="row mt-2">
			<div class="col-lg-5 col-md-5 col-sm-6">
				<img src="${pageContext.servletContext.contextPath}/${story.image }"
					class="img-fluid" style="height: 500px !important; width: auto;">
			</div>
			<div class="col-lg-7 col-md-7 col-sm-6">
				<h3 class="box-title">Điểm nổi bật</h3>
				<ul class="list-unstyled">
					<li><i class="fa fa-check text-success"></i> Danh mục :
						${story.category.categoryName }</li>
					<li><i class="fa fa-check text-success"></i> Tác giả:
						${story.authorName }</li>
					<li><i class="fa fa-check text-success"></i> Tình trạng:
						${story.status == 1 ? "Đang tiến hành" : "Đã hoàn thành" }</li>
				</ul>
				<h4 class="box-title">Mô tả:</h4>
				<p>${story.description }</p>

			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 pt-3">
				<div class="d-flex align-items-center">
					<h3 class="box-title">Danh sách chương!&nbsp;&nbsp;&nbsp;</h3>
					<a class="btn btn-success rounded-0"
						href="${pageContext.servletContext.contextPath}/quan-tri/danh-sach-truyen/chi-tiet/them-moi-chuong?storyId=${story.storyId}">Thêm
						mới</a>
				</div>
				<div class="table-responsive">
					<table class="table table-striped table-product">
						<tbody class="list">
							<c:forEach items="${chapters }" var="chap">
								<tr class="d-flex justify-content-between">
									<td class="d-flex justify-content-between w-100"><div>Chương
											${chap.chapterNo }: ${chap.title }</div>
										<div>${chap.dateCreated }</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

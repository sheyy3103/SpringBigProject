<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main>
	<div class="section-stories-hot mb-3">
		<div class="container">
			<div class="row">
				<div class="head-title-global d-flex justify-content-between mb-2">
					<div
						class="col-6 col-md-4 col-lg-4 head-title-global__left d-flex align-items-center">
						<h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
							<span
								class="d-block text-decoration-none text-dark fs-4 story-name">
								<c:if test="${empty(param.keyword) }">
									Tất cả truyện
								</c:if>
								<c:if test="${!empty(param.keyword)}">
									Kết quả của "${param.keyword }"
								</c:if>
							</span>
						</h2>
						<i class="fa-solid fa-fire-flame-curved"></i>
					</div>

				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="section-stories-hot__list">
						<c:forEach items="${stories }" var="s">
							<div class="story-item">
								<a
									href="${pageContext.servletContext.contextPath}/chi-tiet-truyen/${s.storyId}"
									class="d-block text-decoration-none">
									<div class="story-item__image">
										<img
											src="${pageContext.servletContext.contextPath}/${s.image}"
											class="img-fluid" width="150" height="230" loading="lazy">
									</div>
									<h3 class="story-item__name text-one-row story-name">${s.storyName }</h3>

									<div class="list-badge">
										<span class="story-item__badge badge text-bg-success">${s.status == 1 ? "Đang tiến hành" : "Đã hoàn thành" }</span>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
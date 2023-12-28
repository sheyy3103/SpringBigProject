<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main>
	<div class="container">
		<div class="row align-items-start">
			<div class="col-9 mb-3">
				<div class="head-title-global d-flex justify-content-between mb-2">
					<div
						class="col-12 col-md-12 col-lg-12 head-title-global__left d-flex">
						<h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
							<span
								class="d-block text-decoration-none text-dark fs-4 category-name">${category.categoryName }</span>
						</h2>
					</div>
				</div>

				<div class="list-story-in-category section-stories-hot__list">
					<c:forEach items="${stories }" var="s">
						<div class="story-item">
							<a href="${pageContext.servletContext.contextPath}/chi-tiet-truyen/${s.storyId}" class="d-block text-decoration-none">
								<div class="story-item__image">
									<img
										src="${pageContext.servletContext.contextPath}/${s.image} "
										class="img-fluid" width="195" height="345" loading="lazy">
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
			<div class="col-3 sticky-md-top">
				<div
					class="category-description bg-light p-2 rounded mb-3 card-custom">
					<p class="mb-0 text-secondary"></p>
					<p>There are many variations of passages of Lorem Ipsum
						available, but the majority have suffered alteration in some form,
						by injected humour, or randomised words which don't look even
						slightly believable. If you are going to use a passage of Lorem
						Ipsum, you need to be sure there isn't anything embarrassing
						hidden in the middle of text. All the Lorem Ipsum generators on
						the Internet tend to repeat predefined chunks as necessary, making
						this the first true generator on the Internet. It uses a
						dictionary of over 200 Latin words, combined with a handful of
						model sentence structures, to generate Lorem Ipsum which looks
						reasonable. The generated Lorem Ipsum is therefore always free
						from repetition, injected humour, or non-characteristic words etc.</p>
					<strong>Sheyy</strong>
				</div>
			</div>
		</div>
	</div>
</main>
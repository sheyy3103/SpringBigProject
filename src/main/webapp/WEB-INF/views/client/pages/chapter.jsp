<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main>
	<div class="chapter-wrapper container my-5">
		<h1 class=" h1 text-center text-success">${story.storyName }</h1>
		<p class="text-center text-dark">Chương ${chapter.chapterNo }:
			${chapter.title }</p>

		<hr class="chapter-start container-fluid">
		<div class="chapter-nav text-center">
			<div
				class="chapter-actions chapter-actions-origin d-flex align-items-center justify-content-center">
				<a
					class="btn btn-success me-1 chapter-prev ${chapter.chapterNo == min ? 'disabled' : '' }"
					href="${pageContext.servletContext.contextPath}/chi-tiet-truyen/${story.storyId}/${previous}">
					<span>Chương </span>trước
				</a> <a
					class="btn btn-success chapter-next ${chapter.chapterNo == max ? 'disabled' : '' }"
					href="${pageContext.servletContext.contextPath}/chi-tiet-truyen/${story.storyId}/${next}"><span>Chương
				</span>tiếp</a>
			</div>
		</div>
		<hr class="chapter-end container-fluid">


		<div class="chapter-content mb-3">
			<p>${chapter.content }</p>
		</div>
	</div>
	<div class="chapter-nav text-center">
		<div
			class="chapter-actions chapter-actions-origin d-flex align-items-center justify-content-center">
			<a
				class="btn btn-success me-1 chapter-prev ${chapter.chapterNo == min ? 'disabled' : '' }"
				href="${pageContext.servletContext.contextPath}/chi-tiet-truyen/${story.storyId}/${previous}">
				<span>Chương </span>trước
			</a> <a
				class="btn btn-success chapter-next ${chapter.chapterNo == max ? 'disabled' : '' }"
				href="${pageContext.servletContext.contextPath}/chi-tiet-truyen/${story.storyId}/${next}"><span>Chương
			</span>tiếp</a>
		</div>
	</div>
</main>
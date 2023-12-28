<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main>

	<input type="hidden" id="story_slug"
		value="nang-khong-muon-lam-hoang-hau">
	<div class="container">
		<div class="row align-items-start">
			<div class="col-12 col-md-7 col-lg-8">
				<div class="head-title-global d-flex justify-content-between mb-4">
					<div
						class="col-12 col-md-12 col-lg-4 head-title-global__left d-flex">
						<h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
							<span
								class="d-block text-decoration-none text-dark fs-4 title-head-name"
								title="Thông tin truyện">Thông tin truyện</span>
						</h2>
					</div>
				</div>

				<div class="story-detail">
					<div class="story-detail__top d-flex align-items-start">
						<div class="row align-items-start">
							<div class="col-12 col-md-12 col-lg-3 story-detail__top--image">
								<div class="book-3d">
									<img
										src="${pageContext.servletContext.contextPath}/${story.image}"
										alt="Nàng Không Muốn Làm Hoàng Hậu" class="img-fluid w-100"
										width="200" height="300" loading="lazy">
								</div>
							</div>
							<div class="col-12 col-md-12 col-lg-9">
								<h3 class="text-center story-name">${story.storyName}</h3>

								<div class="story-detail__top--desc px-3">
									<h5>${story.description }</h5>
								</div>

								<div class="info-more">
									<div class="info-more--more active" id="info_more">
										<span class="me-1 text-dark">Xem thêm</span>
										<svg width="14" height="8" viewBox="0 0 14 8" fill="none"
											xmlns="http://www.w3.org/2000/svg">
                                                <path
												d="M7.70749 7.70718L13.7059 1.71002C14.336 1.08008 13.8899 0.00283241 12.9989 0.00283241L1.002 0.00283241C0.111048 0.00283241 -0.335095 1.08008 0.294974 1.71002L6.29343 7.70718C6.68394 8.09761 7.31699 8.09761 7.70749 7.70718Z"
												fill="#2C2C37"></path>
                                            </svg>
									</div>

									<a class="info-more--collapse text-decoration-none"
										href="${pageContext.servletContext.contextPath}/chi-tiet-truyen/${story.storyId}">
										<span class="me-1 text-dark">Thu gọn</span> <svg width="14"
											height="8" viewBox="0 0 14 8" fill="none"
											xmlns="http://www.w3.org/2000/svg">
                                                <path
												d="M7.70749 0.292817L13.7059 6.28998C14.336 6.91992 13.8899 7.99717 12.9989 7.99717L1.002 7.99717C0.111048 7.99717 -0.335095 6.91992 0.294974 6.28998L6.29343 0.292817C6.68394 -0.097606 7.31699 -0.0976055 7.70749 0.292817Z"
												fill="#2C2C37"></path>
                                            </svg>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="story-detail__bottom my-3">
						<div class="row">
							<div class="col-12 col-md-12 col-lg-3 story-detail__bottom--info">
								<p class="mb-1">
									<strong>Tác giả:</strong> <a href="#"
										class="text-decoration-none text-dark hover-title">${story.authorName }</a>
								</p>
								<div class="d-flex align-items-center mb-1 flex-wrap">
									<strong class="me-1">Thể loại:</strong>
									<div class="d-flex align-items-center flex-warp">
										<a
											href="${pageContext.servletContext.contextPath}/the-loai/${story.category.categoryId}"
											class="text-decoration-none text-dark hover-title  me-1 "
											style="width: max-content;">${story.category.categoryName }</a>
									</div>
								</div>

								<p class="mb-1">
									<strong>Trạng thái:</strong> <span class="text-info">${story.status == 1 ? "Đang tiến hành" : "Đã hoàn thành" }</span>
								</p>
							</div>

						</div>
					</div>

					<div class="story-detail__list-chapter">
						<div class="head-title-global d-flex justify-content-between mb-4">
							<div
								class="col-6 col-md-12 col-lg-4 head-title-global__left d-flex">
								<h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
									<span href="#"
										class="d-block text-decoration-none text-dark fs-4 title-head-name"
										title="Truyện hot">Danh sách chương</span>
								</h2>
							</div>
						</div>

						<div class="story-detail__list-chapter--list">
							<div class="row">
								<div class="col-12 story-detail__list-chapter--list__item">
									<ul>
										<c:forEach items="${chapters }" var="chap">
											<li><a
												href="${pageContext.servletContext.contextPath}/chi-tiet-truyen/${story.storyId}/${chap.chapterNo}"
												class="text-decoration-none text-dark hover-title d-flex justify-content-between"><span>Chương
														${chap.chapterNo }: ${chap.title }</span><span>${chap.dateCreated }</span></a>
											</li>
										</c:forEach>

									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12 col-md-5 col-lg-4 sticky-md-top">
				<div class="section-list-category bg-light p-2 rounded card-custom">
					<div class="head-title-global mb-2">
						<div class="col-12 col-md-12 head-title-global__left">
							<h2 class="mb-0 border-bottom border-secondary pb-1">
								<span href="#"
									class="d-block text-decoration-none text-dark fs-4"
									title="Truyện đang đọc">Thể loại truyện</span>
							</h2>
						</div>
					</div>
					<div class="row">
						<!-- Horizontal under breakpoint -->
						<ul class="list-category">
							<c:forEach items="${categories }" var="c">
								<li class=""><a
									href="https://suustore.com/the-loai/ngon-tinh"
									class="text-decoration-none text-dark hover-title">${c.categoryName }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>



	</div>
</main>
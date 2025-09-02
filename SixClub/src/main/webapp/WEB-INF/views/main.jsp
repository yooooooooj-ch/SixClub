<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SixClub</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<style>
/* 기본 초기화 */
* {
	box-sizing: border-box;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
	font-family: 'Helvetica Neue', sans-serif;
	background: #f0f8ff;
	color: #003366;
}

/* Swiper 스타일 */
.swiper {
	width: 100%;
	aspect-ratio: 16/9;
	max-height: 90vh;
	box-shadow: 0 8px 30px rgba(0, 102, 204, 0.2);
	border-radius: 12px;
	overflow: hidden;
}

.swiper-slide img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	filter: brightness(1.05) saturate(1.1);
	transition: transform 0.3s ease;
}

.swiper-slide img:hover {
	transform: scale(1.03);
}

/* 제품 소개 섹션 */
.product-feature {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 80px 300px;
	background: linear-gradient(to right, #ffffff 60%, #e0f0ff 100%);
	color: #003366;
	gap: 0px; /* 기존 40px → 0으로 줄여 이미지와 텍스트를 더 가깝게 */
	flex-wrap: nowrap; /* 줄바꿈 방지 */
}

.feature-text, .feature-image {
	flex: 1;
}

.feature-text {
	padding-right: 30px; /* 텍스트 쪽에만 약간의 간격 부여 */
}

.feature-text h1 {
	font-size: 3rem; /* 제목 크기 크게 */
	line-height: 1.3;
	margin-bottom: 20px;
}

.feature-text p {
	font-size: 1.25rem; /* 본문 글씨 크게 */
	line-height: 1.8;
}

.feature-image img {
	width: 100%;
	max-width: none; /* 이미지가 꽉 차게 */
	border-radius: 20px;
	box-shadow: 0 8px 20px rgba(0, 102, 204, 0.2);
}
.content1 {
	 position: relative;
  padding-top: 150px;
  background-color: white;
  z-index: 2;
  overflow: hidden;
}

/* 카드 영역 */
.content2 {
	background-color: #f2faff;
	padding: 80px 10%;
}

.feature-cards {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 40px;
}

.feature-card {
	background-color: white;
	border-radius: 20px;
	box-shadow: 0 12px 30px rgba(0, 102, 204, 0.15);
	text-align: center;
	padding: 30px 20px;
	width: 400px; /*  고정 가로 크기 */
	height: 500px;
	/* ========================================================== */
	display: flex;
	flex-direction: column; /* 세로 방향 쌓기 */
	align-items: center; /* 가로 방향 중앙 정렬 */
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.feature-card:hover {
	transform: translateY(-8px);
	box-shadow: 0 16px 40px rgba(0, 102, 204, 0.2);
}

.feature-card img {
	width: 100%;
	height: 300px;
	object-fit: contain;
	margin-bottom: 20px;
	border-radius: 12px;
}

/* 텍스트 감싸는 div */
.text-wrapper {
	flex: 1; /* 남는 공간 모두 차지 */
	display: flex;
	justify-content: center; /* 세로 중앙 */
	align-items: center; /* 가로 중앙 */
	text-align: center;
}

.feature-card p {
	font-size: 1em;
	color: #333;
	line-height: 1.5;
	margin: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	overflow: hidden;

	/* =================================================== */
}

/* 팝업 오버레이 */
#popup-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(135, 206, 250, 0.5);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 9999;
}

/* 팝업 박스 */
.popup {
	background: #ffffff; /* 흰색 배경 */
	color: #005bac; /* 포카리 블루 텍스트 */
	padding: 40px 30px;
	border-radius: 16px;
	width: 320px;
	height: 500px;
	text-align: center;
	font-size: 14px;
	line-height: 1.6;
	box-shadow: 0 8px 20px rgba(0, 102, 204, 0.2); /* 부드러운 파란 그림자 */
	border: 2px solid #cdeaff; /* 연한 파란 테두리 */
	font-family: 'Helvetica Neue', sans-serif;
}

.popup img {
	width: 100%;
	max-height: 250px;
	object-fit: contain;
	border-radius: 8px;
	margin-bottom: 20px;
}

.popup h2 {
	font-size: 20px;
	margin-bottom: 20px;
	font-weight: bold;
	color: #007acc; /* 좀 더 선명한 블루 */
	letter-spacing: 1px;
}

.popup-buttons {
	margin-top: 30px;
	display: flex;
	justify-content: space-between;
}

.popup-buttons button {
	background: #e0f4ff; /* 아주 연한 파란 버튼 */
	color: #005bac;
	border: 1px solid #aad4f5;
	padding: 10px;
	cursor: pointer;
	border-radius: 6px;
	width: 48%;
	font-weight: bold;
	font-size: 12px;
	transition: all 0.2s ease;
}

.popup-buttons button:hover {
	background: #d0eaff;
}

.main-logo-image {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	max-width: 1000px;
	width: 80vw;
	opacity: 0.8;
	transition: all 0.6s ease;
	z-index: 1;
}

/* 스크롤 시 축소될 스타일 */
.main-logo-image.shrink {
position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  max-width: 1000px;
  width: 80vw;
  opacity: 0.8;
  transition: all 0.6s ease;
  z-index: 1;
}
.main-logo-image.shrink {
  transform: translateX(-50%) scale(0.3);
  top: 30px; /* 줄어들면서 올라감 */
  position: fixed;
  z-index: 10;
}
.floating-number {
  position: sticky;
  top: 0;
  z-index: 3; /* 낮게 설정 */
    height: 200px;
  transition: transform 0.3s ease, opacity 0.3s ease;
}
.floating-number.shrink {
  transform: scale(0.5);
  opacity: 0.5;
}

.feature-text {
  position: relative;
  z-index: 3; /* 텍스트를 가장 위로 */
}

.main-logo-image.stopped {
  position: absolute !important;
  top: unset !important; /* 고정 해제 */
  left: 50%;
  transform: translateX(-50%) scale(0.6);
}


@media ( max-width : 768px) {
	.feature-text h1 {
		font-size: 2rem;
	}
	.feature-text p {
		font-size: 1rem;
	}
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />



	<!-- 컨텐츠 -->
	<div class="content">

		<!-- 외부 Vertical Swiper -->
		<div class="swiper verticalSwiper">
			<div class="swiper-wrapper">

				<!-- 첫 번째 슬라이드 (gym1 <-> gym3 자동 전환) -->
				<div class="swiper-slide">
					<div class="swiper innerSwiper1">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="${pageContext.request.contextPath}/resources/img/gym1.jpg" />
							</div>
							<div class="swiper-slide">
								<img src="${pageContext.request.contextPath}/resources/img/gym3.jpg" />
							</div>
						</div>
					</div>
				</div>

				<!-- 두 번째 슬라이드 (gym2 <-> gym4 자동 전환) -->
				<div class="swiper-slide">
					<div class="swiper innerSwiper2">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="${pageContext.request.contextPath}/resources/img/gym2.jpg" />
							</div>
							<div class="swiper-slide">
								<img src="${pageContext.request.contextPath}/resources/img/gym4.jpg" />
							</div>
						</div>
					</div>
				</div>

			</div>




		</div>

		<div class="content1">
		
		
			<div class="product-feature">
			
			<div class="floating-number">
			<!-- 큰 메인 로고 이미지 -->
			<img class="main-logo-image" src="${pageContext.request.contextPath}/resources/img/6.png" />
			</div>
			
			
				<div class="feature-text">
					<h1>
						당신만의<br>맞춤형 루틴을 만드세요.
					</h1>
					<p>
						무작정 운동하기엔 시간도 아깝고 효과도 미지수.<br> SixClub은 개인의 체형, 목표, 라이프스타일에 맞춘<br> 🔥과학적인 운동 루틴🔥을 제공합니다.<br> 지금 나에게 딱 맞는 루틴, 시작해볼까요?
					</p>

				</div>
				<div class="feature-image">
					<img src="${pageContext.request.contextPath}/resources/img/rou.png" />

				</div>
			</div>

			<div class="content2">
				<div class="feature-cards">
					<!-- 카드 1 -->
					<div class="feature-card">
						<img src="${pageContext.request.contextPath}/resources/img/level.png" alt="robot hands">
						<div class="text-wrapper">
							<p>
								헬스 초보도 걱정 마세요!<br> 목표와 경험 수준만 입력하면<br> 💡저희가 직접 짠 루틴💡을 자동으로 설계해드립니다.
							</p>
						</div>
					</div>
					<!-- 카드 2 -->
					<div class="feature-card">
						<img src="${pageContext.request.contextPath}/resources/img/day_six.png" alt="robot back">
						<div class="text-wrapper">
							<p>
								꾸준함이 힘이라지만, 쉽지 않죠?<br> 루틴을 ⏰하루 루틴, 6일 루틴⏰으로<br> 운동 습관을 자연스럽게 만들 수 있어요.
							</p>
						</div>

					</div>
					<!-- 카드 3 -->
					<div class="feature-card">
						<img src="${pageContext.request.contextPath}/resources/img/inwe.png" alt="robot brain">
						<div class="text-wrapper">
							<p>
								“뭘 어떻게 해야 할지 모르겠어요🤔”<br> 그럴 때 필요한 게 바로 SixClub의 루틴 설계입니다
							</p>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Initialize Swiper -->
		<!-- Swiper Initialization -->
		<script>
			// 세로 스와이프를 위한 외부 Swiper
			const verticalSwiper = new Swiper(".verticalSwiper", {
				direction : "vertical",
				slidesPerView : 1,
				mousewheel : true,
				pagination : {
					el : ".swiper-pagination",
					clickable : true
				}
			});

			// 내부 Swiper 1 (gym1 <-> gym3)
			const innerSwiper1 = new Swiper(".innerSwiper1", {
				loop : true,
				autoplay : {
					delay : 3000,
					disableOnInteraction : false
				}
			});

			// 내부 Swiper 2 (gym2 <-> gym4)
			const innerSwiper2 = new Swiper(".innerSwiper2", {
				loop : true,
				autoplay : {
					delay : 3000,
					disableOnInteraction : false
				}
			});
		</script>

	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<c:if test="${user.subscribe }">

		<!-- 팝업 오버레이 -->
		<div id="popup-overlay" style="display: none;">
			<div class="popup">
				<c:choose>
					<c:when test="${sub.monthBetween==1}">
						<img src="${pageContext.request.contextPath}/resources/img/bluelogo1.png" alt="1개월구독" />
					</c:when>
					<c:when test="${sub.monthBetween==3}">
						<img src="${pageContext.request.contextPath}/resources/img/silverlogo1.png" alt="3개월구독" />
					</c:when>
					<c:when test="${sub.monthBetween==6}">
						<img src="${pageContext.request.contextPath}/resources/img/goldlogo1.png" alt="6개월구독" />
					</c:when>
					<c:otherwise>
								0
					</c:otherwise>
				</c:choose>
				<h2>SIX CLUB</h2>
				<p>${user.user_name } 님 환영합니다!!</p>
				<div class="popup-buttons">
					<button onclick="closePopup(true)">오늘 하루 열지 않기</button>
					<button onclick="closePopup()">닫기</button>
				</div>
			</div>
		</div>

	</c:if>
	<script>
	  const popupKey = "hidePopupToday";
	
	  window.addEventListener("load", () => {
	    const expire = localStorage.getItem(popupKey);
	    const now = new Date().getTime();
	
	    if (!expire || now > parseInt(expire)) {
	      document.getElementById("popup-overlay").style.display = "flex";
	    }
	  });
	
	  function closePopup(hideToday = false) {
	    document.getElementById("popup-overlay").style.display = "none";
	    if (hideToday) {
	      // 자정까지 유지
	      const now = new Date();
	      const tomorrow = new Date();
	      tomorrow.setDate(now.getDate() + 1);
	      tomorrow.setHours(0, 0, 0, 0);
	      localStorage.setItem(popupKey, tomorrow.getTime().toString());
	    }
	  }
	</script>

	<script>
	window.addEventListener('scroll', function () {
		  const float = document.querySelector('.floating-number');
		  const content1 = document.querySelector('.content1');
		  const contentTop = content1.offsetTop;
		  const contentBottom = contentTop + content1.offsetHeight;
		  const scrollTop = window.scrollY;
		  const floatHeight = float.offsetHeight;

		  // shrink 범위를 content1 내부로 제한
		  if (scrollTop > contentTop && (scrollTop + floatHeight) < contentBottom) {
		    float.classList.add('shrink');
		  } else {
		    float.classList.remove('shrink');
		  }
		});


	</script>

</body>
</html>
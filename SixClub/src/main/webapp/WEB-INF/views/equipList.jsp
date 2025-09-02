<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Urbanist', sans-serif;
	background-color: #f0f8ff; /* 포카리 연블루 */
	color: #1a1a1a;
}

/* 헤더 배너 */
header {
	position: relative;
	height: 200px;
	background-image: url('/images/banner.jpg');
	background-size: cover;
	background-position: center;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	margin-top:40px;

}


/* 섹션 제목 */
.section-title {
	font-size: 4rem;
	font-weight: bold;
	text-align: center;
	color: #007bff;
	margin: 30px 0 30px;
	margin-top:-50px;
	
	text-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
	letter-spacing: 1px;
}

.page-description {
	font-size: 1.2rem;
	color: #005577;
	margin-bottom: 50px;
	margin-top:-50px;
	text-aling: center;
	align-items: center;
	display: flex;
	justify-content: center;
}

/* 상품 그리드 */
.product-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
	gap: 60px;
	padding: 0 100px 100px;
	max-width: 1600px;
	margin: 0 auto;
}

.product-card {
	background-color: #ffffff;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 123, 255, 0.08);
	padding: 40px 20px;
	text-align: center;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	border: 1px solid #d6eaff;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	height: 100%; /* 카드 높이 균일화 */
}

.product-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 20px 40px rgba(0, 123, 255, 0.15);
}

.product-card img {
	width: 180px;
	height: 180px; /* 고정 높이 추가 */
	object-fit: contain; /* 이미지가 깨지지 않게 비율 유지 */
	margin: 0 auto 25px;
	filter: drop-shadow(0 4px 8px rgba(0, 123, 255, 0.1));
}

.product-name {
	font-size: 1.3rem;
	font-weight: 600;
	text-transform: uppercase;
	margin-bottom: 10px;
	color: #0056b3;
}

.product-desc {
	font-size: 0.95rem;
	color: #444;
	margin-bottom: 15px;
	line-height: 1.5;
}

/* 전체 팝업 배경 */
#popup-layer {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100vw;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9999;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px; /* 작은 화면에서 여백 유지 */
}
/* 팝업 박스 디자인 */
.popup-content {
	background: linear-gradient(135deg, #e0f0ff, #ffffff);
	padding: 40px 30px;
	border-radius: 16px;
	width: 700px;
	max-width: 90%;
	box-shadow: 0 12px 30px rgba(0, 123, 255, 0.25);
	text-align: center;
	font-family: 'Urbanist', sans-serif;
	position: relative;
	transition: transform 0.3s ease;
}
/* 팝업 제목 */
#popup-title {
	font-size: 1.8rem;
	color: #007bff;
	margin-bottom: 20px;
	font-weight: 700;
	text-shadow: 0 1px 2px rgba(0,0,0,0.1);
}


#popup-brand-list li {
	font-size: 1.1rem;
	color: #0056b3;
	margin: 8px 0;
	padding-left: 10px;
	position: relative;
	list-style: none;
}

#popup-brand-list li::before {

	color: #007bff;
	position: absolute;
	left: 0;
	top: 50%;
	transform: translateY(-50%);
	font-weight: bold;
}

/* 닫기 버튼 */
.close-btn {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 12px 26px;
	border-radius: 50px;
	cursor: pointer;
	font-size: 1rem;
	font-weight: 600;
	transition: background-color 0.25s ease;
	box-shadow: 0 5px 12px rgba(0,123,255,0.3);
}

.close-btn:hover {
	background-color: #0056b3;
	box-shadow: 0 6px 18px rgba(0,86,179,0.5);
}

/* 스크롤바 예쁘게 (웹킷 기반) */
#popup-brand-list::-webkit-scrollbar {
	width: 6px;
}

#popup-brand-list::-webkit-scrollbar-thumb {
	background-color: rgba(0,123,255,0.4);
	border-radius: 3px;
}

#popup-brand-list::-webkit-scrollbar-track {
	background: transparent;
}
</style>
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />


	<header>
		<!-- 섹션 제목 -->
		<div class="section-title">PRODUCTS</div>
	</header>
	
	<p class="page-description">운동할 때 사용하기 좋은 장비들과 구매하기 좋은 브랜드들을 추천해드립니다 💡</p>
	<!-- 상품 그리드 -->
	<div class="product-grid">


		<!-- JSTL 데이터 출력 -->
		<c:forEach var="imsi" items="${alist}">
			<div class="product-card" id="product-card">
				<img src="/sixclub${imsi.equip_img}" alt="${imsi.equip_name}" width="${item.m_width}" height="${item.m_height}">
				<div class="product-name">${imsi.equip_name}</div>
				<div class="product-desc">${imsi.equip_desc}</div>
				<ul class="product-brand-list" style="display: none;">
					<c:forEach var="brand" items="${imsi.equip_brand_list}">
						<li>${brand}</li>
					</c:forEach>
				</ul>
			</div>
		</c:forEach>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />



	<!-- 팝업 레이어 -->

	<div id="popup-layer" style="display: none;">
		<div class="popup-content">
			<h3 id="popup-title">장비 이름</h3>
			<ul id="popup-brand-list"></ul>
			<button class="close-btn" id="popup-close">닫기</button>
		</div>
	</div>





	<script>
		$(function() {
			$('.product-card').on('click', function() {
				const title = $(this).find('.product-name').text();
				const brandListItems = $(this).find('.product-brand-list li');

				$('#popup-title').text(title);

				const $popupList = $('#popup-brand-list');
				$popupList.empty(); // 기존 내용 제거

				brandListItems.each(function() {
				    $popupList.append('<li>' + $(this).text() + '</li>');
				});


				$('#popup-layer').fadeIn();
			});

			$('#popup-close').on('click', function() {
				$('#popup-layer').fadeOut();
			});

			$('#popup-layer').on('click', function(e) {
				if (e.target.id === 'popup-layer') {
					$('#popup-layer').fadeOut();
				}
			});
		});
	</script>
</body>
</html>

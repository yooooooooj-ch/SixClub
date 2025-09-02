<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mapstyle.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f8ff;
	color: #003366;
	margin: 0;
	padding: 0;
}

.content-container {
	text-align: center;
	padding: 60px 20px;
	background: linear-gradient(to bottom, #ffffff 0%, #e6f7ff 100%);
	border-top: 5px solid #00aaff;
}

.page-title {
	font-size: 2.5rem;
	font-weight: bold;
	color: #007acc;
	margin-bottom: 10px;
}

.page-description {
	font-size: 1.2rem;
	color: #005577;
	margin-bottom: 30px;
}

.map-box {
	width: 100%;
	max-width: 1000px;
	height: 700px;
	margin: 0 auto;
	border-radius: 15px;
	box-shadow: 0 8px 20px rgba(0, 136, 204, 0.3);
	overflow: hidden;
	transition: transform 0.3s;
}

.map-box:hover {
	transform: scale(1.01);
	box-shadow: 0 12px 28px rgba(0, 136, 204, 0.4);
}

@media ( max-width : 768px) {
	.page-title {
		font-size: 2rem;
	}
	.page-description {
		font-size: 1rem;
	}
	.map-box {
		height: 500px;
	}
}

.visit-tips-section {
	max-width: 1000px;
	margin: 50px auto;
	padding: 40px;
	background-color: #ffffff;
	border-radius: 15px;
	box-shadow: 0 6px 18px rgba(0, 136, 204, 0.12);
}

.tips-title {
	font-size: 1.7rem;
	color: #007acc;
	margin-bottom: 20px;
	text-align: center;
}

.tips-list {
	list-style: none;
	padding-left: 0;
	font-size: 1rem;
	line-height: 1.8;
	color: #003366;
}

/* 공통 섹션 스타일 */
.visit-tips-section, .features-section, .faq-section, .cta-buttons {
	max-width: 1000px;
	margin: 40px auto;
	padding: 30px;
	background: #ffffff;
	border-radius: 15px;
	box-shadow: 0 6px 18px rgba(0, 136, 204, 0.12);
}

/* 제목 스타일 */
.tips-title, .features-title, .faq-title {
	font-size: 1.6rem;
	color: #007acc;
	margin-bottom: 20px;
	text-align: center;
}

/* 팁 리스트 */
.tips-list {
	list-style: none;
	padding-left: 0;
	font-size: 1rem;
	line-height: 1.8;
	color: #003366;
}

/* 특징 섹션 */
.features-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr); /* 고정 3칸 */
	gap: 20px;
}

.feature-item {
	background: #f0faff;
	border-radius: 12px;
	padding: 20px;
	color: #005577;
	text-align: center;
	font-weight: 500;
	min-height: 80px; /* 높이 통일 */
	display: flex;
	align-items: center;
	justify-content: center;
}

/* FAQ */
.faq-item {
	margin-bottom: 20px;
	font-size: 1rem;
	line-height: 1.6;
	color: #003366;
}

/* CTA 버튼 */
.cta-buttons {
	text-align: center;
	margin-top: 40px;
}

.cta-buttons button {
	background-color: #00aaff;
	color: #fff;
	padding: 14px 28px;
	margin: 10px;
	border: none;
	border-radius: 30px;
	font-size: 1rem;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.cta-buttons button:hover {
	background-color: #007acc;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 컨텐츠 -->
	<div class="content">
		<div class="content-container">
			<h1 class="page-title">직접 찾아드리겠습니다.</h1>
			<p class="page-description">Six Club과 함께하는 특별한 장소들. 시원한 여정 속으로 지금 떠나보세요!</p>

			<div id="map" class="map-box"></div>

			<div class="visit-tips-section">
				<h2 class="tips-title">🏋️ 헬스장 방문 전 꼭 알아두세요!</h2>
				<ul class="tips-list">
					<li>✅ 운동 전 충분한 스트레칭으로 부상을 예방하세요.</li>
					<li>🕒 추천 시간대: 오전 9시 ~ 11시 (쾌적한 이용 가능)</li>
					<li>👟 실내 운동화 착용 필수입니다.</li>
					<li>🧴 개인 수건과 물은 반드시 지참해 주세요.</li>
					<li>📱 시설 내 와이파이 무료 제공</li>
				</ul>
			</div>

			<div class="features-section">
				<h2 class="features-title">✨ Six Club의 특별한 점</h2>
				<h5 class="features-title">헬스장의 시설들을 다 알려드립니다</h5>
				<div class="features-grid">
					<div class="feature-item">💡 스마트 운동 기기 완비</div>
					<div class="feature-item">🧘 요가/필라테스 클래스 운영</div>
					<div class="feature-item">🧼 철저한 위생 관리</div>
					<div class="feature-item">🚿 무료 샤워실 및 라커룸</div>
					<div class="feature-item">🎧 음악 테마존 제공</div>
					<div class="feature-item">🤝 1:1 트레이닝 가능</div>
				</div>
			</div>

			<div class="faq-section">
				<h2 class="faq-title">❓ 자주 묻는 질문</h2>
				<div class="faq-item">
					<strong>Q. 주차 가능한가요?</strong><br> A. 네, 추천드린 헬스장 다 지하 1층에 무료 주차장이 마련되어 있습니다.
				</div>
				<div class="faq-item">
					<strong>Q. 헬스장 이용 시간은 어떻게 되나요?</strong><br> A. 평일 오전 6시 ~ 오후 10시, 주말은 오전 8시 ~ 오후 8시입니다.
				</div>
				<div class="faq-item">
					<strong>Q. 등록은 어떻게 하나요?</strong><br> A. 모바일 또는 현장 방문을 통해 언제든지 등록 가능한 곳들입니다.
				</div>
			</div>
			<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32d3468bd3f87843b6e29147d4876fe3&libraries=services"></script>

			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 4
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindow = new kakao.maps.InfoWindow({
					zIndex : 1
				});

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				console.log('${address}');

				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('${address}', function(result, status) {

					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {
						var lat = parseFloat(result[0].y);
						var lng = parseFloat(result[0].x);
						var coords = new kakao.maps.LatLng(lat, lng);

						var bounds = new kakao.maps.LatLngBounds();
						bounds.extend(coords);

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
						map.setCenter(coords);

						// 홈마커 생성
						var imageSrc = '${pageContext.request.contextPath}/resources/img/markerhome.png';
						var imageSize = new kakao.maps.Size(32, 32);
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
						var marker = new kakao.maps.Marker({
							map : map, // 마커를 표시할 지도
							position : coords, // 마커를 표시할 위치
							title : '집', // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
							image : markerImage
						// 마커 이미지 
						});
					}
				});

				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places();

				// 키워드로 장소를 검색합니다
				ps.keywordSearch('${address} 헬스장', placesSearchCB);

				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						// LatLngBounds 객체에 좌표를 추가합니다
						var bounds = new kakao.maps.LatLngBounds();

						for (var i = 0; i < 6; i++) {
							displayMarker(data[i]);
							bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
						}
					}
				}

				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {
					var imageSrc = '${pageContext.request.contextPath}/resources/img/markerimg.png';
					// 마커 이미지의 이미지 크기 입니다

					var imageSize = new kakao.maps.Size(44, 36);

					// 마커 이미지를 생성합니다    
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

					// 마커를 생성하고 지도에 표시합니다
					var marker = new kakao.maps.Marker({
						map : map,
						position : new kakao.maps.LatLng(place.y, place.x),
						image : markerImage
					});

					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function() {
						// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
						infowindow
								.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
						infowindow.open(map, marker);
					});
				}
			</script>

		</div>
		<!-- 푸터 -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
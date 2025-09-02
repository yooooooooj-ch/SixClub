<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 인터벌 운동 난이도 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f8ff;
	color: #003366;
}

.wrapper {
	text-align: center;
	padding-top: 80px;
}

.header-banner {
	background: linear-gradient(90deg, #007acc, #00cfff);
	color: white;
	padding: 20px 0;
	text-align: center;
	font-size: 1.4rem;
	font-weight: bold;
	box-shadow: 0 2px 10px rgba(0, 123, 255, 0.2);
	animation: slideIn 1s ease-out;
}

.header-banner span {
	display: inline-block;
	background: linear-gradient(270deg, #dcdcdc, #f0f0f0, #c0c0c0, #f5f5f5, #e0e0e0);
	background-size: 400% 400%;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	animation: silverShine 6s ease infinite;
}

@keyframes silverShine {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}

.title {
	font-weight: bold;
	font-size: 2.8rem;
	line-height: 1.2;
	color: #007acc;
	text-align: center;
	letter-spacing: 5px;
	margin: 0 0 12px 0; /* 아래쪽만 12px 마진으로 살짝 공간 남김 */
	font-family: 'Noto Sans KR', sans-serif;
	position: relative;
	display: inline-block;
}

.subtitle {
	font-size: 1.1rem;
	color: #555;
	margin-bottom: 40px;
}

/* 카드 전체 영역 */
.content {
	max-width: 1100px;
	margin: 0 auto 100px auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 40px;
}

/* 개별 카드 */
.card {
	background-color: #ffffff;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 136, 204, 0.15);
	width: 260px;
	height: 400px;
	padding: 30px 20px;
	text-align: center;
	display: flex;
	flex-direction: column;
	align-items: center;
	transition: transform 0.3s ease;
}

.card:hover {
	transform: translateY(-6px);
	box-shadow: 0 16px 40px rgba(0, 136, 204, 0.25);
}

.card img {
	width: 150px;
	height: auto;
	margin-bottom: 20px;
	border: none;
	background: none;
	border-radius: 0;
	box-shadow: none;
}

.card p {
	margin: 12px 0;
	font-size: 15px;
	color: #444;
	flex-grow: 1; /* 설명 텍스트가 여유 공간을 채우도록 설정 */
}

.card form {
	width: 100%;
	margin-top: auto; /* 버튼을 카드 하단에 고정 */
}

.card button {
	background-color: #00aaff;
	color: #fff;
	border: none;
	padding: 12px 20px;
	border-radius: 30px;
	font-size: 1rem;
	font-weight: bold;
	cursor: pointer;
	transition: background 0.3s ease;
	width: 100%;
}

.card button:hover {
	background: #007acc;
}

@media ( max-width : 768px) {
	.content {
		flex-direction: column;
		align-items: center;
	}
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- 배너 -->
	<div class="header-banner"> 🔥<span> 당신의 도전을 시작하세요! 오늘도 힘차게 Six Club </span>💪</div>
	<!-- 상단 타이틀 -->
	<div class="wrapper">
		<h1 class="title">인터벌 운동 난이도 선택</h1>
		<p class="subtitle">Six Club과 함께 땀나는 인터벌 여정을 시작해보세요! 💦</p>
	</div>

	<!-- 카드 선택 영역 -->
	<div class="content">
		<!-- 초급 -->
		<div class="card">
			<img src="${pageContext.request.contextPath}/resources/img/chog.png" alt="케틀벨">
			<h3>💪 초급</h3>
			<p>
				처음 시작하는 분들을 위한<br>가볍고 쉬운 루틴이에요 😊
			</p>
			<form action="in_level.do" method="get">
				<button type="submit" name="level" value="beginner">선택하기</button>
			</form>
		</div>

		<!-- 중급 -->
		<c:if test="${age < 60}">
			<div class="card">
				<img src="${pageContext.request.contextPath}/resources/img/jongg.png" alt="케틀벨">
				<h3>🔥 중급</h3>
				<p>
					운동 경험이 있는 분께 추천하는<br>균형 잡힌 루틴입니다 🔥
				</p>
				<form action="in_level.do" method="get">
					<button type="submit" name="level" value="intermediate">선택하기</button>
				</form>
			</div>

			<!-- 고급 -->
			<div class="card">
				<img src="${pageContext.request.contextPath}/resources/img/gog.png" alt="케틀벨">
				<h3>🚀 고급</h3>
				<p>
					강도 높은 트레이닝!<br>고강도 훈련으로 최상의 결과를 🚀
				</p>
				<form action="in_level.do" method="get">
					<button type="submit" name="level" value="advanced">선택하기</button>
				</form>
			</div>
		</c:if>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

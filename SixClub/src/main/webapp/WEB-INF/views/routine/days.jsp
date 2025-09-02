<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 루틴선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f8ff;
	color: #003366;
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

.content {
	text-align: center;
	padding: 60px 20px;
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

@
keyframes silverShine { 0% {
	background-position: 0% 50%;
}

50% {
background-position: 100% 50%;
}
100% {
background-position: 0% 50%;
}
}
h2 {
	font-size: 32px;
	color: #007be9;
	margin-bottom: 10px;
}

.subtext {
	font-size: 16px;
	color: #555;
	margin-bottom: 50px;
}

.routine-container {
	display: flex;
	justify-content: center;
	gap: 40px;
	flex-wrap: wrap;
}

.routine-card {
	background-color: #ffffff;
	border-radius: 20px;
	box-shadow: 0 10px 20px rgba(0, 136, 204, 0.2);
	width: 250px;
	height: 420px;
	transition: transform 0.3s, box-shadow 0.3s;
	padding: 30px 20px;
	text-align: center;
	transition: transform 0.3s;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	position: relative;
	overflow: hidden;
}

.routine-card:hover {
	transform: translateY(-5px);
}

.image-center-wrapper {
	position: relative;
	width: 100%;
	height: 120px; /* 이미지 공간 높이 설정 */
}

.image-center-wrapper img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 200px;
	height: 100px;
}

.routine-card img {
	width: 200px;
	height: 100px;
	margin: 0 auto 20px auto; /* 상:0, 좌우:auto, 하:20px */
	display: block; /* 가로 중앙 정렬을 위해 block으로 설정 */
}

.routine-card h3 {
	color: #007be9;
	font-size: 18px;
	margin-bottom: 10px;
}

.routine-card p {
	color: #444;
	font-size: 14px;
	margin-bottom: 20px;
}

.routine-card form input[type="submit"] {
	background-color: #00aaff;
	border: none;
	color: white;
	padding: 10px 24px;
	border-radius: 20px;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.3s;
}

.routine-card form input[type="submit"]:hover {
	background-color: #0077cc;
}
</style>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 배너 -->
	<div class="header-banner">
		🔥<span> 당신의 도전을 시작하세요! 오늘도 힘차게 Six Club</span> 💪
	</div>
	<!-- 컨텐츠 -->
	<div class="content">
		<h2 class="title">운동 루틴을 선택해주세요</h2>
		<p class="subtext">Six Club과 함께 시원한 건강 여정을 시작해보세요 💧</p>

		<div class="routine-container">
			<!-- 하루 루틴 카드 -->
			<div class="routine-card">
				<div class="image-center-wrapper">
					<img src="${pageContext.request.contextPath}/resources/img/1day.png" alt="하루">
				</div>
				<h3>하루 루틴</h3>
				<p>인터벌운동과 근력운동중 선택하여 원하는 난이도로 1일 루틴을 제공합니다</p>
				<form action="oneday.do" method="post">
					<input type="hidden" name="userId" value="${user.user_id}"> <input type="submit" value="선택하기">
				</form>
			</div>

			<!-- 6일 루틴 카드 -->
			<div class="routine-card">
				<div class="image-center-wrapper">
					<img src="${pageContext.request.contextPath}/resources/img/weekk.png" alt="6일">
				</div>
				<h3>6일 루틴</h3>
				<p>인터벌운동 3일, 근력운동 3일을 조합하여 원하는 난이도로 6일 루틴을 제공합니다</p>
				<form action="sixdays.do" method="post">
					<input type="hidden" name="userId" value="${user.user_id}"> <input type="submit" value="선택하기">
				</form>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

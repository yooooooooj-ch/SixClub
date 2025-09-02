<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 운동 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/exerciseSelect.css">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f8ff;
	color: #003366;
}

.exercise-container {
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
keyframes silverShine { 
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
	font-size: 2.8rem;
	color: #007acc;
	font-weight: bold;
	margin-bottom: 10px;
}

.subtitle {
	font-size: 1.2rem;
	color: #005577;
	margin-bottom: 50px;
}

.card-grid {
	display: flex;
	justify-content: center;
	gap: 40px;
	flex-wrap: wrap;
}

.exercise-card {
	background-color: #ffffff;
	border-radius: 20px;
	box-shadow: 0 10px 20px rgba(0, 136, 204, 0.2);
	width: 300px;
	height: 500px;
	transition: transform 0.3s, box-shadow 0.3s;
	overflow: hidden;
	padding: 30px 20px;
	text-align: center;
	position: relative;
}

.exercise-card:hover {
	transform: translateY(-8px);
	box-shadow: 0 20px 35px rgba(0, 136, 204, 0.4);
}

.card-image img {
	width: 200px;
	height: 200px;
	object-fit: cover;
	margin-bottom: 20px;
}

.exercise-card h3 {
	color: #007acc;
	font-size: 1.5rem;
	margin: 10px 0;
}

.exercise-card p {
	color: #333;
	font-size: 0.95rem;
	margin-bottom: 20px;
}

.exercise-card button {
	background-color: #00aaff;
	color: white;
	border: none;
	padding: 12px 24px;
	font-size: 1rem;
	border-radius: 30px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.exercise-card button:hover {
	background-color: #007acc;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- 배너 -->
	<div class="header-banner">
		🔥 <span>당신의 도전을 시작하세요! 오늘도 힘차게 Six Club</span> 💪
	</div>
	<!-- 컨텐츠 -->
	<div class="exercise-container">
		<h2 class="title">원하는 운동을 선택하세요</h2>
		<p class="subtitle">Six Club과 함께 시원한 건강 여정을 시작해보세요 💧</p>

		<div class="card-grid">
			<!-- 인터벌 운동 카드 -->
			<div class="exercise-card">
				<div class="card-image">
					<img src="${pageContext.request.contextPath}/resources/img/int.png" alt="인터벌 이미지">
				</div>
				<h3>인터벌 운동</h3>
				<p>고강도 인터벌운동을 조합하여 난이도별로 3개의 루틴을 제공합니다</p>
				<form action="interval.do" method="post">
					<button type="submit">선택하기</button>
				</form>
			</div>


			<!-- 근력 운동 카드 -->
			<div class="exercise-card">
				<div class="card-image">
					<img src="${pageContext.request.contextPath}/resources/img/wei.png" alt="근력운동 이미지">
				</div>
				<h3>근력 운동</h3>
				<p>3분할에 적합한 근력운동을 조합하여 난이도별로 2개의 루틴을 제공합니다</p>
				<form action="weight.do" method="post">
					<button type="submit">선택하기</button>
				</form>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>
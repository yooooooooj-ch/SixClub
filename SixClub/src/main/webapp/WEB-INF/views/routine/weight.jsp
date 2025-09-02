<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 근력운동 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f8ff;
	color: #003366;
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

.content {
	max-width: 800px;
	margin: 60px auto;
	padding: 30px;
	background-color: #ffffff;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 136, 204, 0.15);
	text-align: center;
}

.content h1 {
	font-size: 2.5rem;
	color: #007acc;
	margin-bottom: 20px;
}

.motivational-text {
	font-size: 1.2rem;
	color: #005577;
	margin-bottom: 40px;
}

form {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	gap: 40px;
	flex-wrap: wrap;
	padding: 0 20px;
	margin-top: 30px;
	flex-direction: row;
}

fieldset {
	display: flex;
	flex-direction: column;
	align-items: flex-start; /* ← 왼쪽 정렬 설정 */
	justify-content: center;
	border: none;
	background-color: #f0faff;
	border-radius: 20px;
	padding: 20px 30px;
	box-shadow: 0 6px 15px rgba(0, 136, 204, 0.1);
	min-width: 280px;
	flex: 1;
}

legend {
	font-size: 1.3rem;
	font-weight: bold;
	color: #007acc;
	margin-bottom: 20px;
	text-align: center;
}

label {
	font-size: 1rem;
	color: #003366;
	display: block;
	margin-bottom: 12px;
}

button[type="submit"] {
	display: block;
	margin: 40px auto 0;
	background-color: #00aaff;
	color: white;
	padding: 14px 30px;
	border: none;
	border-radius: 30px;
	font-size: 1.1rem;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
	background-color: #007acc;
}

input[type="radio"] {
	display: none;
}

label {
	display: block;
	width: 100%;
	background-color: #f5fbff;
	color: #007acc;
	font-size: 1rem;
	font-weight: 600;
	border: 2px solid #90caf9;
	border-radius: 12px;
	padding: 14px 20px;
	margin-bottom: 16px;
	cursor: pointer;
	transition: all 0.3s ease;
	box-shadow: 0 4px 10px rgba(0, 136, 204, 0.05);
	text-align: center;
}

input[type="radio"]:checked+label {
	background-color: #007acc;
	color: white;
	border-color: #007acc;
	box-shadow: 0 8px 16px rgba(0, 136, 204, 0.3);
	transform: scale(1.03);
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- 배너 -->
	<div class="header-banner">🔥 <span>당신의 도전을 시작하세요! 오늘도 힘차게 Six Club</span> 💪</div>
	<!-- 컨텐츠 -->
	<div class="content">
		<h1>근력운동 루틴 선택</h1>
		<p class="motivational-text">몸도 마음도 단단하게, Six Club과 함께 힘찬 하루를 시작해보세요 💪</p>

		<form action="we_level.do" method="post">
			<fieldset>
				<legend>운동 난이도를 선택해주세요</legend>
				<input type="radio" id="beginner" name="level" value="beginner">
				<label for="beginner">초급</label>

				<c:if test="${age < 60}">
					<input type="radio" id="intermediate" name="level" value="intermediate">
					<label for="intermediate">중급</label>

					<input type="radio" id="advanced" name="level" value="advanced">
					<label for="advanced">고급</label>
				</c:if>
			</fieldset>

			<fieldset>
				<legend>운동 부위를 선택해주세요</legend>
				<input type="radio" id="chest" name="type" value="chest&triceps">
				<label for="chest">가슴과 삼두</label>

				<input type="radio" id="back" name="type" value="back&biceps">
				<label for="back">등과 이두</label>

				<input type="radio" id="legs" name="type" value="legs&shoulders">
				<label for="legs">하체와 어깨</label>
			</fieldset>

			<button type="submit">루틴 보기</button>
		</form>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
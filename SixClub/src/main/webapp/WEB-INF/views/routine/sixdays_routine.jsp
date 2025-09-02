<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 6일 루틴 난이도 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f8ff;
	margin: 0;
	padding: 0;
	color: #003366;
}

.header-banner {
	background: linear-gradient(90deg, #007acc, #00cfff);
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

@
keyframes slideIn {from { transform:translateY(-100%);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

}
.content {
	max-width: 600px;
	margin: 60px auto;
	padding: 50px 40px;
	background-color: #ffffff;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 123, 255, 0.1);
	text-align: center;
	animation: fadeIn 0.8s ease;
}

@
keyframes fadeIn {from { opacity:0;
	transform: scale(0.95);
}

to {
	opacity: 1;
	transform: scale(1);
}

}
.content h1 {
	font-size: 2rem;
	color: #007acc;
	margin-bottom: 30px;
	font-weight: 800;
	position: relative;
}

input[type="radio"] {
	display: none;
}

input[type="radio"]+label {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	gap: 15px;
	padding: 16px 20px;
	margin-bottom: 20px;
	font-size: 17px;
	font-weight: 600;
	color: #007acc;
	border: 2px solid #90caf9;
	border-radius: 12px;
	cursor: pointer;
	background-color: #f0f9ff;
	transition: all 0.3s ease;
	box-shadow: 0 4px 10px rgba(0, 136, 204, 0.06);
}

input[type="radio"]:checked+label {
	background-color: #007acc;
	color: white;
	border-color: #007acc;
	box-shadow: 0 8px 16px rgba(0, 123, 255, 0.3);
	transform: scale(1.03);
}

input[type="radio"]+label i {
	font-size: 1.4rem;
}

hr {
	margin: 40px 0;
	border: none;
	border-top: 1px solid #d0e8ff;
}

button[type="submit"] {
	background: linear-gradient(135deg, #3399ff, #66ccff);
	color: white;
	border: none;
	padding: 14px 36px;
	font-size: 18px;
	font-weight: bold;
	border-radius: 12px;
	cursor: pointer;
	transition: background 0.3s ease, transform 0.2s ease;
	box-shadow: 0 8px 18px rgba(51, 153, 255, 0.4);
}

button[type="submit"]:hover {
	background: linear-gradient(135deg, #2678d9, #4ca1e0);
	transform: scale(1.04);
}
</style>
</head>

<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 배너 -->
	<div class="header-banner">
		🔥<span> 당신의 도전을 시작하세요! 오늘도 힘차게 Six Club </span>💪
	</div>

	<!-- 컨텐츠 -->
	<div class="content">
		<h1>난이도 선택</h1>

		<form action="sixdays_routine.do" method="post">
			<input type="radio" id="beginner" name="level" value="beginner">
			<label for="beginner">
				<i class="bi bi-emoji-smile"></i> 초급 – 누구나 쉽게 시작할 수 있어요
			</label>

			<c:if test="${age < 60}">
				<input type="radio" id="intermediate" name="level" value="intermediate">
				<label for="intermediate">
					<i class="bi bi-lightning-charge"></i> 중급 – 땀과 함께 실력을 쌓아요
				</label>

				<input type="radio" id="advanced" name="level" value="advanced">
				<label for="advanced">
					<i class="bi bi-fire"></i> 고급 – 진정한 도전이 기다립니다
				</label>
			</c:if>

			<input type="hidden" name="userId" value="${user.user_id}" />
			<hr>
			<button type="submit">루틴 보기</button>
		</form>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>

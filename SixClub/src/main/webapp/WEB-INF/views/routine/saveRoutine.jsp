<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 운동 기록 저장</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style>
body {
	background-color: #f0f8ff;
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
	color: #333;
}

.success-wrap {
	max-width: 500px;
	margin: 100px auto;
	background: #ffffff;
	padding: 50px 40px;
	border-radius: 16px;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
	text-align: center;
	animation: fadeUpIn 0.5s ease-out forwards;
	opacity: 0;
	transform: translateY(20px);
}

@keyframes fadeUpIn {to { opacity:1;
	transform: translateY(0);
}

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

.success-icon-check {
	font-size: 4rem;
	color: #28a745;
	margin-bottom: 20px;
}

.success-title {
	font-size: 2rem;
	color: #222;
	margin-bottom: 15px;
	font-weight: 700;
}

.success-desc {
	font-size: 1rem;
	color: #555;
	margin-bottom: 30px;
	line-height: 1.5;
}

.success-link {
	display: inline-block;
	padding: 10px 20px;
	background-color: #91caff;
	color: #fff;
	text-decoration: none;
	border-radius: 8px;
	transition: background-color 0.3s;
}

.success-link:hover {
	background-color: #0056b3;
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
	<div class="success-wrap">
		<div class="success-icon-check">✔️</div>
		<h1 class="success-title">${msg}</h1>
		<p class="success-desc">운동 기록은 마이페이지에서 확인하실 수 있습니다.</p>
		<a class="success-link" href="index.jsp">메인으로 돌아가기</a>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

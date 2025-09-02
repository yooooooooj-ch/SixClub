<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - BMI 계산하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">

<style>
/* 전체 배경 */
body {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	background-color: #f0f8ff;
	color: #003366;
}

/* 메인 레이아웃 */
.container {
	display: flex;
	min-height: 100vh;
	box-sizing: border-box;
	/* ==================================================== */
	max-width: 1200px; /* 컨텐츠 최대 너비 제한 */
	margin: 0 auto 0 200px; /* 좌우 자동 마진으로 화면 중앙에 배치 */
	padding: 0 20px; /* 좌우 약간 패딩 */
}

/* ===== 컨텐츠 영역 ===== */
.content {
	flex: 1;
	padding: 40px 0; /* 패딩 약간 줄임 */
	background-color: #f0f8ff;
	/* 중앙 정렬을 위해 flexbox 적용 */
	display: flex;
	flex-direction: column;
	align-items: center; /* 가로 중앙 */
	/* 필요하면 justify-content로 세로 정렬도 조절 가능 */
}

/* BMI 카드 */
form {
	background-color: #ffffff;
	padding: 30px;
	border-radius: 16px;
	box-shadow: 0 4px 12px rgba(0, 102, 204, 0.08);
	margin-bottom: 20px;
	max-width: 500px;
	/* align-self: center 제거 (부모가 flex container 이므로 필요 없음) */
	text-align: center;
	width: 100%; /* max-width가 있어도 100%로 꽉 차게 */
}

h1 {
	color: #007fff;
	font-size: 26px;
	margin-bottom: 30px;
}

.bmi {
	color: #007fff;
	font-size: 26px;
	margin-bottom: 30px;
	text-align: center;
}

.page-description {
	font-size: 1rem;
	color: #005577;
	margin-bottom: 30px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

table td {
	padding: 12px;
	border: 1px solid #b3d9ff;
	font-size: 16px;
}

input[type="text"] {
	width: 90%;
	padding: 10px;
	font-size: 15px;
	border-radius: 10px;
	border: 1.5px solid #99ccff;
	background-color: #f4faff;
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: #66bfff;
	color: white;
	padding: 12px 20px;
	font-size: 15px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	margin-top: 10px;
	transition: background-color 0.2s ease;
}

input[type="submit"]:hover {
	background-color: #3399ff;
}

/* BMI 결과 */
#bmiResult {
	background-color: #e0f0ff;
	border-left: 6px solid #3399ff;
	padding: 16px;
	margin: 30px 0 20px;
	font-size: 16px;
	border-radius: 8px;
	max-width: 500px;
	margin-left: auto;
	margin-right: auto;
}

strong {
	color: #005bac;
}
</style>
</head>
<body>
	<!-- 에러 메시지 출력 -->
	<c:if test="${not empty msg}">
		<script>
			alert('${msg}');
		</script>
	</c:if>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 전체 레이아웃 -->
	<div class="container">

		<!-- ===== 사이드바 ===== -->
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

		<!-- ===== 메인 콘텐츠 ===== -->
		<div class="content">



			<!-- BMI 계산기 -->
			<h1 class="bmi">💧 BMI 계산기</h1>
			<p class="page-description">체질량지수(BMI)를 통해 건강상태를 빠르고 정확하게 확인해보세요! 📏✨</p>
			

			<form action="bmi.do" method="post">
				<table>
					<tr>
						<td>키 (cm)</td>
						<td>몸무게 (kg)</td>
					</tr>
					<tr>
						<td><input type="text" name="height" value="${user.height}" required /></td>
						<td><input type="text" name="weight" value="${user.weight}" required /></td>
					</tr>
				</table>
				<input type="submit" value="BMI 계산하기">
			</form>

			<c:if test="${not empty bmi}">
				<div id="bmiResult">
					당신의 BMI는 <strong>${bmi}</strong>이고, 현재 상태는 <strong>${health}</strong>입니다.
				</div>
			</c:if>

			<form action="myPage.do">
				<input type="submit" value="뒤로 가기">
			</form>

		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

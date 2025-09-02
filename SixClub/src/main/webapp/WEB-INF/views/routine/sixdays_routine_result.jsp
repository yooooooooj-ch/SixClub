<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 6일 루틴 결과</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background: linear-gradient(to bottom, #e3f2fd, #ffffff);
	margin: 0;
	padding: 0;
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

50
%
{
background-position
:
100%
50%;
}
100
%
{
background-position
:
0%
50%;
}
}
.content {
	max-width: 1200px;
	margin: 60px auto;
	padding: 40px;
	text-align: center;
}

h1 {
	font-size: 2rem;
	color: #1565c0;
	margin-bottom: 10px;
}

p {
	margin: 5px 0 20px;
	font-size: 16px;
	color: #333;
}

.routine-container {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	gap: 30px;
	margin: 40px 0;
}

.routine-card {
	flex: 1 1 calc(33.333% - 30px);
	background: #ffffff;
	border-radius: 16px;
	padding: 25px 20px;
	box-shadow: 0 8px 20px rgba(0, 123, 255, 0.1);
	text-align: left;
	min-width: 300px;
}

.routine-card h3 {
	font-size: 18px;
	margin-bottom: 20px;
	color: #0d47a1;
	border-bottom: 1px solid #eee;
	padding-bottom: 10px;
}

.routine-card table {
	width: 100%;
	border-collapse: collapse;
}

.routine-card td {
	padding: 10px 0;
	font-size: 15px;
	color: #444;
	border-bottom: 1px solid #f0f0f0;
}

.save-button {
	display: inline-block;
	margin-top: 40px;
	padding: 14px 32px;
	background: #2196f3;
	color: white;
	border: none;
	font-size: 16px;
	font-weight: bold;
	border-radius: 10px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.save-button:hover {
	background: #1976d2;
}

@media ( max-width : 768px) {
	.routine-card {
		flex: 1 1 100%;
	}
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
		<h1>${user.user_name}님의6일운동루틴</h1>
		<p>나이: ${age}세</p>
		<p>
			선택한 난이도:
			<c:choose>
				<c:when test="${level == 'beginner'}">초급</c:when>
				<c:when test="${level == 'intermediate'}">중급</c:when>
				<c:when test="${level == 'advanced'}">고급</c:when>
				<c:otherwise>알 수 없음</c:otherwise>
			</c:choose>
		</p>

		<form action="saveWorkoutPlan.do" method="post">
			<input type="hidden" name="userId" value="${user.user_no}" /> <input type="hidden" name="woLevel" value="${level}" />

			<div class="routine-container">
				<c:forEach var="dayRoutine" items="${routineList}" varStatus="dayStatus">
					<div class="routine-card">
						<h3>DAY ${dayStatus.index + 1}</h3>
						<table>
							<tbody>
								<c:forEach var="workout" items="${dayRoutine}">
									<tr>
										<td>${workout.woName}</td>
										<td><c:choose>
												<c:when test="${level eq 'beginner'}">3세트 <br>(휴식 60초)</c:when>
												<c:when test="${level eq 'intermediate'}">4세트 <br>(휴식 45초)</c:when>
												<c:when test="${level eq 'advanced'}">5세트<br>(휴식 30초)</c:when>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>

			<button type="submit" class="save-button">전체 루틴 저장</button>
		</form>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>

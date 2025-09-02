<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 근력 루틴 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<style>
body {
	background-color: #f5faff;
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
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

.content {
	padding: 40px 20px;
	text-align: center;
}

.routine-title {
	font-size: 24px;
	font-weight: bold;
	color: #0066cc;
	margin-bottom: 30px;
}

.routine-container {
	display: flex;
	justify-content: center;
	gap: 20px;
	flex-wrap: wrap;
}

.routine-card {
	background-color: white;
	border-radius: 16px;
	padding: 20px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	width: 300px;
	transition: transform 0.2s;
}

.routine-card:hover {
	transform: translateY(-5px);
}

.routine-card h3 {
	margin-top: 0;
	font-size: 20px;
	margin-bottom: 15px;
}

.routine-card table {
	width: 100%;
	border-collapse: collapse;
	font-size: 14px;
}

.routine-card td {
	padding: 8px;
	border-bottom: 1px solid #eee;
}

.routine-card tr:last-child td {
	border-bottom: none;
}

.routine-card button {
	background-color: #00b0ff;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 20px;
	cursor: pointer;
	margin-top: 15px;
	font-size: 14px;
}

.routine-card button:hover {
	background-color: #008dd1;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- 배너 -->
	<div class="header-banner">
		🔥 <span>당신의 도전을 시작하세요! 오늘도 힘차게 Six Club</span> 💪
	</div>
	
	<!-- 컨텐츠 -->
	<div class="content">
		<div class="routine-title">원하는 루틴을 선택해주세요</div>
		<div class="routine-container">
			<!-- 루틴 1 카드 -->
			<form action="saveWorkoutHistory.do" method="post">
				<input type="hidden" name="userId" value="${user.user_no}" />
				<input type="hidden" name="level" value="${level}" />
				<c:set var="ids1" value="" />
				<c:forEach var="item" items="${routine1}">
					<c:set var="ids1" value="${ids1}${item.woNo}," />
				</c:forEach>
				<input type="hidden" name="workoutIds" value="${fn:substring(ids1, 0, fn:length(ids1) - 1)}" />
				<div class="routine-card">
					<h3>루틴 그룹 1</h3>
					<table>
						<c:forEach var="item" items="${routine1}">
							<tr>
								<td>${item.woName}</td>
								<td><c:choose>
										<c:when test="${level eq 'beginner'}">3세트 15회 (휴식 90초)</c:when>
										<c:when test="${level eq 'intermediate'}">4세트 12회 (휴식 70초)</c:when>
										<c:when test="${level eq 'advanced'}">4세트 8회 (휴식 60초)</c:when>
									</c:choose></td>
							</tr>
						</c:forEach>
					</table>
					<button type="submit" name="selectedGroup" value="1">이 그룹 선택</button>
				</div>
			</form>

			<!-- 루틴 2 카드 -->
			<form action="saveWorkoutHistory.do" method="post">
				<input type="hidden" name="userId" value="${user.user_id}" />
				<input type="hidden" name="level" value="${level}" />
				<c:set var="ids2" value="" />
				<c:forEach var="item" items="${routine2}">
					<c:set var="ids2" value="${ids2}${item.woNo}," />
				</c:forEach>
				<input type="hidden" name="workoutIds" value="${fn:substring(ids2, 0, fn:length(ids2) - 1)}" />
				<div class="routine-card">
					<h3>루틴 그룹 2</h3>
					<table>
						<c:forEach var="item" items="${routine2}">
							<tr>
								<td>${item.woName}</td>
								<td><c:choose>
										<c:when test="${level eq 'beginner'}">3세트 15회 (휴식 90초)</c:when>
										<c:when test="${level eq 'intermediate'}">4세트 12회 (휴식 70초)</c:when>
										<c:when test="${level eq 'advanced'}">4세트 8회 (휴식 60초)</c:when>
									</c:choose></td>
							</tr>
						</c:forEach>
					</table>
					<button type="submit" name="selectedGroup" value="2">이 그룹 선택</button>
				</div>
			</form>


		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

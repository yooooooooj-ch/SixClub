<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 인터벌 루틴 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<style>
body {
	background-color: #f0f8ff;
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
	color: #333;
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
.routine-title {
	text-align: center;
	font-size: 2rem;
	font-weight: 700;
	color: #007acc;
	margin-top: 40px;
}

.content {
	max-width: 1200px;
	margin: 60px auto;
	padding: 0 20px;
	display: flex;
	flex-wrap: nowrap; /* 줄바꿈 방지 */
	justify-content: center;
	gap: 30px;
}

/* 공통 카드 스타일 */
.group-card {
	border-radius: 20px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.07);
	width: 380px;
	overflow: hidden;
	transition: transform 0.2s ease;
}

.group-card:hover {
	transform: translateY(-5px);
}

/* 각 그룹별 파스텔 배경색 */
.group-1 {
	background-color: #e8f4ff;
}

.group-2 {
	background-color: #ffeef1;
}

.group-3 {
	background-color: #eafff1;
}

.group-4 {
	background-color: #fffbe6;
}

.group-5 {
	background-color: #f0f0ff;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th {
	background-color: rgba(0, 0, 0, 0.05);
	text-align: center;
	padding: 12px;
	font-size: 1.1rem;
	font-weight: bold;
	color: #333;
}

td {
	padding: 10px;
	border-top: 1px solid rgba(0, 0, 0, 0.05);
	background-color: rgba(255, 255, 255, 0.4);
}

.card-footer {
	text-align: center;
	padding: 15px;
}

button {
	background-color: #7ec8e3; /* 연한 하늘색 파스텔 */
	color: #fff;
	border: none;
	border-radius: 30px;
	padding: 10px 25px;
	font-size: 1rem;
	font-weight: bold;
	cursor: pointer;
	transition: background 0.3s ease, box-shadow 0.3s ease;
	box-shadow: 0 4px 10px rgba(126, 200, 227, 0.5);
}

button:hover {
	background-color: #5aaecf; /* 좀 더 진한 파스텔 블루 */
	box-shadow: 0 6px 15px rgba(90, 174, 207, 0.7);
}

/* 반응형 */
@media ( max-width : 768px) {
	.content {
		flex-direction: column;
		align-items: center;
	}
	.group-card {
		width: 90%;
	}
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
	<!-- 제목 -->
	<h2 class="routine-title">원하는 루틴을 선택해주세요</h2>

	<!-- 컨텐츠 -->
	<div class="content">
		<c:set var="groupCount" value="${(fn:length(routine) div 5) + (fn:length(routine) % 5 > 0 ? 1 : 0)}" />

		<c:forEach var="group" begin="0" end="${groupCount - 1}" varStatus="status">

			<%-- 그룹 색상 클래스 지정 --%>
			<c:set var="groupClass" value="group-${(status.index % 5) + 1}" />

			<form action="saveWorkoutHistory.do" method="post" class="group-card ${groupClass}">
				<input type="hidden" name="userId" value="${user.user_no}" /> <input type="hidden" name="level" value="${level}" />

				<table>
					<thead>
						<tr>
							<th colspan="2">루틴 그룹 ${status.index + 1}</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="start" value="${group * 5}" />
						<c:set var="end" value="${(start + 5) > fn:length(routine) ? fn:length(routine) : (start + 5)}" />
						<c:set var="ids" value="" />

						<c:forEach var="i" begin="${start}" end="${end - 1}">
							<tr>
								<td>${routine[i].woName}</td>
								<td><c:choose>
										<c:when test="${level eq 'beginner'}">3세트 (휴식 60초)</c:when>
										<c:when test="${level eq 'intermediate'}">4세트 (휴식 45초)</c:when>
										<c:when test="${level eq 'advanced'}">5세트 (휴식 30초)</c:when>
									</c:choose></td>
							</tr>

							<!-- 운동 ID를 순서대로 ids 변수에 저장 -->
							<c:set var="ids" value="${ids}${routine[i].woNo}," />
						</c:forEach>

						<tr>
							<td colspan="2" class="card-footer">
								<!-- 마지막 콤마 제거 후 숨겨진 input에 저장 --> <input type="hidden" name="workoutIds" value="${fn:substring(ids, 0, fn:length(ids) - 1)}" />
								<button type="submit" name="selectedGroup" value="${status.index + 1}">이 그룹 선택</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>

		</c:forEach>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

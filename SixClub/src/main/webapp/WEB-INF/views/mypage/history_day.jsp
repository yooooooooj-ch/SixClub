<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 운동 히스토리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	background-color: #f0f8ff;
	color: #003366;
}

.container {
	display: flex;
	min-height: 100vh;
	box-sizing: border-box;
	max-width: 1200px;
	margin: 0 auto 0 200px;
	padding: 0 20px;
}

.content {
	flex: 1;
	padding: 40px 0 40px 300px; /* 왼쪽에 충분한 여백 확보 (260 + 40 기준) */
	background-color: #f0f8ff;
	display: flex;
	flex-direction: column;
	align-items: center; /* 왼쪽 정렬 */
	box-sizing: border-box;
}

h2 {
	text-align: center;
	font-size: 28px;
	margin-bottom: 40px;
	color: #007acc;
}

.card-grid {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	width: 100%;
	justify-content: center;
}

.history-card {

	border: 1px solid #e5e7eb;
	border-radius: 12px;
	background-color: #ffffff;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
	overflow: hidden;
	transition: all 0.3s ease;
}

.card-header {
background: linear-gradient(to right, #4facfe, #00f2fe);
	color: white;
	padding: 18px 24px;
	font-weight: bold;
	font-size: 16px;
	width: 100%;
	text-align: left;
	border: none;
	cursor: pointer;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.card-body {
	display: none;
	padding: 20px 24px;
	background-color: #f9fafb;
	border-top: 1px solid #e5e7eb;
}

.card-body table {
	width: 100%;
	border-collapse: collapse;
}

.card-body th, .card-body td {
	border: 1px solid #e5e7eb;
	padding: 10px;
	text-align: center;
	font-size: 14px;
}

.card-body th {
	background-color: #eff6ff;
	color: #1e3a8a;
	font-weight: 600;
}

.card-body td {
	background-color: #ffffff;
}
</style>
<script>
function toggleCard(index) {
	const allBodies = document.querySelectorAll('.card-body');
	const clicked = document.getElementById('cardBody' + index);
	allBodies.forEach(b => b.style.display = (b === clicked && b.style.display !== 'block') ? 'block' : 'none');
}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="container">
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

		<div class="content">
			<h2>1일 계획 히스토리</h2>
			<div class="card-grid">
				<c:set var="prevHistoryNo" value="-1" />
				<c:set var="cardIndex" value="0" />

				<c:forEach var="routine" items="${RoutineList}" varStatus="status">
					<c:if test="${prevHistoryNo != routine.historyNo}">
						<c:if test="${!status.first}">
							</tbody>
							</table>
			</div>
		</div>
		<!-- 이전 카드 닫기 -->
		<c:set var="cardIndex" value="${cardIndex + 1}" />
		</c:if>

		<!-- 새 카드 열기 -->
		<div class="history-card">
			<button type="button" class="card-header" onclick="toggleCard(${cardIndex})">
				<span> 날짜: <fmt:formatDate value="${routine.woDate}" pattern="yyyy-MM-dd" /> | 난이도: <c:choose>
						<c:when test="${routine.woLevel == 0}">초급💪</c:when>
						<c:when test="${routine.woLevel == 1}">중급🔥</c:when>
						<c:when test="${routine.woLevel == 2}">고급🚀</c:when>
						<c:otherwise>미정</c:otherwise>
					</c:choose>
				</span>
			</button>
			<div class="card-body" id="cardBody${cardIndex}">
				<table>
					<thead>
						<tr>
							<th>운동 이름</th>
							<th>운동 부위</th>
						</tr>
					</thead>
					<tbody>
						</c:if>

						<tr>
							<td>${routine.woName}</td>
							<td><c:choose>
									<c:when test="${routine.woType == 0}">인터벌</c:when>
									<c:when test="${routine.woType == 1}">가슴</c:when>
									<c:when test="${routine.woType == 2}">등</c:when>
									<c:when test="${routine.woType == 3}">어깨</c:when>
									<c:when test="${routine.woType == 4}">다리</c:when>
									<c:when test="${routine.woType == 5}">이두</c:when>
									<c:when test="${routine.woType == 6}">삼두</c:when>
									<c:otherwise>기타</c:otherwise>
								</c:choose></td>
						</tr>

						<c:set var="prevHistoryNo" value="${routine.historyNo}" />

						<!-- 마지막 요소일 경우 카드 닫기 -->
						<c:if test="${status.last}">
					</tbody>
				</table>
			</div>
		</div>
		</c:if>
		</c:forEach>
	</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

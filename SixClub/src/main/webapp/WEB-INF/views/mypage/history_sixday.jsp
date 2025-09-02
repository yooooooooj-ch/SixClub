<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
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

.wh-content {
	flex: 1;
	padding: 40px 0 40px 300px;
	background-color: #f0f8ff;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	box-sizing: border-box;
}

h2 {
	font-size: 28px;
	margin: 0 auto 40px;
	color: #007acc;
	text-align: center;
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
	justify-content: center;
	align-items: center;
	border-radius: 12px;
	margin-bottom: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
}

.card-header:hover {
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	transform: translateY(-2px);
	transition: all 0.3s ease;
}

.wh-grid-container {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 24px;
	margin-top: 20px;
	width: 100%;
	box-sizing: border-box;
}

.wh-day-table {
	width: 100%;
	border: 1px solid #e5e7eb;
	border-radius: 12px;
	overflow: hidden;
	background-color: #ffffff;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
	transition: all 0.3s ease;
}

.wh-day-table:hover {
	transform: translateY(-5px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.wh-day-header {
	background-color: #dff0ff;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	font-weight: bold;
	text-align: center;
	padding: 12px;
	font-size: 16px;
	color: #004080;
}

.wh-day-table table {
	width: 100%;
	border-collapse: collapse;
	font-size: 14px;
}

.wh-day-table th, .wh-day-table td {
	padding: 10px;
	text-align: center;
}

.wh-day-table th {
	background-color: #f9f9f9;
	font-weight: 600;
	color: #333;
}

.wh-day-table td {
	background-color: #ffffff;
	color: #444;
	border-top: 1px solid #eee;
}

.wh-plan-content {
	display: none;
	animation: fadeIn 0.3s ease-in-out;
	width: 100%;
}

.wh-separator {
	border: none;
	border-top: 1px solid #ccc;
	margin: 40px 0;
	opacity: 0.5;
}

@keyframes fadeIn {
	from {
		opacity: 0;
		transform: translateY(10px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}
</style>

<script>
function togglePlanContent(index) {
	const content = document.getElementById('wh-plan-content-' + index);
	content.style.display = (content.style.display === 'none' || content.style.display === '') ? 'block' : 'none';
}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="container">
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
		<div class="wh-content">

			<h2>6일 계획 히스토리</h2>

			<c:forEach var="routineList" items="${allRoutineList}" varStatus="planStatus">
				
				<!-- 카드 스타일 버튼으로 변경 -->
				<button type="button" class="card-header" onclick="togglePlanContent(${planStatus.index})">
					<span>날짜: ${planStartDates[planStatus.index]} | 운동 계획 ${planStatus.index + 1}</span>
				</button>

				<div id="wh-plan-content-${planStatus.index}" class="wh-plan-content">
					<div class="wh-grid-container">
						<c:forEach var="dailyRoutine" items="${routineList}" varStatus="dayStatus">
							<div class="wh-day-table">
								<div class="wh-day-header">Day ${dayStatus.index + 1}</div>
								<table>
									<tr>
										<th>운동 이름</th>
										<th>운동 부위</th>
									</tr>
									<c:forEach var="workout" items="${dailyRoutine}">
										<tr>
											<td>${workout.woName}</td>
											<td>
												<c:choose>
													<c:when test="${workout.woType == 0}">인터벌</c:when>
													<c:when test="${workout.woType == 1}">가슴</c:when>
													<c:when test="${workout.woType == 2}">등</c:when>
													<c:when test="${workout.woType == 3}">어깨</c:when>
													<c:when test="${workout.woType == 4}">다리</c:when>
													<c:when test="${workout.woType == 5}">이두</c:when>
													<c:when test="${workout.woType == 6}">삼두</c:when>
													<c:otherwise>기타</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</c:forEach>
					</div>
					<hr class="wh-separator" />
				</div>
			</c:forEach>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

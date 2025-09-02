<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">
<style>
body {
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f8ff;
	color: #222;
}

.container {
	display: flex;
	min-height: 100vh;
	box-sizing: border-box;
	/* ==================================================== */
	max-width: 1200px; /* 컨텐츠 최대 너비 제한 */
	margin: 0 auto 0 200px; /* 좌우 자동 마진으로 화면 중앙에 배치 */
	padding: 0 20px; /* 좌우 약간 패딩 */
}

.main-content {
	flex: 1;
	padding-left: 40px;
	max-width: 840px; /* 👈 너비 제한 추가 */
	margin: 0 auto; /* 👈 가운데 정렬 */
	margin-top: 40px;
}

.welcome-box {
	border: 1px solid #ddd;
	border-radius: 12px;
	padding: 20px 0px 20px 10px;
	margin-bottom: 30px;
	background-color: #fff;
}

.welcome-box h2 {
	font-size: 22px;
	margin-bottom: 8px;
	color: #000;
}

.welcome-box p {
	color: #777;
	font-size: 14px;
}

.calendar-routine {
	display: grid;
	grid-template-columns: repeat(3, 1fr); /* 3열 달력형 */
	gap: 20px;
	margin-bottom: 40px;
}

.calendar-card {
	border-radius: 12px;
	background-color: #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
	transition: transform 0.2s;
	background-image:
		url('${pageContext.request.contextPath}/resources/img/calen.png');
	background-repeat: no-repeat;
	background-position: center top;
	background-size: contain; /* 또는 contain, 보기에 따라 */
	padding: 60px 20px 20px 20px; /* 상단 패딩 추가로 내용 아래로 내리기 */
	position: relative;
	margin-right: 10px;
	height: 400px;
}

.calendar-card:hover {
	transform: scale(1.02);
}

.calendar-card h3 {
	font-size: 16px;
	margin-bottom: 10px;
	color: #0066cc;
	border-bottom: 1px solid #eee;
	padding-bottom: 6px;
}

.calendar-card ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.calendar-card li {
	font-size: 14px;
	margin-bottom: 4px;
	color: #333;
}

.calendar-card1 {
	background-color: rgba(255, 255, 255, 0);
	border-radius: 16px;
	padding: 20px;
	padding-top: 30px; /* 👈 고리 높이만큼 여유 줌 */
	position: relative;
}
/* 중간 화면 대응 (태블릿, 작은 노트북) */
@media ( max-width : 1024px) {
	.container {
		margin: 0 auto;
		padding: 0 16px;
		flex-direction: column;
	}
	.main-content {
		padding-left: 0;
		max-width: 100%;
	}
	.calendar-routine {
		grid-template-columns: repeat(2, 1fr);
		gap: 16px;
	}
}

/* 더 작은 화면 대응 (모바일) */
@media ( max-width : 768px) {
	.container {
		padding: 0 10px;
	}
	.main-content {
		max-width: 100%;
		padding-left: 0;
	}
	.calendar-routine {
		grid-template-columns: repeat(1, 1fr);
	}
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 컨텐츠 -->
	<div class="container">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />



		<!-- Main Content -->
		<div class="main-content">
			<div class="welcome-box">
				<h2>
					<c:if test="${badge }">
						<c:choose>
							<c:when test="${sub.monthBetween==1}">
								<img src="${pageContext.request.contextPath}/resources/img/bluelogo1.png" alt="1개월구독" height="30px"/>
							</c:when>
							<c:when test="${sub.monthBetween==3}">
								<img src="${pageContext.request.contextPath}/resources/img/silverlogo1.png" alt="3개월구독" height="30px"/>
							</c:when>
							<c:when test="${sub.monthBetween==6}">
								<img src="${pageContext.request.contextPath}/resources/img/goldlogo1.png" alt="6개월구독" height="30px"/>
							</c:when>
							<c:otherwise>
								0
							</c:otherwise>
						</c:choose>
					</c:if>
					${name}님 환영합니다
				</h2>
				<p>
					당신의 활동 정보를 확인하세요.
					<c:if test="${badge}">
						<span style="font-weight: bold; color: black;">(구독 종료일: ${end_date})</span>
					</c:if>
				</p>
			</div>

			<!-- 루틴 영역 -->
			<c:set var="hasRoutine" value="false" />
			<c:forEach var="dayRoutine" items="${routineList}">
				<c:if test="${not empty dayRoutine}">
					<c:set var="hasRoutine" value="true" />
				</c:if>
			</c:forEach>

			<c:if test="${hasRoutine}">
				<div class="welcome-box">
					<h2 style="margin-bottom: 24px;">나의 6일 운동 루틴</h2>

					<!-- 루틴 캘린더 -->
					<div class="calendar-routine">
						<c:forEach var="dayRoutine" items="${routineList}" varStatus="dayStatus">

							<!-- 루틴 카드 -->
							<div class="calendar-card">
								<c:set var="date" value="${routineDates[dayStatus.index]}" />
								<c:set var="type" value="${not empty dayRoutine ? dayRoutine[0].woType : -1}" />

								<c:choose>
									<c:when test="${type == 0}">
										<c:set var="typeName" value="인터벌" />
									</c:when>
									<c:when test="${type == 1}">
										<c:set var="typeName" value="가슴·삼두" />
									</c:when>
									<c:when test="${type == 2}">
										<c:set var="typeName" value="등·이두" />
									</c:when>
									<c:when test="${type == 3}">
										<c:set var="typeName" value="하체·어깨" />
									</c:when>
									<c:otherwise>
										<c:set var="typeName" value="알 수 없음" />
									</c:otherwise>
								</c:choose>

								<!-- 여기서 바로 출력 -->
								<div class="calendar-card1">
									<h3>
										<c:if test="${not empty date}">${date}</c:if>
										(${typeName})
									</h3>

									<c:choose>
										<c:when test="${not empty dayRoutine}">
											<ul style="list-style: none; padding: 0; margin: 0;">
												<c:forEach var="workout" items="${dayRoutine}">
													<li style="margin-bottom: 6px; font-size: 14px;"><strong>${workout.woName}</strong></li>
												</c:forEach>
											</ul>
										</c:when>
										<c:otherwise>
											<p style="color: #999;">등록된 운동이 없습니다.</p>
										</c:otherwise>
									</c:choose>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>
			</c:if>
		</div>

	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
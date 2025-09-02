<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 관리자</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f8ff;
	color: #333;
	margin: 0;
	padding: 0;
}

.content {
	max-width: 900px;
	margin: 40px auto;
	padding: 30px 40px;
	background-color: #fff;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	text-align: center;
}

.content h1 {
	margin-bottom: 30px;
	font-weight: 700;
	font-size: 2.4rem;
	color: #2c3e50;
}

.admin-menu {
	display: flex;
	justify-content: center;
	gap: 30px;
	flex-wrap: wrap;
}

.admin-menu a {
	display: inline-block;
	padding: 18px 36px;
	background-color: #a8d0ff; /* 연한 하늘색 */
	color: #2c3e50;
	font-weight: 600;
	font-size: 1.2rem;
	border-radius: 6px;
	text-decoration: none;
	transition: background-color 0.3s ease, transform 0.2s ease;
	box-shadow: 0 3px 6px rgba(168, 208, 255, 0.5);
}

.admin-menu a:hover {
	background-color: #7bb1ff;
	transform: translateY(-3px);
	box-shadow: 0 8px 15px rgba(123, 177, 255, 0.6);
	color: #1b2a3d;
}

/* 대시보드 요약 */
.dashboard-summary {
	display: flex;
	justify-content: space-around;
	margin: 40px 0 60px 0;
	gap: 20px;
}

.summary-box {
	background-color: #e3eaff;
	padding: 25px 35px;
	border-radius: 10px;
	box-shadow: 0 3px 10px rgba(120, 140, 200, 0.3);
	flex: 1;
	text-align: center;
	color: #2c3e50;
}

.summary-box h3 {
	margin-bottom: 15px;
	font-size: 1.3rem;
	font-weight: 700;
}

.summary-box p {
	font-size: 2.2rem;
	font-weight: 800;
	margin: 0;
	color: #466bbf;
}

/* 빠른 액션 버튼 */
.quick-actions {
	text-align: center;
	margin-bottom: 60px;
}

.btn-action {
	display: inline-block;
	background-color: #c5d9ff;
	color: #2c3e50;
	font-weight: 600;
	padding: 14px 32px;
	margin: 0 15px 15px 15px;
	border-radius: 8px;
	text-decoration: none;
	box-shadow: 0 3px 7px rgba(150, 180, 240, 0.4);
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.btn-action:hover {
	background-color: #9ab8ff;
	transform: translateY(-3px);
	box-shadow: 0 8px 20px rgba(154, 184, 255, 0.7);
	color: #1b2a3d;
}

/* 최근 활동 내역 */
.recent-activity {
	max-width: 600px;
	margin: 0 auto 40px auto;
	text-align: left;
}

.recent-activity h2 {
	font-weight: 700;
	font-size: 1.6rem;
	margin-bottom: 20px;
	color: #2c3e50;
}

.recent-activity ul {
	list-style-type: none;
	padding-left: 0;
}

.recent-activity ul li {
	padding: 10px 0;
	border-bottom: 1px solid #dbe4ff;
	font-size: 1.1rem;
	color: #4a4a4a;
}
</style>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />

	<!-- 컨텐츠 -->
	<div class="content">
		<h1>관리자 메인페이지</h1>

		<!-- 관리자 메뉴 -->
		<div class="admin-menu">
			<a href="getUserList.do">회원관리</a> <a href="showStatics.do">통계관리</a> <a href="goRoutineEdit.do">운동관리</a> <a href="goQna.do"> Q&A</a>
		</div>

		<!-- 대시보드 요약 -->
		<div class="dashboard-summary">
			<div class="summary-box">
				<h3>총 회원 수</h3>
				<p>${mUsersCount}</p>
			</div>
			<div class="summary-box">
				<h3>회원 재구독율</h3>
				<p>${mreSubscribeRatio}%</p>
			</div>
			<div class="summary-box">
				<h3>구독 회원 수</h3>
				<p>${mSubSoo}</p>
			</div>
		</div>




		<!-- 최근 활동 내역 -->
		<div class="recent-activity">
			<h2>최근 구독 회원</h2>
			<c:if test="${empty mNewSubscribe}">
				<p>구독 데이터가 없습니다.</p>
			</c:if>

			<c:if test="${not empty mNewSubscribe}">
				<ul>
					<c:forEach var="getNewSub" items="${mNewSubscribe}">
						<li>${getNewSub.user_name}- ${getNewSub.start_date}</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

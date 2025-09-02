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
	max-width:1200px; /* 컨텐츠 최대 너비 제한 */
	margin: 0 auto 0 200px; /* 좌우 자동 마진으로 화면 중앙에 배치 */
	padding: 0 20px; /* 좌우 약간 패딩 */
}




/* ===== 컨텐츠 영역 ===== */
.content {
	display: flex;
	flex: 1; 
	padding: 40px 0; /* 패딩 약간 줄임 */
	background-color: #f0f8ff;
	/* 중앙 정렬을 위해 flexbox 적용 */
	flex-direction: column;
	margin: 0 auto 0 auto;
	margin-left:200px;
	align-items: center; /* 가로 중앙 */
	/* 필요하면 justify-content로 세로 정렬도 조절 가능 */
	
}

/* 카드 */
form {
	background-color: #ffffff;
	padding: 30px;
	border-radius: 16px;
	box-shadow: 0 4px 12px rgba(0, 102, 204, 0.08);
	margin-bottom: 20px;
	max-width: 800px;
	/* align-self: center 제거 (부모가 flex container 이므로 필요 없음) */
	text-align: center;
	width: 100%; /* max-width가 있어도 100%로 꽉 차게 */
}

h1 {
	color: #007fff;
	font-size: 26px;
	margin-bottom: 30px;
}
/* span {
	color: #005bac;
	font-size: 30px;
	margin-bottom: 30px;
} */

/* 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
	background-color: #fff;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
	border-radius: 6px;
	overflow: hidden;
}

table thead tr {
	background-color: #e6f3ff;
	color: #007acc;
	font-size: 16px;
	font-weight: 600;
	border-left: none;
    border-right: none;
}

table tr, table td {
	text-align: center;
	padding: 14px;
	border-bottom: 1px solid #e0e0e0;
	font-size: 14px;
}



table tbody tr:hover {
	background-color: #f5faff;
	transition: background-color 0.3s;
}


strong {
	color: #005bac;
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
	



		<!-- 컨텐츠 -->
		<div class="content">
			<h1>${user_name} 님의  구독 정보 💪  </h1>
		
		<form>
			<table border="2">
			<thead>
				<tr>
					<td>등급</td>
					<td>구독권 기간</td>
					<td>구독 시작일</td>
					<td>구독 종료일</td>
					<td>결제 금액</td>					
				</tr>
				
			</thead>
				<c:forEach var="sub" items="${subHis}">
					<tr>
						<td><c:choose>
								<c:when test="${sub.monthBetween==1}">
									 <img src="${pageContext.request.contextPath}/resources/img/bluelogo1.png" alt="1개월구독" style="width:60px; height:auto;" />
								</c:when>
								<c:when test="${sub.monthBetween==3}">
									 <img src="${pageContext.request.contextPath}/resources/img/silverlogo1.png" alt="3개월구독" style="width:60px; height:auto;" />
								</c:when>
								<c:when test="${sub.monthBetween==6}">
									 <img src="${pageContext.request.contextPath}/resources/img/goldlogo1.png" alt="6개월구독" style="width:60px; height:auto;" />
								</c:when>
								<c:otherwise>
								0
								</c:otherwise>
							</c:choose> </td>
						<td>${sub.monthBetween}개월 구독권</td>						
						<td>${sub.start_date}</td>
						<td>${sub.end_date}</td>
						<td><c:choose>
								<c:when test="${sub.monthBetween==1}">
									 3,900 원
								</c:when>
								<c:when test="${sub.monthBetween==3}">
									 9,900 원
								</c:when>
								<c:when test="${sub.monthBetween==6}">
									 14,900 원
								</c:when>
								<c:otherwise>
								0
								</c:otherwise>
							</c:choose> </td>
					</tr>
				</c:forEach>
			</table>
			</form>

		</div>



	</div>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
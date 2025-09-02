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
	margin: 0;
	background-color: #f0f8ff;
	color: #003366;
}

/* 관리자 페이지 공통 스타일 */
.content {
	max-width: 1200px;
	margin: 0 auto;
	padding: 40px 20px;
	font-family: 'Pretendard', sans-serif;
	color: #333;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* 제목 스타일 */
h1 {
	font-size: 28px;
	font-weight: 700;
	margin-bottom: 40px;
	color: #222;
	border-left: 6px solid #4A90E2;
	padding-left: 15px;
}

h2 {
	font-size: 20px;
	font-weight: 600;
	margin-top: 60px;
	margin-bottom: 20px;
	color: #4A90E2;
}

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

td a {
	color: #007acc;
	text-decoration: none;
}

td a:hover {
	text-decoration: underline;
}

table img {
	border-radius: 4px;
	box-shadow: 0 0 6px rgba(0, 0, 0, 0.1);
}

.section-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 10px;
	margin-bottom: 20px;
}

.section-header h2 {
	margin: 0;
}

/* 버튼 스타일 */
form input[type="submit"] {
	background-color: #4A90E2;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 6px;
	font-size: 15px;
	font-weight: 500;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-top: 10px;
}

form input[type="submit"]:hover {
	background-color: #357ABD;
}

.next {
	display: flex;
	gap: 10px; /* 버튼 사이의 간격 */
	justify-content: center; /* 가운데 정렬 */
	align-items: center;
	margin-top: 10px;
}

.next form {
	display: inline-block;
}

/* 페이지네이션 */
.paging {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 30px;
}

.pagination form {
	display: inline-block;
}

.pagination input[type=submit] {
	background-color: #d0d0d0; /* 기존 #fff → 연회색 */
	border: 1px solid #ccc;
	padding: 6px 12px;
	margin: 0 4px;
	border-radius: 6px;
	cursor: pointer;
	color: #fff;
	transition: all 0.3s ease;
	margin-top: 10px;
}

.pagination input[type=submit]:hover {
	background-color: #d9ebff;
}

.pagination input[type=submit][style*="#5caeff"] {
	background-color: #5caeff !important;
	color: #fff !important;
	border: none !important;
}
</style>


</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/adminHeader2.jsp" />

	<!-- 컨텐츠 -->
	<div class="content">
		<h1>회원목록</h1>
		<div class="section-header">
			<h2>총 회원 수 : ${mUsersCount} 명</h2>
		</div>
		<table border="1">
			<thead>
				<tr>
					<td>no.</td>
					<td>ID</td>
					<td>이름</td>
					<td>성별</td>
					<td>생년월일</td>
					<td>신장</td>
					<td>체중</td>
					<td>주소</td>
					<td>E mail</td>
					<td>전화번호</td>
					<td>구독여부</td>
				</tr>
			<thead>
			<tbody>
				<c:forEach var="getallinfo" items="${usersLists}">
					<tr>
						<td>${getallinfo.user_no}</td>
						<td>${getallinfo.user_id}</td>
						<td>${getallinfo.user_name}</td>
						<td><c:choose>
								<c:when test="${getallinfo.gender == 0}">남</c:when>
								<c:when test="${getallinfo.gender == 1}">여</c:when>
								<c:otherwise></c:otherwise>
							</c:choose></td>
						<td>${getallinfo.birthday}</td>
						<td>${getallinfo.height}</td>
						<td>${getallinfo.weight}</td>
						<td>${getallinfo.address}</td>
						<td>${getallinfo.email}</td>
						<td>${getallinfo.phone}</td>
						<td><c:choose>
								<c:when test="${getallinfo.subscribe == true}">Y</c:when>
								<c:when test="${getallinfo.subscribe == false}">N</c:when>
								<c:otherwise></c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="paging">

			<div class="next">
				<!-- 처음으로 -->
				<form action="getUserList.do" method="post" style="display: inline-block; margin-right: 8px;">
					<input type="hidden" name="spage" value="1" /> <input type="submit" value="처음" class="page-btn" ${currentPage == 1 ? 'disabled' : ''} />
				</form>

				<!-- 이전 -->
				<form action="getUserList.do" method="post" style="display: inline-block; margin-right: 8px;">
					<input type="hidden" name="spage" value="${currentPage - 1}" /> <input type="submit" value="이전" class="page-btn" ${currentPage == 1 ? 'disabled' : ''} />
				</form>
			</div>

			<!-- 페이지 번호들 -->
			<div class="pagination">
				<c:forEach var="pageNum" items="${pageNumbers}">
					<form action="getUserList.do" method="post" style="display: inline-block;">
						<input type="hidden" name="spage" value="${pageNum}" /> <input type="submit" value="${pageNum}" style="${pageNum == currentPage ? 'background-color: #5caeff; color: white; ' : ''}" />
					</form>
				</c:forEach>
			</div>

			<div class="next">
				<!-- 다음 -->
				<form action="getUserList.do" method="post" style="display: inline-block; margin-left: 8px;">
					<input type="hidden" name="spage" value="${currentPage + 1}" /> <input type="submit" value="다음" class="page-btn" ${currentPage == totalPages ? 'disabled' : ''} />
				</form>

				<!-- 끝으로 -->
				<form action="getUserList.do" method="post" style="display: inline-block; margin-left: 8px;">
					<input type="hidden" name="spage" value="${totalPages}" /> <input type="submit" value="끝" class="page-btn" ${currentPage == totalPages ? 'disabled' : ''} />
				</form>
			</div>

		</div>

	</div>


	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
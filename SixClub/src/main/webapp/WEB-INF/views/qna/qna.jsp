<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - QnA</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	margin: 80px auto;
	background: #fff;
	padding: 40px 50px;
	border-radius: 16px;
	box-shadow: 0 10px 30px rgba(0, 123, 255, 0.1);
	animation: fadeIn 0.8s ease-in-out;
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
h1 {
	text-align: center;
	margin-bottom: 20px;
	color: #007acc;
	font-size: 28px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table th, table td {
	padding: 14px;
	border-bottom: 1px solid #e0e0e0;
}

table thead th {
	background-color: #e6f3ff;
	color: #007acc;
	font-weight: 600;
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

.write-button-wrapper {
	text-align: right;
	margin-bottom: 10px;
	margin-top: 20px; /* 위쪽 여백 추가 */
}

input[type=submit] {
	background-color: #5caeff;
	color: #fff;
	border: none;
	padding: 10px 18px;
	border-radius: 8px;
	cursor: pointer;
	font-weight: 600;
	transition: background-color 0.3s;
}

input[type=submit]:hover {
	background-color: #4096e0;
}

.button-row {
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
	<c:choose>
		<c:when test="${sessionScope.userNO != 99999 }">
			<jsp:include page="/WEB-INF/views/common/header.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="/WEB-INF/views/common/adminHeader2.jsp" />
		</c:otherwise>
	</c:choose>

	<!-- content -->
	<div class="content">
		<h1>Q&A 게시판</h1>
		<hr />

		<!-- 글쓰기 버튼 오른쪽 정렬 -->
		<c:if test="${sessionScope.userNO != 99999 }">
			<div class="write-button-wrapper">
				<form action="goWritePost.do" method="post">
					<input type="submit" value="글쓰기" />
				</form>
			</div>
		</c:if>

		<!-- 게시글 테이블 -->
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty postLists}">
					<c:forEach var="posts" items="${postLists}">
						<tr>
							<td style="text-align: center;">${posts.pid}</td>
							<td style="text-align: left;"><a href="showDetailPost.do?pid=${posts.pid}"> <c:choose>
										<c:when test="${posts.secret == 1 and sessionScope.userNO != posts.puser_no and sessionScope.userNO != 99999}">
										비밀글입니다 &#x1F512;
									</c:when>
										<c:otherwise>
										${posts.title} <c:if test="${not empty posts.attachment }">&#x1F4CE;</c:if> [${posts.commentCount }]  <c:if test="${posts.secret==1}">&#x1F512;</c:if>
										</c:otherwise>
									</c:choose>
							</a></td>
							<td style="text-align: center;">${posts.puser_id}<c:if test="${posts.subscribe }">
									<c:choose>
										<c:when test="${posts.monthBetween==1}">
											<img src="${pageContext.request.contextPath}/resources/img/bluelogo1.png" alt="1개월구독" height="20px" />
										</c:when>
										<c:when test="${posts.monthBetween==3}">
											<img src="${pageContext.request.contextPath}/resources/img/silverlogo1.png" alt="3개월구독" height="20px" />
										</c:when>
										<c:when test="${posts.monthBetween==6}">
											<img src="${pageContext.request.contextPath}/resources/img/goldlogo1.png" alt="6개월구독" height="20px" />
										</c:when>
										<c:otherwise>
											0
										</c:otherwise>
									</c:choose>
								</c:if></td>
							<td style="text-align: center;"><fmt:formatDate value="${posts.pd}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>

		<!-- 페이지네이션 -->
		<div class="button-row">
			<!-- 처음으로 -->
			<form action="goQna.do" method="post">
				<input type="hidden" name="spage" value="1" /> <input type="submit" value="처음" class="page-btn" ${currentPage == 1 ? 'disabled' : ''} />
			</form>

			<!-- 이전 -->
			<form action="goQna.do" method="post">
				<input type="hidden" name="spage" value="${currentPage - 1}" /> <input type="submit" value="이전" class="page-btn" ${currentPage == 1 ? 'disabled' : ''} />
			</form>

			<div class="pagination">
				<c:forEach var="pageNum" items="${pageNumbers}">
					<form action="goQna.do" method="post">
						<input type="hidden" name="spage" value="${pageNum}" /> <input type="submit" value="${pageNum}" style="${pageNum == currentPage ? 'background-color: #5caeff; color: white; border: none;' : ''}" />
					</form>
				</c:forEach>
			</div>

			<!-- 다음 -->
			<form action="goQna.do" method="post">
				<input type="hidden" name="spage" value="${currentPage + 1}" /> <input type="submit" value="다음" class="page-btn" ${currentPage == totalPages ? 'disabled' : ''} />
			</form>

			<!-- 끝으로 -->
			<form action="goQna.do" method="post">
				<input type="hidden" name="spage" value="${totalPages}" /> <input type="submit" value="끝" class="page-btn" ${currentPage == totalPages ? 'disabled' : ''} />
			</form>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

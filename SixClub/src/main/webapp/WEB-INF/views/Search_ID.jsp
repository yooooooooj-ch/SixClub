<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 아이디 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f8ff;
	margin: 0;
	padding: 0;
}

.content {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 85vh;
}

.card {
	background-color: white;
	padding: 40px 32px;
	border-radius: 24px;
	box-shadow: 0 10px 25px rgba(0, 123, 255, 0.1);
	width: 100%;
	max-width: 360px;
	text-align: center;
}

.card h2 {
	font-size: 24px;
	color: #2196f3;
	margin-bottom: 28px;
}

.card input[type="text"] {
	width: 100%;
	padding: 12px;
	margin: 8px 0;
	border: none;
	background-color: #f0f8ff;
	border-radius: 12px;
	font-size: 15px;
	box-shadow: inset 0 0 0 1px #d0e6f7;
	transition: all 0.2s ease;
}

.card input[type="text"]:focus {
	outline: none;
	box-shadow: inset 0 0 0 2px #66bfff;
	background-color: #ffffff;
}

.card input[type="submit"], .card .cancel-btn {
	width: 100%;
	padding: 14px;
	margin-top: 16px;
	font-size: 15px;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.3s ease;
}

.card input[type="submit"] {
	background-color: #a3d5ff;
	color: #004c99;
}

.card input[type="submit"]:hover {
	background-color: #89cfff;
}

.card .cancel-btn {
	background-color: #e0e0e0;
	color: #444;
	margin-top: 10px;
}

.card .cancel-btn:hover {
	background-color: #c8c8c8;
}

/* 알림 박스 */
.alert-box {
	margin-top: 20px;
	padding: 14px;
	background-color: #e3f2fd;
	color: #0d47a1;
	border-left: 4px solid #2196f3;
	border-radius: 10px;
	font-size: 14px;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 컨텐츠 -->
	<div class="content">
		<div class="card">
			<h2>아이디 찾기</h2>

			<form action="searchId.do" method="post">
				<input type="text" id="name" name="user_name" placeholder="이름" required>
				<input type="text" id="phone" name="phone" placeholder="전화번호" required>
				<input type="text" id="email" name="email" placeholder="이메일" required>
				<input type="submit" value="찾기">
			</form>

			<form action="login.do">
				<input type="submit" value="취소" class="cancel-btn">
			</form>

			<c:if test="${not empty msearchedID}">
				<div class="alert-box">
					<strong>${msearchedID}</strong>
				</div>
			</c:if>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

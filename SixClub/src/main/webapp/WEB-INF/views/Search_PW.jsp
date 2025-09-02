<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 비밀번호 찾기</title>
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

.card input[type="submit"], .card button[type="button"] {
	width: 100%;
	padding: 14px;
	margin-top: 12px;
	background-color: #a3d5ff;
	color: #004c99;
	font-weight: bold;
	border: none;
	border-radius: 20px;
	font-size: 15px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.card input[type="submit"]:hover, .card button[type="button"]:hover {
	background-color: #89cfff;
}

.cancel-btn {
	background-color: #e0e0e0 !important;
	color: #333 !important;
	margin-top: 12px;
}

.cancel-btn:hover {
	background-color: #cfcfcf !important;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 컨텐츠 -->
	<div class="content">
		<div class="card">
			<h2>비밀번호 찾기</h2>

			<c:if test="${not empty mcheck}">
				<script>
					alert('${mcheck}');
				</script>
			</c:if>

			<!-- 인증번호 요청 -->
			<form action="searchPw.do" method="post">
				<input type="text" id="id" name="user_id" value="${input_id}" placeholder="ID" required>
				<input type="text" id="name" name="user_name" value="${input_name}" placeholder="이름" required>
				<input type="text" id="phone" name="phone" value="${input_phone}" placeholder="전화번호" required>
				<input type="text" id="email" name="email" value="${input_email}" placeholder="이메일" required>
				<input type="submit" value="인증번호 받기">
			</form>

			<!-- 인증번호 확인 -->
			<form action="newPasswd.do" method="post">
				<input type="text" name="injeung_num" placeholder="인증번호" required>
				<input type="hidden" name="real_injeung_num" value="${minjeung_num}" />
				<input type="hidden" name="id" value="${input_id}" />
				<input type="submit" value="확인">
				<button type="button" onclick="getInjeung_num()">인증번호 재발급</button>
			</form>

			<!-- 로그인 페이지로 이동 -->
			<form action="login.do">
				<input type="submit" value="취소" class="cancel-btn">
			</form>

			<!-- 인증번호 재발급용 히든 폼 -->
			<form id="injeung_id_email_phone" action="/searchPw.do" method="post" style="display: none;">
				<input type="hidden" name="id">
				<input type="hidden" name="email">
				<input type="hidden" name="phone">
			</form>
		</div>
	</div>

	<!-- JS 함수 -->
	<script>
		function getInjeung_num() {
			var id = document.getElementById("id").value;
			var email = document.getElementById("email").value;
			var phone = document.getElementById("phone").value;

			var form = document.getElementById("injeung_id_email_phone");
			form.elements["id"].value = id;
			form.elements["email"].value = email;
			form.elements["phone"].value = phone;

			form.submit();
		}
	</script>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

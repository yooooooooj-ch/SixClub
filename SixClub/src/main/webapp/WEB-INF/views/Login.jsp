<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>로그인 - Six Club</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f8ff;
	color: #003366;
}

.content {
	max-width: 400px;
	margin: 100px auto;
	padding: 40px;
	background-color: #ffffff;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 136, 204, 0.15);
	text-align: center;
}

h1 {
	font-size: 2rem;
	color: #3399cc;
	margin-bottom: 30px;
}

.content form {
	text-align: left;
}

input[type="text"], input[type="password"] {
	width: 100%; /* 고정 width 제거 */
	padding: 12px;
	margin: 10px 0;
	border: 1px solid #cce7ff;
	border-radius: 10px;
	font-size: 1rem;
	background-color: #f9fcff;
	box-sizing: border-box;
}

.password-container {
	display: flex;
	align-items: center;
	width: 100%;
	gap: 8px;
}

.id {
	display: flex;
	align-items: center;
	width: 100%;
	gap: 8px;
}

.password-container input[type="password"] {
	flex: 1;
	margin: 10px 0;
}

#check {
	background: #ddeeff;
	color: #333;
	width: 60px; /* 보기 버튼 고정 폭 */
	padding: 8px 0;
	font-size: 0.8rem;
	border-radius: 8px;
	border: 1px solid #cce7ff;
	cursor: pointer;
	height: 42px;
}

#check:hover {
	background: #cce7ff;
}

.action-buttons {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

input[type="submit"] {
	background: #a3d5ff; /* 연한 파란색 */
	color: #003366;
	border: none;
	padding: 10px 24px;
	border-radius: 20px;
	font-size: 1rem;
	cursor: pointer;
	transition: all 0.3s ease;
}

input[type="submit"]:hover {
	background: #87c9ff;
}

.secondary-buttons {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin-top: 20px;
	font-size: 0.95rem;
}

.secondary-buttons a {
	color: #3399cc;
	text-decoration: none;
}

.secondary-buttons a:hover {
	text-decoration: underline;
}

.transparent-button {
    width: 60px;         /* '보기' 버튼과 동일한 폭 */
    height: 42px;        /* 높이도 맞춰야 줄 정렬됨 */
    background: transparent;
    border: none;
    color: transparent;
    cursor: default;     /* 클릭 불가능하게 */
    pointer-events: none; /* 마우스 이벤트도 차단 */
}
</style>
<!-- 비밀번호 토글 버튼으로 숨김/보기 -->
<script>
	function togglePassword() {
		const pwInput = document.getElementById("pw");
		const check = document.getElementById("check");

		if (pwInput.type === "password") {
			pwInput.type = "text";
			check.textContent = "숨김";
		} else {
			pwInput.type = "password";
			check.textContent = "보기";
		}
	}
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body style="background-color:#f0f8ff;">
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- main content -->
	<div class="content">
		<h1>로그인</h1>

		<!-- 에러 메시지 출력 -->
		<c:if test="${not empty msg}">
			<script>
				alert('${msg}');
			</script>
		</c:if>

		<form action="verify.do" method="post">

			<div class="id">
				<input type="text" name="id" placeholder="아이디" required><br>
				  <button class="transparent-button" disabled>보기</button>
			</div>
			<div class="password-container">
				<input type="password" id="pw" name="pw" placeholder="비밀번호" required>
				<div class="see">
					<button type="button" id="check" onclick="togglePassword()" >보기</button>
				</div>
			</div>

			<!-- 로그인 버튼 단독 -->
			<div class="action-buttons">
				<input type="submit" value="로그인">
			</div>

			<!-- 회원가입 + 아이디찾기 + 비밀번호찾기 링크들 -->
			<div class="secondary-buttons">
				<a href="gaip.do">회원가입</a> <a href="search_ID.do">아이디 찾기</a> <a href="search_PW.do?back=noback">비밀번호 찾기</a>
			</div>

		</form>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

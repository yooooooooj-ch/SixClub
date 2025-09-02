<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Six Club - 비밀번호 다시 설정하기</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
	<style>
		body {
			font-family: 'Noto Sans KR', sans-serif;
			background-color: #f0f8ff;
			margin: 0;
			padding: 0;
			color: #333;
		}
		.content {
			max-width: 460px;
			margin: 100px auto;
			background-color: #ffffff;
			padding: 40px 30px;
			border-radius: 16px;
			box-shadow: 0 10px 30px rgba(0, 123, 255, 0.1);
		}
		.tti {
			text-align: center;
			color: #007acc;
			margin-bottom: 30px;
			text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
		}
		label {
			display: block;
			margin-bottom: 8px;
			font-weight: bold;
			color: #333;
		}
		.input-group {
			margin-bottom: 20px;
		}
		.input-wrapper {
			display: flex;
			align-items: center;
			border: 1px solid #ccc;
			border-radius: 8px;
			overflow: hidden;
			background-color: white;
		}
		.input-wrapper input {
			flex: 1;
			border: none;
			outline: none;
			padding: 12px;
			font-size: 15px;
			background: transparent;
		}
		.input-wrapper button {
			background-color: #eaeaea;
			border: none;
			border-left: 1px solid #ccc;
			padding: 12px 16px;
			font-size: 0.85rem;
			cursor: pointer;
			height: 100%;
			color: #333;
		}
		.buttons {
			display: flex;
			justify-content: space-between;
			margin-top: 30px;
		}
		input[type="submit"], button[type="button"] {
			padding: 12px 20px;
			font-size: 15px;
			border: none;
			border-radius: 8px;
			cursor: pointer;
			font-weight: bold;
		}
		input[type="submit"] {
			background-color: #6fbaff;
			color: #ffffff;
			transition: background-color 0.3s;
		}
		input[type="submit"]:hover {
			background-color: #4aa3f8;
		}
		button[type="button"] {
			background-color: #f0f0f0;
			color: #333;
		}
		button[type="button"]:hover {
			background-color: #ddd;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="content">
		<h2 class="tti">비밀번호 재설정</h2>

		<c:if test="${not empty msg}">
			<script>alert('${msg}');</script>
		</c:if>

		<form id="resetForm" action="update_pw.do" method="post">
			<div class="input-group">
				<label for="passwd">새로운 비밀번호</label>
				<div class="input-wrapper">
					<input type="password" id="passwd" name="passwd" required>
					<button type="button" class="toggle-btn" data-target="passwd">보기</button>
				</div>
			</div>

			<div class="input-group">
				<label for="pw_re">비밀번호 확인</label>
				<div class="input-wrapper">
					<input type="password" id="pw_re" name="pw_re" required>
					<button type="button" class="toggle-btn" data-target="pw_re">보기</button>
				</div>
			</div>

			<input type="hidden" name="user_id" value="${userId}" />
			<input type="hidden" name="back" id="back" value="${back}" />

			<div class="buttons">
				<input type="submit" value="수정 완료">
				<button type="button" id="cancelBtn">취소</button>
			</div>
		</form>
	</div>

	<script>
		// 비밀번호 보기/숨기기
		document.querySelectorAll('.toggle-btn').forEach(btn => {
			btn.addEventListener('click', () => {
				const input = document.getElementById(btn.dataset.target);
				if (input.type === 'password') {
					input.type = 'text';
					btn.textContent = '숨김';
				} else {
					input.type = 'password';
					btn.textContent = '보기';
				}
			});
		});

		// 취소 버튼 클릭 시 동작
		document.getElementById('cancelBtn').addEventListener('click', () => {
			const back = document.getElementById('back').value;
			const form = document.createElement('form');
			form.action = (back === 'back') ? 'updateUser.do' : 'login.do';

			const hidden = document.createElement('input');
			hidden.type = 'hidden';
			hidden.name = 'back';
			hidden.value = back;
			form.appendChild(hidden);

			document.body.appendChild(form);
			form.submit();
		});
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

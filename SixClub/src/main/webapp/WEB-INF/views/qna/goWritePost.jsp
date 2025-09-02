<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 문의글 작성하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f8ff;
	margin: 0;
	padding: 0;
}

.content {
	max-width: 800px;
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
	color: #007acc;
	font-size: 26px;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

td {
	padding: 12px 0;
}

input[type=text], textarea {
	width: 100%;
	padding: 12px 14px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 15px;
	box-sizing: border-box;
	background-color: #fdfdfd;
	transition: border-color 0.3s;
}

input[type=text]:focus, textarea:focus {
	outline: none;
	border-color: #5caeff;
	background-color: #fff;
}

textarea {
	resize: none;
	height: 160px;
	white-space: pre-wrap; /* 줄바꿈 유지, 공백 무시하지 않음 */
	word-break: break-word;
}

input[type=button] {
	background-color: #5caeff;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 14px;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s;
}

input[type=button]:hover {
	background-color: #4096e0;
}

.button-row-fixed {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 30px;
}

.left-button, .right-button {
	width: 48%;
}

.left-button {
	text-align: left;
}

.right-button {
	text-align: right;
}

label {
	font-size: 14px;
	color: #333;
}

strong {
	display: block;
	font-size: 15px;
	color: #444;
	margin-top: 8px;
}

.file-input-wrapper {
	display: flex;
	align-items: center;
	gap: 10px;
}

.file-input {
	display: none;
}

.custom-file-label {
	display: inline-block;
	background-color: #5caeff;
	color: white;
	padding: 8px 16px;
	border-radius: 8px;
	cursor: pointer;
	font-size: 14px;
}

.file-name-display {
	font-size: 14px;
	color: #444;
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
			<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
		</c:otherwise>
	</c:choose>

	<!-- content -->
	<div class="content">
		<c:if test="${not empty msg}">
			<script>
				alert("${msg}");
			</script>
		</c:if>

		<h1>게시글 작성</h1>
		<hr />

		<form id="myForm" method="post" enctype="multipart/form-data">
			<!-- 입력 폼 -->
			<table>
			<tr>
					<td><label> <input type="checkbox" name="secret" value="1" ${post.secret == 1 ? "checked" : ""} /> 비밀글 설정
					</label></td>
				</tr>
				<tr>
					<td><input type="text" name="title" placeholder="제목을 입력하세요" value="${post.title }" /></td>
				</tr>

				

				<tr>
					<td>
						<div class="file-input-wrapper">
							<!-- 숨겨진 실제 input -->
							<input type="file" id="fileInput" name="attachment" class="file-input" onchange="updateFileName(this)" />

							<!-- 커스텀 버튼 -->
							<label for="fileInput" class="custom-file-label">파일 선택</label>

							<!-- 파일명 표시 영역 -->
							<span id="fileName" class="file-name-display"> <c:if test="${not empty post.attachment}">
                    			${post.attachment}
                			</c:if>
							</span>
						</div>
					</td>
				</tr>

				<tr>
					<td><textarea name="pcontents" placeholder="게시글 내용을 입력하세요">${post.pcontents}</textarea></td>
				</tr>


			</table>

			<!-- 버튼 영역 -->
			<div class="button-row-fixed">
				<div class="left-button">
					<input type="button" value="모두보기" onclick="submitTo('goQna.do')" />
				</div>
				<div class="right-button">
					<c:choose>
						<c:when test="${empty post.pid or post.pid == 0}">
							<input type="button" id="writebtn" value="작성하기" onclick="submitTo('insertPost.do')" />
						</c:when>
						<c:otherwise>
							<input type="hidden" name="pid" value="${post.pid}" />
							<input type="button" id="updatebtn" value="수정하기" onclick="submitTo('updatePost.do')" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</form>

		<script>
			function submitTo(actionUrl) {
				const form = document.getElementById('myForm');
				form.action = actionUrl;
				form.submit();
			}
			function updateFileName(input) {
				const fileNameSpan = document.getElementById("fileName");
				const fileName = input.files.length > 0 ? input.files[0].name : "";
				fileNameSpan.textContent = fileName;
			}
		</script>

	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

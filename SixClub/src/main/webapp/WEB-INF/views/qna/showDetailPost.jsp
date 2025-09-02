<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 문의글 상세보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f0f8ff;
	margin: 0;
	padding: 0;
}

table {
	width: 100%;
	margin: 40px auto;
	border-collapse: collapse;
}

.post-card {
	background-color: #ffffff;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	border-radius: 12px;
	padding: 25px;
	margin: 0 auto 30px auto;
	width: 100%;
	max-width: 900px;
}

.post-card h2 {
	margin: 0;
	font-size: 1.5em;
	color: #222;
}

.post-content-box {
	margin-top: 15px;
	border: 1px solid #ddd;
	background-color: #f9f9f9;
	padding: 15px;
	border-radius: 8px;
	line-height: 1.6;
	color: #333;
	white-space: normal;
}

.comment-section {
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
	padding: 20px;
	margin: 40px auto;
	width: 100%;
	max-width: 900px;
}

.comment-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.comment-header h3 {
	margin: 0;
	font-size: 1.2em;
}

.single-comment, .reply-comment {
	display: flex;
	align-items: flex-start;
	padding: 15px;
	border: 1px solid #ddd;
	border-radius: 10px;
	margin-bottom: 15px;
	position: relative;
	background-color: #fff;
}

.reply-comment {
	margin-left: 50px;
	background-color: #f9fbff;
	border-left: 4px solid #a5c9f1;
}

.comment-profile {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: transparent;
	margin-right: 15px;
	flex-shrink: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.comment-profile svg {
	width: 24px;
	height: 24px;
	fill: #999;
}

.comment-body {
	flex-grow: 1;
}

.comment-meta {
	font-weight: bold;
	font-size: 0.95em;
	color: #333;
	margin-bottom: 3px;
}

.comment-time {
	font-size: 0.8em;
	color: #aaa;
	margin-left: 5px;
	font-weight: normal;
}

.comment-content {
	margin-top: 8px;
	font-size: 0.95em;
	color: #222;
	line-height: 1.6;
}

.comment-actions {
	position: absolute;
	top: 12px;
	right: 15px;
	display: flex;
	gap: 10px;
	font-size: 0.9em;
}

.comment-actions button {
	background: none;
	border: none;
	color: #555;
	font-weight: 600;
	cursor: pointer;
}

.comment-actions button:hover {
	color: #a5c9f1;
	text-decoration: underline;
}

.reply-link {
	margin-top: 8px;
	font-size: 0.9em;
}

.reply-link a {
	color: #555;
	font-weight: 600;
	text-decoration: none;
}

.reply-link a:hover {
	color: #a5c9f1;
	text-decoration: underline;
}

.comment-form {
	margin-top: 30px;
}

.comment-form textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 8px;
	resize: none;
	font-size: 1em;
	box-sizing: border-box;
}

.comment-form input[type="submit"] {
	margin-top: 10px;
	padding: 8px 16px;
	background-color: #a5c9f1;
	color: #fff;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.comment-form input[type="submit"]:hover {
	background-color: #d4e7f9;
	color: #000;
}

.reply-comment input[type="submit"] {
	background: none;
	border: none;
	color: #555;
	font-size: 0.95em;
	font-weight: 600;
	cursor: pointer;
	padding: 0;
	margin-top: 5px;
}

.reply-comment input[type="submit"]:hover {
	color: #a5c9f1;
	text-decoration: underline;
}

.delete-form {
	display: inline;
}

.btn-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	max-width: 900px;
	margin: 40px auto 20px auto;
	box-sizing: border-box;
	padding: 0 25px;
}

.btn-left, .btn-right {
	display: flex;
	align-items: center;
	gap: 12px;
}

.button-link {
	padding: 8px 16px;
	border: none;
	border-radius: 6px;
	background-color: #a5c9f1;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.button-link:hover {
	background-color: #7fb0e0;
}

.attachment-line {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	gap: 6px;
	margin-bottom: 10px;
	border-bottom: 1px solid #ddd;
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

	<div class="content">
		<c:if test="${not empty msg}">
			<script>alert("${msg}");</script>
		</c:if>

		<form id="myForm" method="post">
			<div class="btn-row">
				<div class="btn-left">
					<button type="button" class="button-link" onclick="submitTo('goQna.do'); document.getElementById('myForm').submit();">모두보기</button>
				</div>
				<div class="btn-right">
					<c:if test="${sessionScope.userNO != 99999 }">
						<button type="button" class="button-link" onclick="submitTo('goWritePost.do'); document.getElementById('myForm').submit();">글쓰기</button>
					</c:if>
					<c:if test="${owner}">
						<button type="button" class="button-link" onclick="submitTo('goWritePost.do?pid=${post.pid}'); document.getElementById('myForm').submit();">수정하기</button>
						<button type="button" class="button-link" onclick="if(confirm('정말 삭제하시겠습니까?')) { submitTo('deletePost.do?pid=${post.pid}'); document.getElementById('myForm').submit(); }">삭제하기</button>
					</c:if>
				</div>
			</div>
		</form>
	</div>


	<!-- 게시글 -->
	<div class="post-card">
		<h2>${post.title}
			<c:if test="${post.secret==1}">&#x1F512;</c:if>
		</h2>
		<div class="comment-meta" style="display: flex; align-items: center;">
			<div class="comment-profile" style="width: 28px; height: 28px;">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="margin-right: -5px;">
            <path d="M12 12c2.67 0 8 1.34 8 4v2H4v-2c0-2.66 5.33-4 8-4zm0-2a4 4 0 1 1 0-8 4 4 0 0 1 0 8z" />
        </svg>
			</div>
			<span style="margin-left: -10px; margin-right:5px;">${post.puser_id}</span>
			<span class="comment-time">
				|
				<fmt:formatDate value="${post.pd}" pattern="yyyy-MM-dd HH:mm:ss" />
			</span>
		</div>
		<div class="post-content-box">
			<c:if test="${not empty post.attachment }">
				<div class="attachment-line">
					<span>&#x1F4CE;</span> <a href="${pageContext.request.contextPath}/downloadFile?filename=${post.attachment}"> ${post.attachment} </a>
				</div>
			</c:if>
			<c:out value="${post.pcontentsWithBr}" escapeXml="false" />

		</div>
	</div>


	<!-- 댓글 -->
	<div class="comment-section">
		<div class="comment-header">
			<h3>댓글 [${post.commentCount }]</h3>

		</div>

		<c:forEach var="comment" items="${comments}">
			<div class="${comment.ccid == null ? 'single-comment' : 'reply-comment'}">
				<div class="comment-profile">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
						<path d="M12 12c2.67 0 8 1.34 8 4v2H4v-2c0-2.66 5.33-4 8-4zm0-2a4 4 0 1 1 0-8 4 4 0 0 1 0 8z" />
					</svg>
				</div>
				<div class="comment-body">
					<div class="comment-meta">
						${comment.cuser_id} <span class="comment-time"> | <fmt:formatDate value="${comment.cd}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
					</div>
					<div class="comment-content">
						<c:out value="${comment.ccontentsWithBr}" escapeXml="false" />
					</div>
					<c:if test="${comment.ccid == null}">
						<div class="reply-link">
							<a href="javascript:void(0)" onclick="showReplyForm(${comment.cid})">[ 답글쓰기 ]</a>
						</div>
					</c:if>
					<div class="comment-actions">
						<c:if test="${comment.isOwner}">
							<form action="deleteComment.do" method="post" class="delete-form">
								<input type="hidden" name="cid" value="${comment.cid}" /> <input type="hidden" name="pid" value="${post.pid}" />
								<button type="submit">[ 댓글삭제 ]</button>
							</form>
						</c:if>
					</div>
				</div>
			</div>

			<c:if test="${comment.ccid == null}">
				<div id="replyForm-${comment.cid}" class="reply-comment" style="display: none;">
					<div class="comment-profile">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
							<path d="M12 12c2.67 0 8 1.34 8 4v2H4v-2c0-2.66 5.33-4 8-4zm0-2a4 4 0 1 1 0-8 4 4 0 0 1 0 8z" />
						</svg>
					</div>
					<div class="comment-body">
						<form action="insertComment.do" method="post" class="comment-form">
							<textarea name="ccontents" rows="3" placeholder="답글을 입력하세요"></textarea>
							<input type="hidden" name="pid" value="${post.pid}" /> <input type="hidden" name="ccid" value="${comment.cid}" /> <input type="submit" value="[ 답글쓰기 ]" />
						</form>
					</div>
				</div>
			</c:if>
		</c:forEach>

		<!-- 댓글 입력창 -->
		<div class="comment-form">
			<form action="insertComment.do" method="post">
				<textarea name="ccontents" rows="4" placeholder="댓글을 작성해 주세요"></textarea>
				<input type="hidden" name="pid" value="${post.pid}" /> <input type="hidden" name="ccid" value="0" /> <input type="submit" value="등록" />
			</form>
		</div>
	</div>

	<script>
		function submitTo(actionUrl) {
			const form = document.getElementById('myForm');
			form.action = actionUrl;
		}

		function showReplyForm(commentId) {
			const form = document.getElementById("replyForm-" + commentId);
			form.style.display = (form.style.display === "none") ? "flex" : "none";
		}
	</script>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

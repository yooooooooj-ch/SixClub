<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 운동 편집</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f8ff;
	margin: 0;
	padding: 0;
}

.content {
	max-width: 1000px;
	margin: 40px auto;
	padding: 20px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.btn-group {
	display: flex;
	justify-content: flex-start;
	gap: 10px;
	margin-top: 20px;
}

.btn-group input[type="submit"]:last-child {
	margin-left: auto;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #007bff;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

table thead {
	background-color: #007bff;
	color: white;
}

table th, table td {
	padding: 12px;
	text-align: center;
	border: 1px solid #dee2e6;
}

table tbody tr:nth-child(even) {
	background-color: #f1f3f5;
}

select, input[type="text"] {
	padding: 8px;
	border-radius: 5px;
	border: 1px solid #ced4da;
	width: 90%;
	font-size: 14px;
}

input[type="submit"] {
	padding: 10px 20px;
	margin-right: 10px;
	border: none;
	border-radius: 5px;
	background-color: #007bff;
	color: white;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/adminHeader2.jsp" />

	<!-- 컨텐츠 -->
	<div class="content">
		<br>
		<form method="post" action="workoutAction.do">
			<table border="1">
				<thead>
					<tr>
						<th>운동 No</th>
						<th>운동 타입</th>
						<th>운동 이름</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="wo" items="${workout}">
						<tr>
							<td>${wo.woNo}<input type="hidden" name="woNo" value="${wo.woNo}" />
							</td>
							<td>
								<select id="woType" name="woType" required>
									<option value="">-- 선택하세요 --</option>
									<option value="0">인터벌</option>
									<option value="1">가슴운동</option>
									<option value="2">등운동</option>
									<option value="3">어깨운동</option>
									<option value="4">다리운동</option>
									<option value="5">이두운동</option>
									<option value="6">삼두운동</option>
								</select>
							</td>
							<td>
								<input type="text" name="woName" value="${wo.woName}">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<div class="btn-group">
				<input type="submit" name="action" value="수정하기">
				<input type="submit" name="action" value="삭제하기">
			</div>

		</form>
	</div>


	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
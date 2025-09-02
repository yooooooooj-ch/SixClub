<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 운동 관리</title>
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
	max-width: 900px;
	margin: 0 auto;
	padding: 40px 20px;
	font-family: 'Pretendard', sans-serif;
	color: #333;
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

table thead {
	background-color: #f5f7fa;
}

table th, table td {
	text-align: center;
	padding: 14px 12px;
	border-bottom: 1px solid #eee;
	font-size: 15px;
}

table th {
	color: #555;
	font-weight: 600;
}

table td a {
	color: #4A90E2;
	text-decoration: none;
}

table td a:hover {
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
	margin-top: 60px;
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

/* 페이지네이션 */
.pagination {
	display: flex;
	justify-content: center;
	gap: 8px;
	margin: 30px 0;
	flex-wrap: wrap;
}

.pagination a, .pagination strong {
	display: inline-block;
	padding: 8px 14px;
	border-radius: 6px;
	font-size: 14px;
	text-decoration: none;
}

.pagination a {
	background-color: #f0f0f0;
	color: #4A90E2;
	transition: background-color 0.2s;
}

.pagination a:hover {
	background-color: #e0e0e0;
}

.pagination strong {
	background-color: #4A90E2;
	color: white;
	font-weight: 600;
}

.search-form {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 20px;
	flex-wrap: wrap;
}

.search-form label {
	font-weight: 500;
	font-size: 15px;
	color: #333;
}

.search-form select {
	padding: 8px 12px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
	background-color: #fff;
	transition: border-color 0.3s;
}

.search-form select:focus {
	border-color: #4A90E2;
	outline: none;
}

.search-form button {
	background-color: #4A90E2;
	color: white;
	padding: 10px 18px;
	border: none;
	border-radius: 6px;
	font-size: 14px;
	font-weight: 300;
	cursor: pointer;
	transition: background-color 0.3s;
}

.search-form button:hover {
	background-color: #357ABD;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/adminHeader2.jsp" />

	<!-- 컨텐츠 -->
	<div class="content" style="max-width: 900px; margin: 0 auto; padding: 20px;">
		<h1>운동목록/장비목록 관리</h1>

		<div class="section-header">
			<h2>운동 목록</h2>
			<form action="insertAction.do" method="post">
				<input type="submit" name="action" value="운동추가하기">
			</form>
		</div>

		<!-- 운동 타입 검색 폼 -->
		<form method="get" action="goRoutineEdit.do" class="search-form"">
			<input type="hidden" name="equipPage" value="${equipPage}" />
			<label for="woType">운동 타입 선택:</label>
			<select name="woType" id="woType">
				<option value="">전체</option>
				<option value="0" ${selectedWoType == 0 ? "selected" : ""}>인터벌</option>
				<option value="1" ${selectedWoType == 1 ? "selected" : ""}>가슴운동</option>
				<option value="2" ${selectedWoType == 2 ? "selected" : ""}>등운동</option>
				<option value="3" ${selectedWoType == 3 ? "selected" : ""}>어깨운동</option>
				<option value="4" ${selectedWoType == 4 ? "selected" : ""}>다리운동</option>
				<option value="5" ${selectedWoType == 5 ? "selected" : ""}>이두운동</option>
				<option value="6" ${selectedWoType == 6 ? "selected" : ""}>삼두운동</option>
			</select>
			<button type="submit">검색</button>
		</form>

		<table border="1">
			<thead>
				<tr>
					<th>운동 No</th>
					<th>운동 타입</th>
					<th>운동 이름</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="wo" items="${pagedWorkout}">
					<tr>
						<td>${wo.woNo}</td>
						<td>${wo.woType}</td>
						<td>
							<a href="workoutEdit.do?woNo=${wo.woNo}">
								<b>${wo.woName}</b>
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagination">
			<c:forEach var="i" begin="1" end="${totalWorkoutPages}">
				<c:choose>
					<c:when test="${i == workoutPage}">
						<strong>${i}</strong>
					</c:when>
					<c:otherwise>
						<c:if test="${not empty selectedWoType}">
							<a href="?workoutPage=${i}&equipPage=${equipPage}&woType=${selectedWoType}">${i}</a>
						</c:if>
						<c:if test="${empty selectedWoType}">
							<a href="?workoutPage=${i}&equipPage=${equipPage}">${i}</a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>


		<br>
		<br>
		<br>
		<hr>
		<br>
		<br>
		<br>



		<div class="section-header">
			<h2>장비 목록</h2>
			<form action="insertAction.do" method="post">
				<input type="submit" name="action" value="장비추가하기">
			</form>
		</div>

		<table border="1">
			<thead>
				<tr>
					<th>장비 ID</th>
					<th>장비 이름</th>
					<th>장비 설명</th>
					<th>장비 이미지</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="eqi" items="${pagedEquip}">
					<tr>
						<td>${eqi.equip_no}</td>
						<td>
							<a href="equipEdit.do?equip_no=${eqi.equip_no}">
								<b>${eqi.equip_name}</b>
							</a>
						</td>
						<td>${eqi.equip_desc}</td>
						<td>
							<img src="/sixclub${eqi.equip_img}" width="100" alt="${eqi.equip_name}">
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagination">
			<c:forEach var="i" begin="1" end="${totalEquipPages}">
				<c:choose>
					<c:when test="${i == equipPage}">
						<strong>${i}</strong>
					</c:when>
					<c:otherwise>
						<a href="?workoutPage=${workoutPage}&equipPage=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>


	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/sidebar.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//비밀번호,비밀번호 확인 일치 확인을 위한 코드
	function validatePassword() {
		const password = document.getElementById("passwd").value;
		const PasswordCheck = document.getElementById("passwdcheck").value;

		if (password === PasswordCheck) {
			return true; // 비밀번호가 일치하면 폼 제출
		} else {
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			return false; // 비밀번호가 일치하지 않으면 폼 제출 중단
		}
	}

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>

<style>
body {
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f8ff;
	color: #222;
}
/* 메인 레이아웃 */
.container {
	display: flex;
	min-height: 100vh;
	box-sizing: border-box;
	/* ==================================================== */
	max-width: 1100px; /* 컨텐츠 최대 너비 제한 */
	margin: 0 auto 0 200px; /* 좌우 자동 마진으로 화면 중앙에 배치 */
	padding: 0 20px; /* 좌우 약간 패딩 */
}

.content-area {
	flex: 1;
	display: flex;
	margin: 0 auto 0 auto;
	flex-direction: column;
	align-items: center;
	background-color: #f0f8ff;
	margin-left:100px;
	
}

.page-title {
	font-size: 26px;
	font-weight: 700;
	margin: 40px 0 30px 0;
	color: #007fff;
	text-align: center;
	width: 100%;

}

.profile-form {
	background-color: #ffffff;
	border-radius: 16px;
	padding: 30px;
	box-shadow: 0 2px 8px rgba(0, 102, 204, 0.08);
	max-width: 800px;
	width: 100%;
	display: flex;
	justify-content: center;
	flex-direction: column; /* 세로 정렬 */
}


/* form-input을 중앙 정렬 */
.form-input {
	max-width: 300px;
	width: 100%;
	margin: 0 auto; /* ✅ input은 중앙 정렬 */
	box-sizing: border-box;
	border: 1.5px solid #99ccff;
	border-radius: 12px;
	background-color: #f4faff;
	font-size: 14px;
	padding: 10px 12px;
	transition: border-color 0.2s ease, box-shadow 0.2s ease;
	
}
.profile-form .form-row {
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
}

.profile-form .form-row label {
	font-weight: 500;
	color: #003366;
	text-align: left;
	margin-left: 70px;
	width: 100px;
}

.profile-form .form-row input {
	max-width: 220px;
	width: 100%;
	box-sizing: border-box;
	border: 1.5px solid #99ccff;
	border-radius: 12px;
	background-color: #f4faff;
	font-size: 14px;
	padding: 10px 12px;
	transition: border-color 0.2s ease, box-shadow 0.2s ease;
	margin-left: auto; 
	margin-right: 80px; 
}

.profile-form .form-row input:focus {
	border-color: #3399ff;
	box-shadow: 0 0 0 2px rgba(0, 102, 204, 0.2);
	outline: none;
}



.btn-row {
  text-align: center;
}
.btn-row input[type="submit"],
.btn-row input[type="button"] {
	padding: 10px 22px;
	border: none;
	border-radius: 8px;
	background-color: #66bfff;
	color: white;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.2s ease;
	margin-top: 5px;
	display: inline-block;

}

.btn-row input[type="submit"]:hover {
	background-color: #3399ff;
}
.btn-row input[type="button"]:hover {
	background-color: #3399ff;
}

.main-content {
	flex: 1;
	padding-left: 40px;
}

.welcome-box {
	border: 1px solid #cce4ff;
	border-radius: 12px;
	padding: 20px;
	margin-bottom: 30px;
	background-color: #eaf6ff;
}

.button-container {
	display: flex;
	justify-content: flex-end; /* 오른쪽 정렬 */
	gap: 10px; /* 버튼 사이 간격 */
	margin-bottom: 10px;
}

.button-container form {
	margin: 0; /* 기본 form margin 제거 */
}

.button-container input[type="submit"] ,
.button-container input[type="button"] {
	padding: 4px;
	border: none;
	border-radius: 8px;
	background-color: #66bfff;
	color: white;
	cursor: pointer;
	transition: background-color 0.2s ease;
	margin-top: 5px;
	display: inline-block;
	font-size: 12px;
	width: 80px;
	box-sizing: border-box;
}




</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="container">

		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

		<!-- ✅ 콘텐츠 영역 -->
		<div class="main-content">
			<div class="content-area">
				<h1 class="page-title">프로필 관리😊</h1>

				<div class="profile-form">

					<div class="button-container">
						<form action="NewPasswdMy.do">
							<input type="hidden" name="mid" value="${user.user_id}">
							<input type="submit" value="비밀번호 수정" />
						</form>

						<form action="deleteUser.do" method="post">
							<input type="hidden" name="userid" value="${user.user_id}" /> <input
								type="submit" value="회원 탈퇴" />
						</form>
						<br>
					</div>
					<div style="clear: both;"></div>

					
					
						<form action="updateUserInfo.do" method="post" onsubmit="return validatePassword();">
							<p style="font-size: 20px; color: #555; margin-left: 90px; margin-top: 0px; margin-bottom: 25px; display: flex; align-items: center; gap: 10px;">
								<c:choose>
									<c:when test="${monthBetween==1}">
										<img
											src="${pageContext.request.contextPath}/resources/img/bluelogo1.png"
											alt="1개월구독" style="width: 60px; height: auto;" />
									</c:when>
									<c:when test="${monthBetween==3}">
										<img
											src="${pageContext.request.contextPath}/resources/img/silverlogo1.png"
											alt="3개월구독" style="width: 60px; height: auto;" />
									</c:when>
									<c:when test="${monthBetween==6}">
										<img
											src="${pageContext.request.contextPath}/resources/img/goldlogo1.png"
											alt="6개월구독" style="width: 60px; height: auto;" />
									</c:when>
									<c:otherwise>
										<img
											src="${pageContext.request.contextPath}/resources/img/user.png"
											alt="프로필 사진"
											style="width: 60px; height: 60px; border-radius: 10%; object-fit: cover; border: none;">
									</c:otherwise>
								</c:choose>
								${user.user_name}님 환영합니다
							</p>

							<div class="form-row">
								<label for="height">키</label> 
								<input type="text" name="height" id="height" value="${user.height}" class="form-input" required />
							</div>
							<div class="form-row">
								<label for="weight">몸무게</label> 
								<input type="text" name="weight" id="weight" value="${user.weight}" class="form-input" required />
							</div>
							<div class="form-row">
								<label for="email">이메일</label>
								<input type="email" name="email" id="email" value="${user.email}" class="form-input" required />
							</div>
							<div class="form-row" style="margin-bottom: 1px; flex-direction: row; align-items: center; gap: 10px;">
								<label for="sample6_postcode">우편번호</label> 
								<input type="text" id="sample6_postcode" placeholder="우편번호" class="form-input">	
							</div>
								<div class="button-container" style="margin-right:80px;">
								   <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" >
								</div>
							
							<div class="form-row" style="margin-bottom: 5px;">	
								<label for="sample6_address">주소</label> 								
								<input type="text" id="sample6_address" name="address" placeholder="주소" value="${user.address}" class="form-input">
							</div>
							<div class="form-row" style="flex-direction: column;margin-right: 80px;gap: 5px;">		
								<input type="text" id="sample6_detailAddress" placeholder="상세주소" class="form-input">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-input">
							</div>
							<div class="form-row">
								<label for="phone">전화번호</label> 
								<input type="tel" name="phone" id="phone" value="${user.phone}" class="form-input" required />
							</div>
							
							<div class="btn-row">
								<input type="hidden" name="userid" value="${user.user_id}" />
								<input type="submit" value="정보 수정" />
								<input type="button" value="뒤로가기" onclick="location.href='myPage.do'" />
							</div>
						</form>
						
				</div>
				<!-- /.profile-form -->
			</div>
			<!-- /.content-area -->
		</div>
		<!-- /.main-content -->
		</div>
	
	</div>	
	<!-- ✅ .container 닫기 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />


</body>
</html>
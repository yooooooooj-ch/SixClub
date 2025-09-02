<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f8ff;
	color: #003366;
}

.content {
	max-width: 500px;
	margin: 60px auto;
	padding: 40px;
	background-color: #ffffff;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 136, 204, 0.15);
}

.content h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #005599;
	font-size: 1.8rem;
}

form label {
	font-weight: bold;
	display: block;
	margin-top: 12px;
	margin-bottom: 4px;
}

.input-group {
	display: flex;
	align-items: center;
	gap: 8px;
}

.content input[type="text"], .content input[type="password"], .content input[type="email"],
	.content input[type="date"], .content input[type="number"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #cce7ff;
	border-radius: 10px;
	background-color: #f9fcff;
	font-size: 1rem;
	box-sizing: border-box;
}

button, input[type="submit"], input[type="reset"], input[type="button"]
	{
	background-color: #d0eaff;
	color: #003366;
	border: none;
	padding: 8px 12px;
	border-radius: 8px;
	font-size: 0.85rem;
	cursor: pointer;
	transition: background-color 0.3s ease;
	white-space: nowrap;
}

button:hover, input[type="submit"]:hover, input[type="reset"]:hover,
	input[type="button"]:hover {
	background-color: #b3dbff;
}

#checkResult {
	color: #cc0000;
	font-size: 0.85rem;
	margin-top: 5px;
}

input::placeholder {
	color: #aabbd1;
}

.radio-group {
	margin-top: 8px;
}

.address-group input {
	margin-top: 8px;
}
</style>
<script>
    $(function() {
        $("#birth").datepicker({
            dateFormat: "yyyy-mm-dd"  // 원하는 날짜 형식
        });
    });
    
    
    //비밀번호 토글 버튼으로 숨김/보기
    function togglePassword(inputID,button) {
        const pwInput = document.getElementById(inputID);
        const check = document.getElementById(button);

        if (pwInput.type === "password") {
            pwInput.type = "text";
            check.textContent = "숨김";
        } else {
            pwInput.type = "password";
            check.textContent = "보기";
        }
    }
   
    //아이디 중복 확인    
    function checkId() {
      
    	 const id = document.getElementById("id").value;
    	 if(id == null || id.trim() === ''){
          	  alert('아이디를 입력하세요.')
          	return;
         }else if(id != null){
           fetch("dupli.do?id=" + encodeURIComponent(id))
          .then(res => res.text())
          .then(msg => {
            document.getElementById("checkResult").innerText = msg;
          });
    	 }
      }

function validateForm() {
	
  // 빈값 체크 함수
  function isEmpty(value) {
    return !value || value.trim() === '';
  //value가 아예 존재하지 않거나, 비어 있다면 true를 반환
  }
  
  // 성별 체크
  const genderChecked = document.querySelector('input[name="gender"]:checked');
  if (!genderChecked) {
    alert('성별을 선택하세요.');
    return false;
  }
 
  // 우편번호
  const postcode = document.getElementById('sample6_postcode').value;
  if (isEmpty(postcode)) {
    alert('우편번호를 입력하세요.');
    return false;
  }

  // 주소
  const address = document.getElementById('sample6_address').value;
  if (isEmpty(address)) {
    alert('주소를 입력하세요.');
    return false;
  }


  //pw==pw_re
  const pw = document.getElementById("pw").value;
  const pw_re = document.getElementById("pw_re").value;
  if (pw !== pw_re) {
    alert('비밀번호가 일치하지 않습니다.');
    return false;
  }
  
  //아이디 중복확인
  //아이디 중복확인
  const id_dupli = document.getElementById('checkResult').innerText;
  const id = document.getElementById("id").value;
  if (id_dupli=="이미 존재하는 아이디입니다.") {
      alert("아이디가 이미 존재하는 아이디 입니다.");
      return false;
  } else if(id_dupli.trim() === ''||id.trim() === ''){
     alert("아이디 중복 확인을 실행해주세요.");
      return false;
  }


  return true;
}
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 컨텐츠 -->
	<div class="content">
		<h2>회원가입</h2>
		<form action="Gaip.do" id="signupForm" method="post" onsubmit="return validateForm()">

			<label for="id">아이디</label>
			<div class="input-group">
				<input type="text" id="id" name="user_id" required>
				<button type="button" onclick="checkId()">중복 확인</button>
			</div>
			<p id="checkResult"></p>

			<label for="pw">비밀번호</label>
			<div class="input-group">
				<input type="password" id="pw" name="passwd" required>
				<button type="button" onclick="togglePassword('pw', this)">보기</button>
			</div>

			<label for="pw_re">비밀번호 확인</label>
			<div class="input-group">
				<input type="password" id="pw_re" name="pw_re" required>
				<button type="button" onclick="togglePassword('pw_re', this)">보기</button>
			</div>

			<label for="name">이름</label> <input type="text" id="name" name="user_name" required> 
			<label for="birth">생년월일</label> <input type="date" id="birth" name="birthday" required min="1900-01-01" max="${mMaxdate}"> 
			<label>성별</label>
			<div class="radio-group">
				<input type="radio" name="gender" value="0" checked> 남 <input type="radio" name="gender" value="1"> 여
			</div>

			<label for="height">신장</label> <input type="text" id="height" name="height" required> <label for="weight">체중</label> <input type="text" id="weight" name="weight" required> <label for="phone">전화번호</label> <input type="text" id="phone" name="phone" required> <label for="email">이메일</label> <input type="text" id="email" name="email" required> <label for="sample6_postcode">우편번호</label>
			<div class="input-group">
				<input type="text" id="sample6_postcode" placeholder="우편번호"> <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
			</div>

			<label for="sample6_address">주소</label>
			<div class="address-group">
				<input type="text" id="sample6_address" name="address" placeholder="주소"> <input type="text" id="sample6_detailAddress" placeholder="상세주소"> <input type="text" id="sample6_extraAddress" placeholder="참고항목">
			</div>


			<div style="text-align: center; margin-top: 20px;">
				<input type="submit" value="가입하기"> <input type="reset" value="초기화">
			</div>
		</form>
		<!-- controller로 옮겨야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	</script>
	</div>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
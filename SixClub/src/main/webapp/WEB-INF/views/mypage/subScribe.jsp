<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 구독 관리하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f8ff; /* 부드러운 하얀 배경 */
	margin: 0;
	color: #1c1f3a; /* 짙은 파랑/네이비 계열 텍스트 */
}

.nf-container {
	display: flex;
	min-height: 100vh;
	box-sizing: border-box;
	/* ==================================================== */
	max-width: 1375px; /* 컨텐츠 최대 너비 제한 */
	margin: 0 auto 0 200px; /* 좌우 자동 마진으로 화면 중앙에 배치 */
	padding: 0 20px; /* 좌우 약간 패딩 */
}

.nf-content {
	flex: 1;
	background-color: #ffffff;
	padding: 48px 20px;
	border-radius: 0;
	box-shadow: 0 12px 30px rgba(28, 31, 58, 0.1);
	text-align: center;
	/* 배경 */
	position: relative;
	padding: 80px 40px;
	background-color: rgba(255, 255, 255, 0.9); /* 흐릿한 배경 위에 살짝 반투명한 느낌 */
	overflow: hidden; /* 배경 블러 넘침 방지 */
	border-radius: 16px;
}

.background-blur {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image:
		url('${pageContext.request.contextPath}/resources/img/backB.jpg');
	background-repeat: repeat;
	background-size: 1375px;
	/* 	z-index: -1; /* 핵심 */
	*/
	/* 	pointer-events: none; /* 선택: 클릭 차단 방지 */
	*/
}
/* 카드 배경 이미지 스타일 공통 */
.nf-card.bg-blue, .nf-card.bg-silver, .nf-card.bg-gold {
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	color: white; /* 텍스트 잘 보이게 */
	position: relative;
}

/* 반짝이 애니메이션 효과 추가 */
.nf-card::after {
	content: "";
	position: absolute;
	top: -50%;
	left: -50%;
	width: 200%;
	height: 200%;
	background: linear-gradient(120deg, rgba(255, 255, 255, 0) 0%,
		rgba(255, 255, 255, 0.6) 50%, rgba(255, 255, 255, 0) 100%);
	transform: rotate(25deg);
	animation: shine 2.5s infinite;
	z-index: 2;
	pointer-events: none;
	filter: blur(2px);
}

@keyframes shine {
  0% {
    transform: translateX(-100%) rotate(25deg);
    opacity: 0;
  }
  20% {
    opacity: 0.4;
  }
  50% {
    opacity: 0.6;
  }
  80% {
    opacity: 0.4;
  }
  100% {
    transform: translateX(200%) rotate(25deg);
    opacity: 0;
  }
}

/* 카드 내부 배경 오버레이 (어둡게 처리해서 텍스트 가독성 확보) */
.nf-card::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 0;
	border-radius: 24px;
}

/* shine 애니메이션 정의 */
.nf-card-inner, .nf-card-content {
	position: relative;
	z-index: 2; /* 텍스트와 버튼은 배경 위에 표시 */
}

.nf-card-inner, .nf-card-content {
	position: relative;
	z-index: 1; /* 텍스트와 버튼은 배경 위에 표시 */
}

/* 개별 배경 이미지 설정 */
.nf-card.bg-blue {
	background-image:
		url('${pageContext.request.contextPath}/resources/img/backlogo_blue.png');
}

.nf-card.bg-silver {
	background-image:
		url('${pageContext.request.contextPath}/resources/img/backlogo_silver.png');
}

.nf-card.bg-gold {
	background-image:
		url('${pageContext.request.contextPath}/resources/img/backlogo_gold.png');
}

/* 카드, 제목 등은 z-index 1 이상이면 안 가려짐 */
.nf-content h1, .nf-cards {
	position: relative;
	z-index: 1;
}

/* 제목 */
.nf-content h1 {
	font-size: 34px;
	color: #0d47a1; /* 선명한 파랑 */
	font-weight: 900;
	margin-bottom: 36px;
	letter-spacing: 1.3px;
	margin-top: 40px;
}

.nf-content h3 {
	position: relative;
	z-index: 1;
}

/* 구독 카드 컨테이너 */
.nf-cards {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	gap: 30px;
	flex-wrap: wrap;
	margin-top: 60px;
}

/* 개별 구독 카드 */
.nf-card {
	background: linear-gradient(135deg, #e0f7fa, #ffffff);
	border-radius: 24px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	width: 240px;
	text-align: center;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.nf-logo {
	position: relative;
	z-index: 2; /* 배경보다 앞에 오도록 */
	width: 900px; /* 크기 원하는 만큼 조정 */
	margin-bottom: 10px;
	margin-left: -80px;
}

.nf-card:hover {
	transform: translateY(-8px);
	box-shadow: 0 16px 40px rgba(0, 0, 0, 0.2);
}

.nf-card-inner {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 20px 10px;
}

/* 카드 이미지 */
.nf-card img {
	width: 200px;
	height: auto;
	border-radius: 0;
	height: auto;
	align-items: center;
	object-fit: contain;
	margin-bottom: 14px; /* 둥글게 안 하기 */
}

/* 텍스트 및 버튼 영역 */
.nf-card-content {
	display: flex;
	flex-direction: column;
	align-items: center;
}

/* 제목 */
.nf-card-content h3 {
	margin: 0;
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 6px;
	color: #0d47a1;
}

/* 가격 */
.nf-card-content p.price {
	margin: 0;
	font-size: 16px;
	font-weight: 500;
	margin-bottom: 10px;
	color: #333;
}

/* 버튼 */
.nf-card-content .nf-button {
	width: auto;
	box-shadow: none;
	padding: 10px 26px;
	font-size: 16px;
	background-color: #0d47a1;
	color: white;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.nf-button:hover:not(:disabled) {
	background-color: #08306b;
	box-shadow: 0 8px 24px rgba(8, 48, 107, 0.8);
}

.nf-button:disabled {
	background-color: #a9c8ff;
	color: #d1d9f5;
	cursor: not-allowed;
	box-shadow: none;
}

/* 뒤로가기 버튼 스타일 */
form input[type="submit"] {
	background-color: #0d47a1;
	color: white;
	padding: 14px 42px;
	font-size: 17px;
	border: none;
	border-radius: 14px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin-top: 16px;
	z-index: 1;
	position: relative;
}

form input[type="submit"]:hover {
	background-color: #08306b;
}

/* 안내 문구 마진 */
.nf-content p, .nf-content h1 {
	margin-bottom: 22px;
}

.nf-content h1.highlighted-title {
	font-size: 40px;
	font-weight: 900;
	color: #0d47a1;
	text-align: center;
	position: relative;
	z-index: 2;
	margin-bottom: 40px;
	animation: pulseGlow 3s infinite;
	/* 텍스트 그림자 효과 */
	text-shadow: 0 0 8px rgba(13, 71, 161, 0.4), 0 0 16px
		rgba(13, 71, 161, 0.2);
	background: linear-gradient(to right, #6ec6ff, #2196f3, #6ec6ff);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.nf-benefits {
	max-width: 480px;
	margin: 0 auto 24px;
	text-align: left;
	font-size: 16px;
	line-height: 1.8;
	color: #444;
	position: relative;
	z-index: 1; /* 카드 애니메이션보다 앞에 오지 않도록 설정 */
}

.nf-benefits p {
	margin: 0 0 6px;
	display: flex;
	align-items: center;
	margin-left: 50px;
}

.nf-benefits p:last-child {
	margin-bottom: 0;
}

.nf-benefits .check-icon {
	color: #d50000;
	font-weight: bold;
	margin-right: 8px;
	font-size: 18px;
}

.price {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 4px;
}

.original-price {
	font-size: 14px;
	color: #888;
	text-decoration: line-through;
}

.discounted-price {
	font-size: 18px;
	color: #0d47a1;
	font-weight: bold;
}

@keyframes pulseGlow {
  0% {
    text-shadow: 0 0 10px rgba(13, 71, 161, 0.3), 0 0 20px rgba(33, 150, 243, 0.2);
  }
  50% {
    text-shadow: 0 0 20px rgba(13, 71, 161, 0.6), 0 0 30px rgba(33, 150, 243, 0.4);
  }
  100% {
    text-shadow: 0 0 10px rgba(13, 71, 161, 0.3), 0 0 20px rgba(33, 150, 243, 0.2);
  }
}

#popup-layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
/* 	background-color: rgba(240, 248, 255, 0.03); /* 어두운 반투명 배경 */ */
	display: none;
	justify-content: center;
	align-items: center;
	z-index: 9999; /* 가장 위에 오도록 */
}

.popup-content {
	background-color: white;
	padding: 30px 40px;
	border-radius: 12px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
	text-align: center;
	max-width: 500px;
	width: 90%;
}

.popup-content h3 {
	font-size: 20px;
	color: #0d47a1;
	margin-bottom: 20px;
}

.close-btn {
	padding: 10px 24px;
	background-color: #0d47a1;
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	font-size: 16px;
}

.close-btn:hover {
	background-color: #08306b;
}

</style>

</head>
<body>


	<canvas id="fireworks-canvas" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: 9998; pointer-events: none;"></canvas>
	<script src="${pageContext.request.contextPath}/resources/js/fireworks.js"></script>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 컨텐츠 -->
	<div class="nf-container">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

		<!-- 컨텐츠 -->
		<div class="nf-content">

			<div class="background-blur"></div>
			<img class="nf-logo" alt="logo" src="${pageContext.request.contextPath}/resources/img/Blogo.png">

			<c:choose>
				<c:when test="${empty subscribe}">
					<h1 class="highlighted-title">원하는 멤버십을 선택하세요!</h1>
					<!-- 안내 멘트 -->
					<div class="nf-benefits">
						<p>
							<span class="check-icon">✔</span> 오직 구독자만 볼 수 있는 '스페셜 루틴'이 열립니다.
						</p>
						<p>
							<span class="check-icon">✔</span> 원하는 몸매, 체력, 습관 구독으로 실현하세요.
						</p>
						<p>
							<span class="check-icon">✔</span> 3,900원으로 바뀌는 나의 일상, 시작은 이 루틴에서!
						</p>
					</div>
					<br>
					<div class="nf-cards">
						<!-- 1개월 구독카드 -->
						<div class="nf-card bg-blue">
							<div class="nf-card-inner">
								<img src="${pageContext.request.contextPath}/resources/img/bluelogo.png" alt="1개월 구독 이미지" />
								<div class="nf-card-content">
									<h3>1개월 구독하기</h3>
									<p class="price">
										<span class="original-price"> <br>
										</span> <span class="discounted-price">3,900원</span>
									</p>
									<button type="button" class="nf-button" id="pay1">구독하기</button>
								</div>
							</div>
						</div>
						<!-- 3개월 구독카드 -->
						<div class="nf-card bg-silver">
							<div class="nf-card-inner">
								<img src="${pageContext.request.contextPath}/resources/img/silverlogo.png" alt="3개월 구독 이미지" />
								<div class="nf-card-content">
									<h3>3개월 구독하기</h3>
									<p class="price">
										<span class="original-price">11,700원</span> <span class="discounted-price">9,900원</span>
									</p>
									<button type="button" class="nf-button" id="pay2">구독하기</button>
								</div>
							</div>
						</div>
						<!-- 6개월 구독카드 -->
						<div class="nf-card bg-gold">
							<div class="nf-card-inner">
								<img src="${pageContext.request.contextPath}/resources/img/goldlogo.png" alt="6개월 구독 이미지" />
								<div class="nf-card-content">
									<h3>6개월 구독하기</h3>
									<p class="price">
										<span class="original-price">23,400원</span> <span class="discounted-price">14,900원</span>
									</p>
									<button type="button" class="nf-button" id="pay3">구독하기</button>
								</div>
							</div>
						</div>
					</div>

				</c:when>
				<c:otherwise>
					<h1>${subscribe.user_name}님의구독만료일은 ${subscribe.end_date}입니다.</h1>
				</c:otherwise>
			</c:choose>

			<br>
			<br>

			<form action="myPage.do">
				<input type="submit" value="뒤로">
			</form>


			<!-- 팝업 레이어 -->

			<div id="popup-layer" style="display: none;">
				<div class="popup-content">
					<h3 id="popup-title">${user.user_name} 님<br>Six Club의 서비스를 구독해주셔서 감사합니다</h3>
					
					<button class="close-btn" id="popup-close">닫기</button>
				</div>
			</div>

			<script>
			    document.addEventListener('DOMContentLoaded', () => {
				    const endingDate = '${subscribe.end_date}'; // JSP에서 전달받은 구독 만료일
				    const payButton1 = document.getElementById('pay1'); // 1개월 구독 버튼
				    const payButton2 = document.getElementById('pay2'); // 3개월 구독 버튼
				    const payButton3 = document.getElementById('pay3'); // 6개월 구독 버튼
				    const userNO = '${user.user_no}'; // 사용자 번호 (UsersVO의 필드명 확인 필요)
				
				    
				    let isSubscribed = false; // 현재 구독 중인지 여부를 나타내는 플래그
				
				    // 구독 만료일이 존재하고 'null' 문자열이 아닌 경우
				    if (endingDate && endingDate !== 'null') {
				        const endDate = new Date(endingDate); // 만료일 Date 객체
				        const currentDate = new Date(); // 현재 날짜 Date 객체
				
				        // 정확한 날짜 비교를 위해 시간을 자정으로 설정
				        endDate.setHours(0, 0, 0, 0);
				        currentDate.setHours(0, 0, 0, 0);
				
				        // 남은 일수 계산
				        const restDays = Math.floor((endDate - currentDate) / (1000 * 60 * 60 * 24));
				        
				        // 남은 일수가 0보다 크면 (아직 구독 유효)
				        if (restDays > 0) {
				            isSubscribed = true; // 구독 중으로 설정
				        }
				    }
				
				    // 구독 상태에 따라 버튼 활성화/비활성화 처리
				    if (isSubscribed) {
				        // 구독 중이면 모든 결제 버튼 비활성화
				        payButton1.disabled = true;
				        payButton2.disabled = true;
				        payButton3.disabled = true;
				    } else {
				        // 구독 중이 아니거나 만료되었으면 결제 버튼에 이벤트 리스너 추가
				        // 1개월 구독 버튼 클릭 이벤트
				        payButton1.addEventListener('click', () => {
				            const IMP = window.IMP;
				            IMP.init('imp60110608'); // 아임포트 가맹점 코드
				            const amount = 3900; // 1개월 구독 금액
				            const monthsToAdd = 1; // 추가할 개월 수
							const goodsName = 'sixclub 구독 서비스(1개월)';
				            // 결제 처리 함수 호출
				            handlePayment(IMP, amount,goodsName, monthsToAdd, userNO);
				        });
				
				        // 3개월 구독 버튼 클릭 이벤트
				        payButton2.addEventListener('click', () => {
				            const IMP = window.IMP;
				            IMP.init('imp60110608');
				            const amount = 9900; // 3개월 구독 금액
				            const monthsToAdd = 3;
				            const goodsName = 'sixclub 구독 서비스(3개월)';
				            handlePayment(IMP, amount,goodsName, monthsToAdd, userNO);
				        });
				
				        // 6개월 구독 버튼 클릭 이벤트
				        payButton3.addEventListener('click', () => {
				            const IMP = window.IMP;
				            IMP.init('imp60110608');
				            const amount = 14900; // 6개월 구독 금액
				            const monthsToAdd = 6;
				            const goodsName = 'sixclub 구독 서비스(6개월)';
				            handlePayment(IMP, amount,goodsName, monthsToAdd, userNO);
				        });
				    }
				});

				// 결제 로직을 별도의 함수로 분리하여 재사용성 높이기
				function handlePayment(IMP, amount, goodsName, monthsToAdd, userNO) {
				    // handlePayment 함수 내부에서 currentDate를 새로 정의합니다.
				    const currentDate = new Date(); // 현재 날짜 Date 객체
				
				    const requestData = {
				        pg: 'kakaopay', // PG사 (카카오페이)
				        name: goodsName, // 상품명
				        amount: amount, // 결제 금액
				    };
				
				    // 아임포트 결제 요청
				    IMP.request_pay(requestData, (response) => {
				        if (response.success) {
				            // 결제 성공 시
				            console.log('결제 성공', response);
				            
				            // 팝업 표시
				            const popup = document.getElementById('popup-layer');
				            const closeBtn = document.getElementById('popup-close');
				            popup.style.display = 'flex';
				        	
				            // 폭죽 애니메이션 시작
				            window.startFireworks();

				            // 닫기 버튼 클릭 이벤트
				            closeBtn.addEventListener('click', () => {
				                popup.style.display = 'none';
				                // 폭죽 애니메이션 중단
				                window.stopFireworks();
				                window.location.reload();
				            });
				
				            // 시작일자를 'YYYY-MM-DD' 형식으로 포맷
				            const startDate = currentDate.getFullYear() + '-' +
				                ('0' + (currentDate.getMonth() + 1)).slice(-2) + '-' +
				                ('0' + currentDate.getDate()).slice(-2);
				
				            // 만료일자 계산 (현재 날짜로부터 monthsToAdd 개월 뒤)
				            const endDateObj = new Date(currentDate);
				            endDateObj.setMonth(endDateObj.getMonth() + monthsToAdd);
				
				            // 월이 넘어갈 때 일자가 존재하지 않는 경우 처리 (예: 1월 31일 + 1개월 -> 2월 28일/29일)
				            if (endDateObj.getDate() !== currentDate.getDate()) {
				                endDateObj.setDate(0); // 현재 월의 0번째 날짜 = 이전 달의 마지막 날짜
				            }
				
				            const endDates = endDateObj.getFullYear() + '-' +
				                ('0' + (endDateObj.getMonth() + 1)).slice(-2) + '-' +
				                ('0' + endDateObj.getDate()).slice(-2);
				
				            // 서버로 구독 정보 전송 (AJAX 요청)
				            fetch('${pageContext.request.contextPath}/SubScribes.do', {
				                method: 'POST',
				                headers: {
				                    'Content-Type': 'application/json', // JSON 형식으로 데이터 전송
				                },
				                body: JSON.stringify({
				                    user_no: userNO, // 사용자 번호
				                    start_date: startDate, // 구독 시작일
				                    end_date: endDates // 구독 만료일
				                }),
				            })
				            .then((res) => {
				                if (!res.ok) {
				                    // HTTP 응답이 성공(200번대)이 아니면 에러 발생
				                    throw new Error(`HTTP error! status: ${res.status}`);
				                }
				                console.log('서버에 구독 정보 전송 성공 (뷰 응답 예상)');
				            })
				            .catch((err) => {
				                // 서버 통신 중 에러 발생 시
				                console.error('서버 전송 오류:', err);
				            }); 
				
				        } else {
				            // 결제 실패 시
				            alert(`결제를 실패했습니다. 고객센터로 문의해 주세요.`);
				            console.error('결제 실패', response);
				        }
				    });
				}
				</script>
		</div>

	</div>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

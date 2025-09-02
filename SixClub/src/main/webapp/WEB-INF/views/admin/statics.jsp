<%@page import="java.io.Console"%>
<%@page import="com.mycom.sixclub.service.vo.SubscribeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mycom.sixclub.service.vo.UsersVO"%>
<%@ page import="com.mycom.sixclub.service.vo.WorkoutHistoryGroupVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Six Club - 관리자</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>




<%
//users 가져오기
List<UsersVO> users = (List<UsersVO>) request.getAttribute("users");

//성별통계
int maleCount = 0;
int femaleCount = 0;

// users 리스트에서 gender 값을 기반으로 계산
if (users != null) {
	for (UsersVO user : users) {
		if (user.getGender() == 0) {
	maleCount++;
		} else if (user.getGender() == 1) {
	femaleCount++;
		}
	}
}

//나온 값의 합을 100으로 보정하는 코드

double malePercent = 0;
double femalePercent = 0;
int totalCount = maleCount + femaleCount;
malePercent = ((double) maleCount / totalCount) * 100;
femalePercent = 100 - malePercent; // 무조건 합이 100이 되도록 보정
%>

<%
//연령통계

int underTwenty = 0;
int thirty = 0;
int forty = 0;
int fifty = 0;
int sixty = 0;
int elder = 0;

Calendar today = Calendar.getInstance();

if (users != null) {
	for (UsersVO user : users) {
		Date birthday = user.getBirthday();
		if (birthday != null) {
	Calendar birthCalendar = Calendar.getInstance();
	birthCalendar.setTime(birthday);

	// 나이 계산
	int age = today.get(Calendar.YEAR) - birthCalendar.get(Calendar.YEAR);

	// 생일이 아직 안 지났으면 한 살 뻄
	if (today.get(Calendar.DAY_OF_YEAR) < birthCalendar.get(Calendar.DAY_OF_YEAR)) {
		age--;
	}

	// 나이대 분류
	if (age < 30) {
		underTwenty++;
	} else if (age < 40) {
		thirty++;
	} else if (age < 50) {
		forty++;
	} else if (age < 60) {
		fifty++;
	} else if (age < 70) {
		sixty++;
	} else {
		elder++;
	}
		}
	}

}
int totalage = underTwenty + thirty + forty + fifty + sixty + elder;
double underTwentyPercent = 0, thirtyPercent = 0, fortyPercent = 0, fiftyPercent = 0, sixtyPercent = 0,
		elderPercent = 0;

// 각 나이대의 비율 계산
underTwentyPercent = (underTwenty * 100.0) / totalage;
thirtyPercent = (thirty * 100.0) / totalage;
fortyPercent = (forty * 100.0) / totalage;
fiftyPercent = (fifty * 100.0) / totalage;
sixtyPercent = (sixty * 100.0) / totalage;
elderPercent = 100.0 - (underTwentyPercent + thirtyPercent + fortyPercent + fiftyPercent + sixtyPercent);
%>



<%
//구독 플랜별 통계
List<SubscribeVO> subscribes = (List<SubscribeVO>) request.getAttribute("subscribe");

int oneMonth = 0;
int threeMonth = 0;
int sixMonth = 0;

if (subscribes != null) {
	for (SubscribeVO subscribe : subscribes) {
		Date startdate = subscribe.getStart_date();
		Date enddate = subscribe.getEnd_date();

		if (startdate == null || enddate == null) {
	continue; // 유효하지 않은 데이터는 건너뜀
		}

		Calendar start = Calendar.getInstance();
		start.setTime(startdate);
		Calendar end = Calendar.getInstance();
		end.setTime(enddate);

		int months = 0;
		//몇 개월짜리 플랜인지 구하는 코드
		months = (end.get(Calendar.YEAR) - start.get(Calendar.YEAR)) * 12
		+ (end.get(Calendar.MONTH) - start.get(Calendar.MONTH));
		if (months == 1) {
	oneMonth++;
		} else if (months == 3) {
	threeMonth++;
		} else if (months == 6) {
	sixMonth++;
		}
	}
}

int plantotal = oneMonth + threeMonth + sixMonth;
double onepercent = 0.0;
double threepercent = 0.0;
double sixpercent = 0.0;

onepercent = (oneMonth * 100.0) / plantotal;
threepercent = (threeMonth * 100.0) / plantotal;
sixpercent = (sixMonth * 100.0) / plantotal;
%>


<%
// 운동 레벨 통계
List<WorkoutHistoryGroupVO> historygroups = (List<WorkoutHistoryGroupVO>) request.getAttribute("historygroup");
int easy = 0;
int normal = 0;
int hard = 0;
if (historygroups != null) {
	for (WorkoutHistoryGroupVO historygroup : historygroups) {

		if (historygroup != null) {

	int level = historygroup.getWoLevel();
	if (level == 0) {
		easy++;
	} else if (level == 1) {
		normal++;
	} else if (level == 2) {
		hard++;
	}
		}
	}
}

int leveltotal = easy + normal + hard;
double easypercent = 0.0;
double normalpercent = 0.0;
double hardpercent = 0.0;

easypercent = (easy * 100.0) / leveltotal;
normalpercent = (normal * 100.0) / leveltotal;
hardpercent = (hard * 100.0) / leveltotal;
%>

<%
//플랜 일수 별 통계
Integer allRoutineObj = (Integer) request.getAttribute("allRoutineCount");
Integer sixRoutineObj = (Integer) request.getAttribute("sixRoutineCount");

int allRoutine = (allRoutineObj != null) ? allRoutineObj.intValue() : 0; // null이면 기본값 0
int sixRoutine = (sixRoutineObj != null) ? sixRoutineObj.intValue() : 0;
int oneRoutine = allRoutine - sixRoutine;

double oneRoutinepercent = 0.0;
double sixRoutinepercent = 0.0;
oneRoutinepercent = (oneRoutine * 100.0) / allRoutine;
sixRoutinepercent = (sixRoutine * 100.0) / allRoutine;
%>

<script>

let currentChart = null; // 현재 화면에 나올 차트

function destroyExistingChart() {
    if (currentChart) {
        currentChart.destroy(); // 기존 차트를 제거
        currentChart = null;
    }
}


	function genderStatic() { // 성별 통계
		destroyExistingChart();
		const malePercentage = <%=String.format("%.2f", malePercent)%>;
		const femalePercentage = <%=String.format("%.2f", femalePercent)%>;

		//차트 생성
		const genderstatic = document.querySelector("#chart").getContext('2d');
		currentChart = new Chart(genderstatic, {
			type : 'pie',
			data : {//차트 내부 데이터
				labels : [ '남자', '여자' ],
				datasets : [ {
					data : [ malePercentage, femalePercentage ],
					backgroundColor : [ 'rgba(0,0,255,0.5)','rgba(255,0,0,0.5)' ], // 그래프 색
					borderColor : [ 'rgba(0,0,255,1)', 'rgba(255,0,0,1)' ], // 그래프 테두리 색
					borderWidth : 1
				} ]
			},
			options : {//차트 외부 옵션 관련
				plugins : {
					title : {//그래프 제목
						display : true,
						text : '성별 통계'
					},
					legend : {//차트 범례
						display : true,
						position : 'top'
					}
				}
			}
		});
	}
	
	function ageStatic(){//연령별 통계
		destroyExistingChart();
	    const underTwentyPercentage = <%=String.format("%.2f", underTwentyPercent)%>;
	    const thirtyPercentage = <%=String.format("%.2f", thirtyPercent)%>;
	    const fortyPercentage = <%=String.format("%.2f", fortyPercent)%>;
	    const fiftyPercentage = <%=String.format("%.2f", fiftyPercent)%>;
	    const sixtyPercentage = <%=String.format("%.2f", sixtyPercent)%>;
	    const elderPercentage = <%=String.format("%.2f", elderPercent)%>;
	    
	    
	    const agestatic = document.querySelector("#chart").getContext('2d');
		currentChart = new Chart(agestatic, {
			type : 'pie',
			data : {//차트 내부 데이터
				labels : [ '20대 이하','30대','40대','50대','60대','70세 이상' ],
				datasets : [ {
					data : [ underTwentyPercentage, thirtyPercentage, fortyPercentage,fiftyPercentage,sixtyPercentage,elderPercentage],
					backgroundColor : [         
				        'rgba(0, 0, 255, 0.5)', 
	                    'rgba(0, 255, 0, 0.5)', 
	                    'rgba(255, 0, 0, 0.5)', 
	                    'rgba(255, 255, 0, 0.5)', 
	                    'rgba(0, 255, 255, 0.5)', 
	                    'rgba(128, 0, 128, 0.5)' ], // 그래프 색
					borderColor : [
						'rgba(0, 0, 255, 1)', 
	                    'rgba(0, 255, 0, 1)', 
	                    'rgba(255, 0, 0, 1)', 
	                    'rgba(255, 255, 0, 1)', 
	                    'rgba(0, 255, 255, 1)', 
	                    'rgba(128, 0, 128, 1)' ], // 그래프 테두리 색
					borderWidth : 1
				} ]
			},
			options : {//차트 외부 옵션 관련
				plugins : {
					title : {//그래프 제목
						display : true,
						text : '연령별 통계'
					},
					legend : {//차트 범례
						display : true,
						position : 'top'
					}
				}
			}
			
		});
	}
	
	function dateStatic(year) {
	    destroyExistingChart();

	    fetch('${pageContext.request.contextPath}/admin/statics?year=' + year) // 이 URL은 서버의 실제 API 엔드포인트에 맞게 수정해야 합니다.
	        .then(response => {
	            if (!response.ok) {
	                throw new Error('Network response was not ok ' + response.statusText);
	            }
	            return response.json(); // 서버 응답을 JSON으로 파싱
	        })
	        .then(data => {
	            // 서버에서 받은 데이터로 차트 업데이트
	            const datestatic = document.querySelector("#chart").getContext('2d');
	            currentChart = new Chart(datestatic, {
	                type: 'bar', // 또는 'line' 차트가 더 적절할 수 있습니다.
	                data: {
	                    labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                    datasets: [{	
	                        label: '총 구독 결제 횟수',
	                        data: [
	                            data.january, data.february, data.march, data.april, data.may, data.june,
	                            data.july, data.august, data.september, data.october, data.november, data.december
	                        ],
	                        backgroundColor: 'rgba(0,0,255,0.5)', // 그래프 색
	                        borderColor: 'rgba(255,0,0,1)', // 그래프 테두리 색
	                        borderWidth: 2,
	                        fill: true,
	                    }]
	                },
	                options: {
	                    plugins : {
	                        title : {
	                            display : true,
	                            text : year + '년도 월별 구독 현황' // 선택된 연도를 제목에 표시
	                        },
	                        legend : {
	                            display : true,
	                            position : 'top'
	                        }
	                    }
	                }
	            });
	        })
	        .catch(error => console.error('Error fetching date :', error));
	}


	document.addEventListener('DOMContentLoaded', function() {
	    const selectYear = document.getElementById('selectYear');
	    const currentYear = new Date().getFullYear(); // 현재 연도 가져오기

	    const startYear = currentYear - 10; // 현재 연도에서 10년 전까지 검색 지원, 바꿔도됨
	    const endYear = currentYear;    // 현재 연도

	    for (let year = startYear; year <= endYear; year++) {
	        const option = document.createElement('option');
	        option.value = year;
	        option.textContent = year;

	        // 현재 연도를 기본 선택 값으로 설정
	        if (year === currentYear) {
	            option.selected = true;
	        }
	        selectYear.appendChild(option);
	    }
	    // 3. 드롭다운 변경(change) 이벤트 리스너 추가
	    selectYear.addEventListener('change', function() {
	        const selectedYear = this.value;
	        dateStatic(selectedYear); // ★★★ 선택된 연도를 dateStatic 함수로 전달 ★★★
	    });

	    // ★★★ 페이지 로드 시 현재 연도로 초기 차트 표시 ★★★
	    dateStatic(currentYear);
	});

		
	function planStatic(){//구독 플랜 통계
		destroyExistingChart();
		
		const onePercentage = <%=String.format("%.2f", onepercent)%>;
		const threePercentage = <%=String.format("%.2f", threepercent)%>;
		const sixPercentage = <%=String.format("%.2f", sixpercent)%>;
		
		
	    const planstatic = document.querySelector("#chart").getContext('2d');
		currentChart = new Chart(planstatic, {
			type : 'pie',
			data : {//차트 내부 데이터
				labels : [ '1개월 플랜','3개월 플랜','6개월 플랜' ],
				datasets : [ {
					data : [onePercentage,threePercentage,sixPercentage],
					backgroundColor : [         
				        'rgba(0, 0, 255, 0.5)', 
	                    'rgba(0, 255, 0, 0.5)', 
	                    'rgba(255, 0, 0, 0.5)'
	                    ], // 그래프 색
					borderColor : [
						'rgba(0, 0, 255, 1)', 
	                    'rgba(0, 255, 0, 1)', 
	                    'rgba(255, 0, 0, 1)', 
						], // 그래프 테두리 색
					borderWidth : 1
				} ]
			},
			options : {//차트 외부 옵션 관련
				plugins : {
					title : {//그래프 제목
						display : true,
						text : '결제 구독기간 통계'
					},
					legend : {//차트 범례
						display : true,
						position : 'top'
					}
				}
			}
			
		});
	}
	
	function levelStatic() {//운동 레벨 통계
		destroyExistingChart();
		
		const easyPercentage = <%=String.format("%.2f", easypercent)%>;
		const normalPercentage = <%=String.format("%.2f", normalpercent)%>;
		const hardPercentage = <%=String.format("%.2f", hardpercent)%>;
		
		console.log("easyPercentage:", easyPercentage);
		console.log("normalPercentage:", normalPercentage);	
		console.log("hardPercentage:", hardPercentage);
		
		
		 const levelstatic = document.querySelector("#chart").getContext('2d');
			currentChart = new Chart(levelstatic, {
				type : 'pie',
				data : {//차트 내부 데이터
					labels : [ '초급','중급','고급' ],
					datasets : [ { 
						data : [easyPercentage,normalPercentage,hardPercentage],
						backgroundColor : [         
					        'rgba(0, 0, 255, 0.5)', 
		                    'rgba(0, 255, 0, 0.5)', 
		                    'rgba(255, 0, 0, 0.5)'
		                    ], // 그래프 색
						borderColor : [
							'rgba(0, 0, 255, 1)', 
		                    'rgba(0, 255, 0, 1)', 
		                    'rgba(255, 0, 0, 1)', 
							], // 그래프 테두리 색
						borderWidth : 1
					} ]
				},
				options : {//차트 외부 옵션 관련
					plugins : {
						title : {//그래프 제목
							display : true,
							text : '운동 레벨 통계'
						},
						legend : {//차트 범례
							display : true,
							position : 'top'
						}
					}
				}
				
			});
	}
	
	function routineStatic(){
		destroyExistingChart();
		
		const oneRoutinepercentage = <%=String.format("%.2f", oneRoutinepercent)%>;
		const sixRoutinepercentage = <%=String.format("%.2f", sixRoutinepercent)%>;
		
		const routinestatic = document.querySelector("#chart").getContext('2d');
		currentChart = new Chart(routinestatic, {
			type : 'pie',
			data : {//차트 내부 데이터
				labels : [ '하루 루틴', '6일 루틴' ],
				datasets : [ {
					data : [ oneRoutinepercentage, sixRoutinepercentage ],
					backgroundColor : [ 'rgba(255, 150, 50,0.5)','rgba(70, 150, 70,0.5)' ], // 그래프 색
					borderColor : [ 'rgba(255, 150, 50,1)', 'rgba(70, 150, 70,1)' ], // 그래프 테두리 색
					borderWidth : 1
				} ]
			},
			options : {//차트 외부 옵션 관련
				plugins : {
					title : {//그래프 제목
						display : true,
						text : '운동 루틴 통계'
					},
					legend : {//차트 범례
						display : true,
						position : 'top'
					}
				}
			}
		});
		
	}
	</script>

<style>
/* 전체 페이지 기본 스타일 */
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f0f8ff;
	margin: 0;
	padding: 0;
}

/* 헤더 포함 이후 컨텐츠 영역 */
/* 메인 레이아웃 */
.main-container {
	display: flex;
	flex-wrap: wrap;
}

/* 사이드바 스타일 */
.sidebar {
	width: 240px;
	background-color: #f0f8ff;
	color: white;
	padding: 30px 20px;
	box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	gap: 15px;
	flex-shrink: 0;
	 	margin-left:280px; 
}

.sidebar h2 {
	font-size: 1.5rem;
	margin-bottom: 20px;
	text-align: center;
	color: #111;
}

/* 버튼 및 select 공통 스타일 */
.sidebar button, .sidebar select, .sidebar input[type="submit"] {
	background: white;
	color: #004a99;
	border: none;
	border-radius: 8px;
	padding: 12px 14px;
	font-weight: bold;
	cursor: pointer;
	transition: background 0.3s, color 0.3s;
}

.sidebar button:hover, .sidebar select:hover, .sidebar input[type="submit"]:hover
	{
	background: #e0f0ff;
	color: #003366;
}

.sidebar label {
	font-weight: bold;
	margin-top: 20px;
	color: #cce0ff;
}
/* /* 차트 섹션 
.chart-section {
   /*  flex-grow: 1;
    padding: 40px;
    display: flex; 
    justify-content: center;
    align-items: center;
    padding: 40px;
    display: flex;
    
}

.chart-section canvas {
    width: 100%;
    width: 600px;
}
 */
.chart-container {

	display: flex;
	justify-content: center; /* 좌우 가운데 정렬 */
	align-items: center; /* 상하 가운데 정렬 (높이 필요) */
	margin-top: 40px; /* 위쪽 여백 */
	margin-bottom: 40px; /* 아래쪽 여백 */
		margin-left: 350px; 
	min-height: 400px; /* 차트를 수직 중앙 정렬하고 싶을 때 필요 */
	padding: 40px;
}

canvas#chart {
	width: 100%;
	max-width: 600px;
	height: auto;
	
}

/* 반응형 처리 */
@media screen and (max-width: 640px) {
	.content, #contentDiv {
		width: 95%;
		padding: 20px;
	}
	button {
		width: 100%;
		font-size: 1rem;
		padding: 10px 0;
	}
	form input[type="submit"] {
		width: 100%;
		font-size: 1rem;
		padding: 10px 0;
	}
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/adminHeader2.jsp" />


	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<!-- 사이드바 -->
		<aside class="sidebar">
			<h2>통계 보기</h2>
			<button type="button" onclick="genderStatic()">가입자 성별</button>
			<button type="button" onclick="ageStatic()">연령별</button>
			<button type="button" onclick="planStatic()">구독기간</button>
			<button type="button" onclick="levelStatic()">운동 강도</button>
			<button type="button" onclick="routineStatic()">운동 루틴</button>
			<label for="selectYear" style="color: #111;">📅 연도별 구독 현황</label>
			<select id="selectYear" name="year"></select>
			<form action="adminMain.do">
				<input type="submit" value="메인화면으로">
			</form>
		</aside>

		<!-- 차트 콘텐츠 -->
		<div class="chart-container">
			<canvas id="chart" width="400" height="400" ></canvas>
		</div>
	</div>



	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

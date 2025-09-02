<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="header-wrapper">
	<!-- 상단 유틸메뉴 -->
	<div class="top-util">
		<a href="logout.do">로그아웃</a>
	</div>

	
	<!-- 메인 헤더 -->
	<div class="main-header">
		<div class="logo" onclick="location.href='adminMain.do'">
			<img src="${pageContext.request.contextPath}/resources/img/logo3.png" alt="Six Club 로고"
				style="max-height: 80px; width: 200px; height: auto;">
		</div>
		<div class="nav">
			<a href="getUserList.do">회원관리</a>
			<a href="showStatics.do">통계관리</a>
			<a href="goRoutineEdit.do">운동관리</a>
			<a href="goQna.do">Q&A</a>
		</div>
	</div>
</div>
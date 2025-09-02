<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="header-wrapper">
	<!-- 상단 유틸메뉴 -->
	<div class="top-util">
		<c:choose>
			<c:when test="${empty sessionScope.userNO}">
				<a href="login.do">로그인</a>
				<a href="gaip.do">회원가입</a>
			</c:when>
			<c:otherwise>
				<a href="logout.do">로그아웃</a>
			</c:otherwise>
		</c:choose>
		<a href="goQna.do" >Q&A</a>
	</div>

	<!-- 메인 헤더 -->
	<div class="main-header">
		<div class="logo" onclick="location.href='main.do'">
			<img src="${pageContext.request.contextPath}/resources/img/logo3.png" alt="Six Club 로고" style="max-height: 80px; width: 200px; height: auto;">
		</div>
		<div class="nav">
			<a href="routine.do">운동하러가기</a> <a href="equipList.do">운동장비</a> <a href="findGym.do">근처 헬스장</a> <a href="myPage.do">마이페이지</a>
		</div>
	</div>
</div>
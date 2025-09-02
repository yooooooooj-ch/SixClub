<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- ===== 사이드바 ===== -->
<div class="sidebar">
	<h1>마이페이지</h1>

	<h3>내 정보</h3>
	<ul>
		<li><a href="updateUser.do"> <span class="emoji">👤</span> 회원정보 수정
		</a></li>
		<li class="dropdown">
		<a href="#"> <span class="emoji">⚖️</span> 계산기</a>
			<ul class="submenu">
				<li><a href="goBmi.do">BMI 계산</a></li>
				<li><a href="goBmr.do">기초대사량 계산</a></li>
				<li><a href="goHeartbeat.do">목표심박수 계산</a></li>
			</ul></li>
	</ul>

	<h3>구독 & 히스토리</h3>
	<ul>
		<li class="dropdown"><a href="#"> <span class="emoji">🔄</span> 구독 관리
		</a>
		<ul class="submenu">
		<li><a href="subScribe.do">구독 결제</a></li>
		<li><a href="subscribeHistory.do">구독 히스토리</a></li>
		</ul>
		</li>
		<li class="dropdown">
		<a href="#"> <span class="emoji">🕓</span> 이용 히스토리</a>
			<ul class="submenu">
				<li><a href="historysixday.do">6일 계획 히스토리</a></li>
				<li><a href="historyday.do">1일 계획 히스토리</a></li>
			</ul></li>
	</ul>
</div>
<%@page import="dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
System.out.println("loginUser : "+loginUser);
%>
<div id="header">
	<div class="util">
		<div class="inner">
			<ul>
				<% if(loginUser == null) { %>
				<li><a href="/Login">로그인</a></li>
				<li><a href="/MemberJoin.me">회원가입</a></li>	
				<% } else { %>
				<li><a href="/Logout">로그아웃</a></li>
				<li><a href="/MyPage">마이페이지</a></li>
				<li><a href="/CartList.co">장바구니</a></li>
				<% } %>
				<li><a href="OrderList.help">고객센터</a></li>
			</ul>
		</div><!-- // inner -->
	</div><!-- // util -->
	
	<div class="inner">
		<h1><a href="/index.do"><em>SHOPPING</em> MALL</a></h1>
		
		<style type="text/css">
			.all-search-area {position:absolute;top:34px;left:50%;margin-left:-153px;}
			.all-search-area {}
			
			input.default {border:1px solid #ddd;box-sizing:border-box;}
			
			.all-search-area input.default {width:256px;height:30px;padding:8px;vertical-align:top;}
			.all-search-area .button {padding:8px 12px;background-color:#40b3ff;font-weight:bold;color:#fff;}
		</style>
		
		<div class="all-search-area">
			<form action="/Search.se" method="post" name="allSearchForm">
				<fieldset>
					<legend>검색어 입력</legend>
					<input type="search" name="allSearch" class="default" /><a href="javascript:allSearchForm.submit();" class="button">검색</a>
				</fieldset>
			</form>
		</div><!-- // all-search-area -->
		
	</div><!-- // inner -->
	
	<div id="gnb">
		<div class="inner">
			<ul>
				<li <c:if test="${kind == '1'}">class="current"</c:if>><a href="/ProductKind.go?kind=1">아우터</a></li>
				<li <c:if test="${kind == '2'}">class="current"</c:if>><a href="/ProductKind.go?kind=2">상의</a></li>
				<li <c:if test="${kind == '3'}">class="current"</c:if>><a href="/ProductKind.go?kind=3">하의</a></li>
				<li <c:if test="${kind == '4'}">class="current"</c:if>><a href="/ProductKind.go?kind=4">치마</a></li>
				<li <c:if test="${kind == '5'}">class="current"</c:if>><a href="/ProductKind.go?kind=5">원피스</a></li>
				<li <c:if test="${kind == '6'}">class="current"</c:if>><a href="/ProductKind.go?kind=6">가방/슈즈</a></li>
				<li <c:if test="${kind == '7'}">class="current"</c:if>><a href="/ProductKind.go?kind=7">악세사리</a></li>
			</ul>
		</div><!-- // inner -->
	</div><!-- // gnb -->
</div><!-- // header -->
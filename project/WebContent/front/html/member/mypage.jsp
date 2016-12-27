<%@page import="dto.CustomerOrderVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/front/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/front/js/ui.js"></script></head>
<body>
<div id="wrap">
	<%@ include file="/front/html/include/header.jsp" %>
	<div id="container">
		<div class="inner">
			<div class="contents">
				<div class="hgroup thin-bottom">
					<h2>마이페이지</h2>
				</div><!-- // hgroup -->
				
				<div class="lnb">
					<span class="title">마이페이지</span>
					
					<ul>
						<li>
							<strong>나의 쇼핑 내역</strong>
							<ul>
								<li><a href="#">주문내역</a></li>
							</ul>
						</li>
						<li>
							<strong>나의 정보 관리</strong>
							<ul>
								<li><a href="/Profile">회원정보 수정</a></li>
								<li><a href="#">회원탈퇴</a></li>
							</ul>
						</li>
					</ul>
				</div><!-- // lnb -->

			</div><!-- // contents -->
		</div><!-- // inner -->
	</div><!-- // container -->
	
</div><!-- // wrap -->
</body>
</html>
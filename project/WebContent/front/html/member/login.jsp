<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/front/css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/front/js/ui.js"></script>
</head>
<body>
<div id="wrap">
	<%@ include file="/front/html/include/header.jsp" %>

	<div id="container">
		<div class="thin-box">
			<div class="hgroup thin-bottom">
				<h2>로그인</h2>
				<p>쇼핑몰에 처음이세요? 아직 아이디가 없다면 회원가입을 해주세요!</p>
			</div><!-- // hgroup -->
			
			<div class="login">
				<form name="memberLoginForm" action="MemberLoginAction.me" method="post">
					<fieldset>
						<legend>로그인</legend>
						
						<ul>
							<li><label for="id">아이디</label> <input type="text" name="id" id="id" value="joonhojeon" /></li>
							<li><label for="password">패스워드</label> <input type="text" name="password" id="password" value="varrnp5kdh%" /></li>
						</ul>
						
						<span class="login-button">
							<a href="javascript:memberLoginForm.submit();" class="button submit">로그인</a>
						</span><!-- // login-button -->
					</fieldset>
				</form>
			</div><!-- // login -->
			
			<div class="button-area align-center">
				<a href="#" class="button normal medium">아이디 찾기</a>
				<a href="#" class="button normal medium">비밀번호 찾기</a>
				<a href="/MemberJoin.me" class="button normal medium">회원가입</a>
			</div><!-- // button-area -->
		</div><!-- // thin-box -->
	</div><!-- // container -->
</div><!-- // wrap -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/front/css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
	<%@ include file="/front/html/include/header.jsp" %>
	<%
	if(loginUser != null) { 
		response.sendRedirect("/index.do");
	}
	%>
	<div id="container">
		<div class="thin-box">
			<div class="hgroup thin-bottom">
				<h2>회원가입</h2>
				<p>* 표시는 필수 입력정보 입니다.</p>
			</div><!-- // hgroup -->
			
			<form name="memberJoinForm" action="MemberJoinAction.me" method="post">
				<table class="default">
					<caption>이름, 아이디, 비밀번호, 비밀번호 확인, 생년월일, 주소, 전화번호, 휴대폰 번호, 이메일을 입력할 수 있습니다.</caption>
					
					<tbody>
						<tr>
							<th><label for="name">이름</label></th>
							<td><input type="text" name="name" id="name" value="전준호" /></td>
						</tr>
						<tr>
							<th><label for="id">아이디</label></th>
							<td><input type="text" name="id" id="id" value="joonhojeon" /></td>
						</tr>
						<tr>
							<th><label for="password">비밀번호</label></th>
							<td><input type="password" name="password" id="password" value="varrnp5kdh%" /></td>
						</tr>
						<tr>
							<th><label for="password-check">비밀번호 확인</label></th>
							<td><input type="password" name="password-check" id="password-check" value="varrnp5kdh%" /></td>
						</tr>
						<tr>
							<th><label for="birthday">생년월일</label></th>
							<td>
								<span class="input-area-type3">
									<span class="area">
										<input type="text" name="birthday1" id="birthday" value="1988" />
									</span><!-- // area -->
								
									<span class="area">
										<select name="birthday2">
											<option value="">-선택-</option>
											<option value="01" selected>1월</option>
											<option value="02">2월</option>
											<option value="03">3월</option>
											<option value="04">4월</option>
											<option value="05">5월</option>
											<option value="06">6월</option>
											<option value="07">7월</option>
											<option value="08">8월</option>
											<option value="09">9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
										</select>
									</span><!-- // area -->
									
									<span class="area">
										<input type="text" name="birthday3" value="22" />
									</span><!-- // area -->
								</span><!-- // input-area-type3 -->
							</td>
						</tr>
						<tr>
							<th><label for="postcode">우편번호</label></th>
							<td>
								<span class="input-area-type3">
									<span class="area">
										<input type="text" name="postcode1" id="postcode" value="153" />
									</span><!-- // area -->
									
									<span class="area">
										<input type="text" name="postcode2" value="023" />
									</span><!-- // area -->
									
									<span class="area">
										<a href="javascript:;">우편번호 찾기</a>
									</span><!-- // area -->
								</span><!-- // input-area-type3 -->
							</td>
						</tr>
						<tr>
							<th><label for="address">주소</label></th>
							<td><input type="text" name="address" value="서울시 금천구 가산동 두산 위브 아파트 116동 901호" /></td>
						</tr>
						<tr>
							<th><label for="tel">전화번호</label></th>
							<td>
								<span class="input-area-type3">
									<span class="area">
										<input type="text" name="tel1" id="tel" value="010" />
									</span><!-- // area -->
									
									<span class="area">
										<input type="text" name="tel2" value="9941" />
									</span><!-- // area -->
									
									<span class="area">
										<input type="text" name="tel3" value="8604" />
									</span><!-- // area -->
								</span><!-- // input-area-type3 -->
							</td>
						</tr>
						<tr>
							<th><label for="phone">휴대폰 번호</label></th>
							<td>
								<span class="input-area-type3">
									<span class="area">
										<select name="phone1" id="phone">
											<option value="">-선택-</option>
											<option value="010" selected>010</option>
											<option value="011">011</option>
											<option value="016">016</option>
										</select>
									</span><!-- // area -->
									
									<span class="area">
										<input type="text" name="phone2" value="9941" />
									</span><!-- // area -->
									
									<span class="area">
										<input type="text" name="phone3" value="8604" />
									</span><!-- // area -->
								</span><!-- // input-area-type3 -->
							</td>
						</tr>
						<tr>
							<th><label for="email">이메일</label></th>
							<td>
								<span class="input-area-type3">
									<span class="area">
										<input type="text" name="email1" id="email" value="joonhojeon" />
									</span><!-- // area -->
									
									<span class="area">
										@
									</span><!-- // area -->
									
									<span class="area">
										<input type="text" name="email2" value="naver.com" />
									</span><!-- // area -->
								</span><!-- // input-area-type3 -->
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="button-area align-center">
					<a href="javascript:memberJoinForm.submit();" class="button submit medium">회원가입</a>
					<a href="javascript:history.go(-1);" class="button normal medium">뒤로가기</a>
				</div><!-- // button-area -->
			</form>
		</div><!-- // thin-box -->
	</div><!-- // container -->
	
</div><!-- // wrap -->
</body>
</html>
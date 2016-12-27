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
	
	<div id="container">
			<table border="1">
				<caption>이름, 아이디, 비밀번호, 비밀번호 확인, 생년월일, 주소, 전화번호, 휴대폰 번호, 이메일을 확인할 수 있습니다.</caption>
				<tbody>
					<tr>
						<th><label for="name">이름</label></th>
						<td colspan="2">${loginUser.member_name }</td>
					</tr>
					<tr>
						<th><label for="id">아이디</label></th>
						<td>${loginUser.member_id }</td>
					</tr>
					<tr>
						<th><label for="birthday">생년월일</label></th>
						<td>${loginUser.member_birthday }</td>
					</tr>
					<tr>
						<th><label for="postcode">우편번호</label></th>
						<td colspan="2">${loginUser.member_postcode }</td>
					</tr>
					<tr>
						<th><label for="address">주소</label></th>
						<td colspan="2">${loginUser.member_address }</td>
					</tr>
					<tr>
						<th><label for="tel">전화번호</label></th>
						<td colspan="2">${loginUser.member_tel }</td>
					</tr>
					<tr>
						<th><label for="phone">휴대폰 번호</label></th>
						<td colspan="2">${loginUser.member_phone }</td>
					</tr>
					<tr>
						<th><label for="email">이메일</label></th>
						<td>${loginUser.member_email }</td>
					</tr>
				</tbody>
			</table>
			
			<a href="/index.do">메인으로</a>
	</div><!-- // container -->
	
</div><!-- // wrap -->
</body>
</html>
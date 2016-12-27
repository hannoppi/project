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
	if(loginUser == null) { 
		response.sendRedirect("/index.do");
	}
	%>
	<div id="container">
		<form name="memberUserCheckForm" action="ProfileModify.me" method="post">
			<input type="text" name="id" value="${loginUser.member_id }" />
			<table border="1">
				<caption>이름, 아이디, 비밀번호, 비밀번호 확인, 생년월일, 주소, 전화번호, 휴대폰 번호, 이메일을 수정할 수 있습니다.</caption>
				<tbody>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" name="password" value="varrnp5kdh%" /></td>
					</tr>
				</tbody>
			</table>
			
			<a href="javascript:memberUserCheckForm.submit();">확인</a>
			<a href="javascript:history.go(-1);;">뒤로가기</a>
		</form>
	</div><!-- // container -->
	
</div><!-- // wrap -->
</body>
</html>
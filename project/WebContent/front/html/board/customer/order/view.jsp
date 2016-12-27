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
		<div class="lnb">
			<ul>
				<li><a href="#">주문관련</a></li>
			</ul>
		</div><!-- // lnb -->
		
			<table border="1" width="100%">
				<caption></caption>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${board.customerorder_subject }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${board.customerorder_content }</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>${board.customerorder_file }</td>
					</tr>
				</tbody>
			</table>
			
			<a href="${board.customerorder_number }">수정</a>
			<a href="${board.customerorder_number }">삭제</a>
			<a href="/OrderList.help">목록</a>
	</div><!-- // container -->
	
</div><!-- // wrap -->
</body>
</html>
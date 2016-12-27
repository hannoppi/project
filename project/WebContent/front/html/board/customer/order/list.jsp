<%@page import="java.text.SimpleDateFormat"%>
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
<link href="/front/css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
List<CustomerOrderVO> boardList = (List<CustomerOrderVO>) request.getAttribute("orderBoardList");
%>

<%
int nowpage = ((Integer) request.getAttribute("page")).intValue();
System.out.println("★nowpage : "+nowpage);

int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
System.out.println("★maxpage : "+maxpage);

int startpage = ((Integer) request.getAttribute("startpage")).intValue();
System.out.println("★startpage : "+startpage);

int endpage = ((Integer) request.getAttribute("endpage")).intValue();
System.out.println("★endpage : "+endpage);
%>
<div id="wrap">
	<%@ include file="/front/html/include/header.jsp" %>
	<div id="container">
		<div class="inner">
			<div class="contents">
				<div class="hgroup type2">
					<h2>주문관련</h2>
				</div><!-- // hgroup -->
			
				<div class="lnb">
					<span class="title">고객센터</span>
					
					<ul>
						<li>
							<strong>자주하는 질문</strong>
							<ul>
								<li><a href="#">주문관련</a></li>
								<li><a href="#">결제관련</a></li>
								<li><a href="#">배송관련</a></li>
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
			
			
				<div class="accordion-menu">
					<ul>
						<li><a href="#">상품을 주문하려면 어떻게 해야하나요?</a></li>
						<li><a href="#">상품을 주문하려면 어떻게 해야하나요?</a></li>
						<li><a href="#">상품을 주문하려면 어떻게 해야하나요?</a></li>
						<li><a href="#">상품을 주문하려면 어떻게 해야하나요?</a></li>
						<li><a href="#">상품을 주문하려면 어떻게 해야하나요?</a></li>
					</ul>
				</div><!-- // accordion-menu -->
				
				<em class="total-count">총 게시물 <span>${listCount }</span> 개</em>
				
				<table class="default board">
					<caption></caption>
					<colgroup>
						<col style="width:10%;" />
						<col />
						<col style="width:20%;" />
						<col style="width:20%;" />
						<col style="width:10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						
						<%
							for(int i = 0; i < boardList.size(); i++) {
								CustomerOrderVO board = boardList.get(i);
						%>
							<tr>
								<td><%=board.getCustomerorder_number() %></td>
								<td class="subject"><a href="/OrderView.help?num=<%=board.getCustomerorder_number() %>"><%=board.getCustomerorder_subject() %></a></td>
								<td><%=board.getCustomerorder_name() %></td>
								<td><%=board.getCustomerorder_regdate() %></td>
								<td><%=board.getCustomerorder_readcount() %></td>
							</tr>
						<% } %>
					</tbody>
				</table>
				
				<div class="paging">
					<% if(nowpage <= 1) { %>
					<a href="javascript:;" class="button">&lt;</a>
					<% } else { %>
					<a href="OrderList.help?page=<%=nowpage-1 %>" class="button">&lt;</a>
					<% } %>
					
					<%for(int i = startpage; i <= endpage; i++) {
						if(i == nowpage) { %>
							<a href="OrderList.help?page=<%=i %>" class="button current"><%=i %></a>
					<% } else { %>
							<a href="OrderList.help?page=<%=i %>" class="button"><%=i %></a>
					<% }
					} %>
					
					<% if(nowpage >= maxpage) { %>
					<a href="javascript:;" class="button">&gt;</a>
					<% } else { %>
					<a href="OrderList.help?page=<%=nowpage+1 %>" class="button">&gt;</a>
					<% } %>
					
				</div><!-- // paging -->
				<div class="board-util">
					<a href="/OrderWrite.help" class="button submit small">등록</a>
				
					<div class="search-area">
						<form name="boardSearchForm" action="BoardSearchAction.bo" method="post">
							<fieldset>
								<legend>검색어 입력</legend>
								
								<select class="default" name="search">
									<option>제목</option>
									<option>내용</option>
									<option>작성자</option>
								</select>
								
								<input type="text" name="" class="default" />
								
								<a href="javascript:boardSearchForm.submit();" class="button">검색</a>
							</fieldset>
						</form>
					</div><!-- // search-area -->
				</div><!-- // board-util -->
				
			</div><!-- // contents -->
		</div><!-- // inner -->
	</div><!-- // container -->
	
</div><!-- // wrap -->
</body>
</html>
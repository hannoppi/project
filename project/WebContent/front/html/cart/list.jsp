<%@page import="dto.CustomerOrderVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<div class="cart-list">
			<div class="inner">
				<div class="hgroup thin-bottom">
					<h2>장바구니</h2>
				</div><!-- // hgroup -->
				
				<form method="post" name="cartListForm">
					<table class="default">
						<caption></caption>
						<colgroup>
							<col style="width:5%;" />
							<col />
							<col style="width:10%;" />
							<col style="width:10%;" />
							<col style="width:20%;" />
						</colgroup>
						
						<thead>
							<tr>
								<th><input type="checkbox" name="all" value="" /></th>
								<th>상품명</th>
								<th>수량</th>
								<th>상품금액</th>
								<th>등록일</th>
							</tr>
						</thead>
						
						<tbody>
						<c:forEach var="cartList" items="${cartList }">
							<tr>
								<td><input type="checkbox" name="cseq" value="${cartList.cseq }" /></td>
								<td class="subject"><a href="/ProductView.go?pseq=${cartList.pseq }">${cartList.pname }</a></td>
								<td>${cartList.quantity }</td>
								<td><fmt:formatNumber value="${cartList.price2 * cartList.quantity}" /></td>
								<td><fmt:formatDate value="${cartList.indate }" type="date" /></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
					<div class="product-button-area">
						<a href="javascript:go_cart_delete();">삭제하기</a>
					</div><!-- // product-button-area -->
					
					<style type="text/css">
						.cart-total-price {margin:24px 0;padding:24px;border:1px solid #ddd;border-top:2px solid #000;}
						.cart-total-price dt {display:inline-block;font-size:18px;font-weight:bold;}
						.cart-total-price dd {display:inline-block;font-size:18px;font-weight:bold;color:red;}
					</style>
					
					<div class="cart-total-price">
						<dl>
							<dt>결제 예정 금액</dt>
							<dd><fmt:formatNumber value="${totalPrice }" type="currency" /> 원</dd>
						</dl>
					</div><!-- // cart-total-price -->
						
					<script type="text/javascript">
						function go_cart_delete() {
							document.cartListForm.action= '/CartDeleteAction.co';
							document.cartListForm.submit();
						}
					</script>
				</form>
			</div><!-- // inner -->
		</div><!-- // cart-list -->
	</div><!-- // container -->
	
</div><!-- // wrap -->
</body>
</html>
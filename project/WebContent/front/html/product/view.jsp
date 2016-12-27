<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="/front/css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
	<%@ include file="/front/html/include/header.jsp" %>
	
	<div id="container">
		<div class="product-view-area">
			<div class="inner">
					<span class="blind">상품 상세보기</span>
					
					<div class="wrap-contents">
						<div class="product-image">
							<img src="/front/upload/images/product/${product.image }" alt="${product.name }" />
						</div><!-- // product-image -->
						
						<div class="product-information">
							<div class="hgroup">
								<h2 class="title">No.${product.pseq } ${product.name }</h2>
							</div><!-- // hgroup -->
							
							<form action="/CartAddAction.co" method="post" name="productViewForm">
								<input type="hidden" name="pseq" value="${product.pseq }" />
								
								<table class="default">
									<caption></caption>
									<colgroup>
										<col style="width:30%" />
										<col />
									</colgroup>
									
									<tbody>
										<tr>
											<th>원가</th>
											<td>${product.price1 } 원</td>
										</tr>
										<tr>
											<th>판매가</th>
											<td>${product.price2 } 원</td>
										</tr>
										<tr>
											<th>판매가-원가</th>
											<td>${product.price3 } 원</td>
										</tr>
										<tr>
											<th>종류</th>
											<td>
												<c:choose>
													<c:when test="${product.kind == '1'}">
														아우터
													</c:when>
													<c:when test="${product.kind == '2'}">
														상의
													</c:when>
													<c:when test="${product.kind == '3'}">
														하의
													</c:when>
													<c:when test="${product.kind == '4'}">
														치마
													</c:when>
													<c:when test="${product.kind == '5'}">
														원피스
													</c:when>
													<c:when test="${product.kind == '6'}">
														가방/슈즈
													</c:when>
													<c:otherwise>
														악세사리
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<th>색상</th>
											<td></td>
										</tr>
										<tr>
											<th>사이즈</th>
											<td></td>
										</tr>
										<tr>
											<th>수량</th>
											<td><input type="text" name="quantity" value="1" />개</td>
										</tr>
										<tr>
											<th>판매 유/무</th>
											<td>
												<c:choose>
													<c:when test="${product.useyn == 'y'}">
														판매중
													</c:when>
													<c:otherwise>
														매진
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
								<c:choose>
									<c:when test="${product.bestyn == 'y'}">
										<tr>
											<th>베스트 상품 유/무</th>
											<td>가장 인기있는 상품</td>
										</tr>
									</c:when>
								</c:choose>
										<tr>
											<th>상품 등록일</th>
											<td>${product.indate }</td>
										</tr>
									</tbody>
								</table>
							
								<div class="product-button-area">
									<a href="javascript:productViewForm.submit();">장바구니</a>
									<!-- <a href="javascript:go_cart();">장바구니</a> -->
									<!-- <a href="javascript:go_order();">즉시구매</a> -->
								</div><!-- // product-button-area -->
							</form>
						</div><!-- // product-information -->
					</div><!-- // wrap-contents -->
					
					<div class="product-detail">
						${product.content }
					</div><!-- // product-detail -->
			</div><!-- // inner -->
		</div><!-- // product-view-area -->
	</div><!-- // container -->
</div><!-- // wrap -->
</body>
</html>
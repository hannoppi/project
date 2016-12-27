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
		<div class="category-list">
			<div class="inner">
				<div class="product-frame-type2">
					<ul class="product-list">
						<c:forEach var="kindProductList" items="${kindProductList }">
							<li class="item-area">
								<figure class="item">
									<a href="/ProductView.go?pseq=${kindProductList.pseq }"><img src="/front/upload/images/product/${kindProductList.image }" alt="#" /></a>
									
									<figcaption class="information-area">
										<dl class="information">
											<dt class="title"><a href="/ProductView.go?pseq=${kindProductList.pseq }">${kindProductList.name }</a></dt>
											<dd class="desc">러블리한 헤어밴드랍니당 :)</dd>
											<dd class="price">${kindProductList.price2 }</dd>
										</dl><!-- // information -->
										
										<ul class="option-area">
											<li class="option">무료배송</li>
										</ul><!-- // option-area -->
									</figcaption><!-- // information -->
								</figure>
							</li><!-- // item-area -->
						</c:forEach>
					</ul><!-- // product-list -->
				</div><!-- // product-frame-type2 -->
			</div><!-- // inner -->
		</div><!-- // category-list -->
	</div><!-- // container -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</div><!-- // wrap -->
</body>
</html>
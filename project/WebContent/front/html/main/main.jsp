<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="/front/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/front/js/ui.js"></script>
</head>
<body>
<div id="wrap">
<%
String kind = (String) request.getParameter("kind");
System.out.println("★ kind");
%>
	<%@ include file="/front/html/include/header.jsp" %>
	
	<div id="container">
		<div class="visual-wide-slide-area">
			<div class="visual-wide-slide">
				<ul>
					<li><a href="#"><img src="/front/upload/images/slide/wide/img1.jpg" alt="" /></a></li>
					<li><a href="#"><img src="/front/upload/images/slide/wide/img2.jpg" alt="" /></a></li>
					<li><a href="#"><img src="/front/upload/images/slide/wide/img3.jpg" alt="" /></a></li>
					<li><a href="#"><img src="/front/upload/images/slide/wide/img4.jpg" alt="" /></a></li>
				</ul>
			</div><!-- // visual-wide-slide -->
			<ul class="control-bottom control-center">
				<li class="current"><a href="javascript:;">원피스 최대 ~50%</a></li>
				<li><a href="javascript:;">주말특가 최대 ~15%</a></li>
				<li><a href="javascript:;">주말특가 최대 ~15%</a></li>
				<li><a href="javascript:;">주말특가 최대 ~15%</a></li>
			</ul><!-- // control -->
		</div><!-- // visual-wide-slide-area -->
		
		<div class="inner">
			<div class="visual-slide-area">
				<div class="hgroup">
					<h2>따끈따끈 <em>신상소식</em></h2>
					<p>지금 막 새로나온 신상</p>
				</div><!-- // hgroup -->
				
				<div class="slide_gallery">
					<div class="slide_clone">
						<div class="box box1" style="float:left; width:960px; height:370px;">
							<span style="position:absolute; top:0; left:0; width:180px; height:180px; background:url('/front/upload/images/slide/normal/s1.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:0; left:190px; width:370px; height:370px; background:url('/front/upload/images/slide/normal/s2.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:0; left:570px; width:370px; height:180px; background:url('/front/upload/images/slide/normal/s3.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:190px; left:0; width:180px; height:180px; background:url('/front/upload/images/slide/normal/s1_1.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:190px; left:570px; width:180px; height:180px; background:url('/front/upload/images/slide/normal/s1_2.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:190px; left:760px; width:180px; height:180px; background:url('/front/upload/images/slide/normal/s1_3.jpg') 0 0 no-repeat;"></span>
						</div>
						<!-- box e -->
						<!-- <div class="box" style="float:left; width:960px; height:370px;">
							<span style="position:absolute; top:0; left:0; width:370px; height:370px; background:url('/front/upload/images/slide/normal/s2_1.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:0; left:380px; width:370px; height:370px; background:url('/front/upload/images/slide/normal/s2_2.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:0px; left:760px; width:180px; height:180px; background:url('/front/upload/images/slide/normal/s1_4.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:190px; left:760px; width:180px; height:180px; background:url('/front/upload/images/slide/normal/s1_5.jpg') 0 0 no-repeat;"></span>
						</div> -->
						<!-- box e -->
						<!-- <div class="box" style="float:left; width:940px; height:370px;">
							<span style="position:absolute; top:0; left:0; width:180px; height:180px; background:url('/front/upload/images/slide/normal/s1_6.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:0; left:190px; width:370px; height:180px; background:url('/front/upload/images/slide/normal/s3_1.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:0; left:570px; width:370px; height:370px; background:url('/front/upload/images/slide/normal/s2_3.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:190px; left:0px; width:180px; height:180px; background:url('/front/upload/images/slide/normal/s1_7.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:190px; left:190px; width:180px; height:180px; background:url('/front/upload/images/slide/normal/s1_8.jpg') 0 0 no-repeat;"></span>
							<span style="position:absolute; top:190px; left:380px; width:180px; height:180px; background:url('/front/upload/images/slide/normal/s1_9.jpg') 0 0 no-repeat;"></span>
						</div> -->
						<!-- box e -->
					</div>
				</div>
				<!-- slide_gallery e -->
			</div><!-- // visual-slide -->
			
			<div class="product-frame-type1">
				<div class="hgroup">
					<h2>잘나가는 <em>베스트 상품</em></h2>
					<p>지금 가장 인기 많은 상품</p>
				</div><!-- // hgroup -->
				
				<ul class="product-list">
					<c:forEach var="bestProduct" items="${bestProductList }">
						<li class="item-area">
							<figure class="item">
								<a href="/ProductView.go?pseq=${bestProduct.pseq }"><img src="/front/upload/images/product/${bestProduct.image }" alt="#" /></a>
								
								<figcaption class="information-area">
									<dl class="information">
										<dt class="title"><a href="/ProductView.go?pseq=${bestProduct.pseq }">${bestProduct.name }</a></dt>
										<dd class="desc">러블리한 헤어밴드랍니당 :)</dd>
										<dd class="price">${bestProduct.price2 }</dd>
									</dl><!-- // information -->
									
									<ul class="option-area">
										<li class="option">무료배송</li>
									</ul><!-- // option-area -->
								</figcaption><!-- // information -->
							</figure>
						</li><!-- // item-area -->
					</c:forEach>
				</ul><!-- // product-list -->
			</div><!-- // product-frame-type1 -->
		</div><!-- // inner -->
		
		<div class="inner">
			<div class="hgroup blind">
				<h2>쇼핑몰 <em>전체 상품</em></h2>
				<p>이것도 잘나가요!</p>
			</div><!-- // hgroup -->
			
			<div class="tab-menu">
				<span class="tab-button current"><a href="javascript:;" class="type">아우터</a></span>
				<div class="product-frame-type2">
					<ul class="product-list">
						<c:forEach var="outerList" items="${outerList }">
							<li class="item-area">
								<figure class="item">
									<a href="/ProductView.go?pseq=${outerList.pseq }"><img src="/front/upload/images/product/${outerList.image }" alt="#" /></a>
									
									<figcaption class="information-area">
										<ul class="color-code-area">
											<li class="color-code">검은색</li>
											<li class="color-code">검은색</li>
										</ul><!-- // color-code-area -->
										
										<dl class="information">
											<dt class="title"><a href="/ProductView.go?pseq=${outerList.pseq }">${outerList.name }</a></dt>
											<dd class="price">${outerList.price2 }</dd>
											<dd class="desc">러블리한 헤어밴드랍니당 :)</dd>
										</dl><!-- // information -->
										
										<ul class="option-area">
											<li class="option">무료배송</li>
										</ul><!-- // option-area -->
									<//figcaption><!-- // information -->
								</figure>
							</li><!-- // item-area -->
						</c:forEach>
					</ul><!-- // product-list -->
				</div><!-- // product-frame-type1 -->
			
				<span class="tab-button"><a href="javascript:;" class="type">상의</a></span>
				<div class="product-frame-type2">
					<ul class="product-list">
						<c:forEach var="topList" items="${topList }">
							<li class="item-area">
								<figure class="item">
									<a href="/ProductView.go?pseq=${topList.pseq }"><img src="/front/upload/images/product/${topList.image }" alt="#" /></a>
									
									<figcaption class="information-area">
										<ul class="color-code-area">
											<li class="color-code">검은색</li>
											<li class="color-code">검은색</li>
										</ul><!-- // color-code-area -->
										
										<dl class="information">
											<dt class="title"><a href="/ProductView.go?pseq=${topList.pseq }">${topList.name }</a></dt>
											<dd class="price">${topList.price2 }</dd>
											<dd class="desc">러블리한 헤어밴드랍니당 :)</dd>
										</dl><!-- // information -->
										
										<ul class="option-area">
											<li class="option">무료배송</li>
										</ul><!-- // option-area -->
									<//figcaption><!-- // information -->
								</figure>
							</li><!-- // item-area -->
						</c:forEach>
					</ul><!-- // product-list -->
				</div><!-- // product-frame-type1 -->
				
				<span class="tab-button"><a href="javascript:;" class="type">하의</a></span>
				<div class="product-frame-type2">
					<ul class="product-list">
						<c:forEach var="bottomList" items="${bottomList }">
							<li class="item-area">
								<figure class="item">
									<a href="/ProductView.go?pseq=${bottomList.pseq }"><img src="/front/upload/images/product/${bottomList.image }" alt="#" /></a>
									
									<figcaption class="information-area">
										<ul class="color-code-area">
											<li class="color-code">검은색</li>
											<li class="color-code">검은색</li>
										</ul><!-- // color-code-area -->
										
										<dl class="information">
											<dt class="title"><a href="/ProductView.go?pseq=${bottomList.pseq }">${bottomList.name }</a></dt>
											<dd class="price">${bottomList.price2 }</dd>
											<dd class="desc">러블리한 헤어밴드랍니당 :)</dd>
										</dl><!-- // information -->
										
										<ul class="option-area">
											<li class="option">무료배송</li>
										</ul><!-- // option-area -->
									<//figcaption><!-- // information -->
								</figure>
							</li><!-- // item-area -->
						</c:forEach>
					</ul><!-- // product-list -->
				</div><!-- // product-frame-type1 -->
				
				<span class="tab-button"><a href="javascript:;" class="type">치마</a></span>
				<div class="product-frame-type2">
					<ul class="product-list">
						<c:forEach var="skirtList" items="${skirtList }">
							<li class="item-area">
								<figure class="item">
									<a href="/ProductView.go?pseq=${skirtList.pseq }"><img src="/front/upload/images/product/${skirtList.image }" alt="#" /></a>
									
									<figcaption class="information-area">
										<ul class="color-code-area">
											<li class="color-code">검은색</li>
											<li class="color-code">검은색</li>
										</ul><!-- // color-code-area -->
										
										<dl class="information">
											<dt class="title"><a href="/ProductView.go?pseq=${skirtList.pseq }">${skirtList.name }</a></dt>
											<dd class="price">${skirtList.price2 }</dd>
											<dd class="desc">러블리한 헤어밴드랍니당 :)</dd>
										</dl><!-- // information -->
										
										<ul class="option-area">
											<li class="option">무료배송</li>
										</ul><!-- // option-area -->
									<//figcaption><!-- // information -->
								</figure>
							</li><!-- // item-area -->
						</c:forEach>
					</ul><!-- // product-list -->
				</div><!-- // product-frame-type1 -->
				
				<span class="tab-button"><a href="javascript:;" class="type">원피스</a></span>
				<div class="product-frame-type2">
					<ul class="product-list">
						<c:forEach var="onepieceList" items="${onepieceList }">
							<li class="item-area">
								<figure class="item">
									<a href="/ProductView.go?pseq=${onepieceList.pseq }"><img src="/front/upload/images/product/${onepieceList.image }" alt="#" /></a>
									
									<figcaption class="information-area">
										<ul class="color-code-area">
											<li class="color-code">검은색</li>
											<li class="color-code">검은색</li>
										</ul><!-- // color-code-area -->
										
										<dl class="information">
											<dt class="title"><a href="/ProductView.go?pseq=${onepieceList.pseq }">${onepieceList.name }</a></dt>
											<dd class="price">${onepieceList.price2 }</dd>
											<dd class="desc">러블리한 헤어밴드랍니당 :)</dd>
										</dl><!-- // information -->
										
										<ul class="option-area">
											<li class="option">무료배송</li>
										</ul><!-- // option-area -->
									<//figcaption><!-- // information -->
								</figure>
							</li><!-- // item-area -->
						</c:forEach>
					</ul><!-- // product-list -->
				</div><!-- // product-frame-type1 -->
				
				<span class="tab-button"><a href="javascript:;" class="type">가방/슈즈</a></span>
				<div class="product-frame-type2">
					<ul class="product-list">
						<c:forEach var="bag_shoesList" items="${bag_shoesList }">
							<li class="item-area">
								<figure class="item">
									<a href="/ProductView.go?pseq=${bag_shoesList.pseq }"><img src="/front/upload/images/product/${bag_shoesList.image }" alt="#" /></a>
									
									<figcaption class="information-area">
										<ul class="color-code-area">
											<li class="color-code">검은색</li>
											<li class="color-code">검은색</li>
										</ul><!-- // color-code-area -->
										
										<dl class="information">
											<dt class="title"><a href="/ProductView.go?pseq=${bag_shoesList.pseq }">${bag_shoesList.name }</a></dt>
											<dd class="price">${bag_shoesList.price2 }</dd>
											<dd class="desc">러블리한 헤어밴드랍니당 :)</dd>
										</dl><!-- // information -->
										
										<ul class="option-area">
											<li class="option">무료배송</li>
										</ul><!-- // option-area -->
									<//figcaption><!-- // information -->
								</figure>
							</li><!-- // item-area -->
						</c:forEach>
					</ul><!-- // product-list -->
				</div><!-- // product-frame-type1 -->
				
				<span class="tab-button"><a href="javascript:;" class="type">악세사리</a></span>
				<div class="product-frame-type2">
					<ul class="product-list">
						<c:forEach var="accessoryList" items="${accessoryList }">
							<li class="item-area">
								<figure class="item">
									<a href="/ProductView.go?pseq=${accessoryList.pseq }"><img src="/front/upload/images/product/${accessoryList.image }" alt="#" /></a>
									
									<figcaption class="information-area">
										<ul class="color-code-area">
											<li class="color-code">검은색</li>
											<li class="color-code">검은색</li>
										</ul><!-- // color-code-area -->
										
										<dl class="information">
											<dt class="title"><a href="/ProductView.go?pseq=${accessoryList.pseq }">${accessoryList.name }</a></dt>
											<dd class="price">${accessoryList.price2 }</dd>
											<dd class="desc">러블리한 헤어밴드랍니당 :)</dd>
										</dl><!-- // information -->
										
										<ul class="option-area">
											<li class="option">무료배송</li>
										</ul><!-- // option-area -->
									<//figcaption><!-- // information -->
								</figure>
							</li><!-- // item-area -->
						</c:forEach>
					</ul><!-- // product-list -->
				</div><!-- // product-frame-type1 -->
			</div><!-- // tab-menu -->
		</div><!-- // inner -->
	</div><!-- // container -->
	
	
	
	
	
	
	
			<footer>	
			<div id="footer">
				<div class="footer_inner">
	<div class="footer_util">
		<ul>
			<li><a href="#">회사소개</a></li>
			<li><a href="#">이용약관</a></li>
			<li><a href="#">개인정보취급방침</a></li>
			<li><a href="#">고객센터</a></li>
			<li><a href="#">광고안내</a></li>
			<li class="last"><a href="#">제휴문의</a></li>
		</ul>
	</div>
	<!-- footer_util e -->
	<div class="footer_info_wrap">
		<div class="footer_logo">
			로고
		</div>
		<!-- footer_logo e -->
		<div class="footer_middle">
			<div class="f_trouble">
				<h3>소비자피해보상보험</h3>
				<p>
					고객님은 안전거래를 위해 현금 등으로 결제시 금액에 관계없이 저희 쇼핑몰에 가입한 구매<br />
					안전서비스, 소비자피해보상보험 서비스를 이용하실 수 있습니다.<br />
					<span>보상대상 : 미배송, 반품/환불거부, 쇼핑몰 폐업</span>
				</p>
			</div>
			<!-- f_trouble e -->
			<div class="f_company">
				<h3>(주)쇼핑몰</h3>
				<address>
					서울시 강남구 테헤란로 1004-777 (고덕동 래미안 힐스테이트) 스테이트 타워 1층<br />
					대표이사 : 홍길동<br />
					사업자등록번호 : 203-81-83631<br />
					통신판매업신고 제 2008-서울금천2001호 <a href="#">사업자정보확인</a>
				</address>
			</div>
			<!-- f_company e -->
			<div class="f_massage">
				<p>
					(주) 쇼핑몰의 사전 서면 동의 없이 사이트의 일체의 정보, 콘텐츠 및 UI등을 상업적 목적으로<br />
					전재, 전송, 스크랩 등 무단으로 사용할 수 없습니다.
				</p>
			</div>
			<!-- f_massage e -->
			<div class="copy">
				<p>Copyright  &copy; <b>Shopping Mall</b> All rights reserved.</p>
			</div>
		</div>
		<!-- footer_middle e -->
		<div class="f_customer">
			<strong class="hidden">고객센터</strong>
			<p class="tel">전화번호 15448949</p>
			<p>Fax : 02 1234 5678</p>
			<p>
				<a href="mailto:shoppingMall@webmaster.com">
					<span>shoppingMall@webmaster.com</span>
				</a>
			</p>
			<p>
				상담가능시간 : 10:00 ~ 18:00<br />
				토, 공휴일 휴무
			</p>
			<p class="f_btn"><a href="#" ><img src="../images/main/11.gif" alt="1:1 고객상담 바로가기" /><a/>
			<a href="#"><img src="../images/main/call.gif" alt="상담 전화 전 클릭 하세요" /></a>
			</p>
			<div class="family_site">
				<ul>
					<li><a href="../index.html">데스크탑</a></li>
					<li><a href="#">모바일</a></li>
					<li class="last"><a href="#">태블릿</a></li>
				</ul>
			</div>
			<!-- family_site e -->
		</div>
		<!-- f_customer e -->
	</div>
	<!-- footer_info_wrap e -->
</div>				<!-- footer_inner e -->
			</div>
			<!-- footer e -->
		</footer>
	
	
	
	
	
	
	
	
	
	
</div><!-- // wrap -->
</body>
</html>
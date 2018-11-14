<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>CODE HERE</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Destino project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="styles/offers_responsive.css">
<style>
.writeBoard{	
	display: inline-block;
	width: 200px;
	height: 56px;
	background: #fe3c52;
	text-align: center;
	margin: 0 auto;
	width: 33%;
	height: 56px;
	font-size: 16px;
	font-weight: 500;
	color: #FFFFFF;
	line-height: 52px;
	padding-left: 46px;
	padding-right: 46px;
	background: #fe435b !important;
	-webkit-transform: translateY(14px);
	-moz-transform: translateY(14px);
	-ms-transform: translateY(14px);
	-o-transform: translateY(14px);
	transform: translateY(14px);
	border: none;
	outline: none;
	cursor: pointer;
}
.writeBoard:hover{
	opacity: 0.8;
}
</style>
</head>
<body>

<div class="super_container">
	
	<!-- Header -->

	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="header_container d-flex flex-row align-items-center justify-content-start">
					
											

						<!-- Main Navigation -->
						<nav class="main_nav ml-auto">
							<ul class="main_nav_list">
								<c:if test="${sessionScope.loginId ne null}">
								<li name="welcome" class="main_nav_item" style="color: #FFFFFF; left: auto;">${sessionScope.loginName}(${sessionScope.loginId})님 환영합니다</li>
								</c:if>
								<li class="main_nav_item"><a href="./">Home</a></li>
								<c:if test="${sessionScope.loginId eq null}">
								<li class="main_nav_item"><a href="joinForm">Join</a></li>
								</c:if>
								<li class="main_nav_item active"><a href="listboard">Errors Q&A Board</a></li>
							</ul>
						</nav>

						<!-- Search -->
						<div class="search">
							<form action="#" class="search_form">
								<input type="search" name="search_input" class="search_input ctrl_class" required="required" placeholder="Keyword">
								<button type="submit" class="search_button ml-auto ctrl_class"><img src="images/search.png" alt=""></button>
							</form>
						</div>

						<!-- Hamburger -->
						<div class="hamburger ml-auto"><i class="fa fa-bars" aria-hidden="true"></i></div>

					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Menu -->

	<div class="menu_container menu_mm">

		<!-- Menu Close Button -->
		<div class="menu_close_container">
			<div class="menu_close"></div>
		</div>

		<!-- Menu Items -->
		<div class="menu_inner menu_mm">
			<div class="menu menu_mm">
				<div class="menu_search_form_container">
					<form action="#" id="menu_search_form">
						<input type="search" class="menu_search_input menu_mm">
						<button id="menu_search_submit" class="menu_search_submit" type="submit"><img src="images/search_2.png" alt=""></button>
					</form>
				</div>
				<ul class="menu_list menu_mm">
					<li class="menu_item menu_mm"><a href=${ pageContext.request.contextPath}>Home</a></li>
					<c:if test="${sessionScope.loginId eq null}">
					<li class="menu_item menu_mm"><a href="#">Join</a></li>
					</c:if>
					<li class="menu_item menu_mm"><a href="listboard">Errors Q&A Board</a></li>
					<li class="menu_item menu_mm"><a href="ranking">My Page</a></li>
				</ul>

				<!-- Menu Social -->
				
				<div class="menu_social_container menu_mm">
					<ul class="menu_social menu_mm">
						<li class="menu_social_item menu_mm"><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
						<li class="menu_social_item menu_mm"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
						<li class="menu_social_item menu_mm"><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
						<li class="menu_social_item menu_mm"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
						<li class="menu_social_item menu_mm"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
					</ul>
				</div>

				<div class="menu_copyright menu_mm">Colorlib All rights reserved</div>
			</div>

		</div>

	</div>
	
	<!-- Home -->

	<div class="home">
		<!-- Image by https://unsplash.com/@peecho -->
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/offers.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_content">
						<div class="home_content_inner">
							<div class="home_title">Error Board</div>
							<div class="home_breadcrumbs">
								<ul class="home_breadcrumbs_list">
									<li class="home_breadcrumb"><a href="index.html">Home</a></li>
									<li class="home_breadcrumb">Error Board</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>

	

	<!-- Offers -->

	<div class="offers">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<h2>Most Clicked Error</h2>
						<div>Ask Your Errors</div><br/>
						<div>
						<input type="button" id="writeBoard" class="writeBoard" name="writeBoard" value="WRITE MY ERROR" onclick="location.href='writeForm'"/></div>
					</div>
				</div>
			</div>
			<div class="row filtering_row">
				<div class="col">
					<div class="sorting_group_1">
						<ul class="item_sorting">

							<li>
								<span class="sorting_text">Stars</span>
								<i class="fa fa-angle-down"></i>
								<ul>
									<li class="item_filter_btn" data-filter="*"><span>Show All</span></li>
									<li class="item_sorting_btn" data-isotope-option='{ "sortBy": "star" }'><span>조회수기준</span></li>
									<li class="item_filter_btn" data-filter=".rating_1"><span>0~20</span></li>
									<li class="item_filter_btn" data-filter=".rating_2"><span>21~30</span></li>
									<li class="item_filter_btn" data-filter=".rating_3"><span>31~40</span></li>
									<li class="item_filter_btn" data-filter=".rating_4"><span>41~50</span></li>
									<li class="item_filter_btn" data-filter=".rating_5"><span>50++</span></li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="sorting_group_2 clearfix">
						
						<div class="sorting_icons clearfix">
							<div class="detail_view"><i class="fa fa-bars" aria-hidden="true"></i></div>
							<div class="box_view"><i class="fa fa-th-large" aria-hidden="true"></i></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="items item_grid clearfix">
					
					<c:if test="${empty list}">
					<div class="item clearfix rating_5">
							<img src="images/empty1.jpg" alt="" style="margin: 0 auto;">
						</div>
					</c:if>
					
						<!-- Item -->
						<c:if test="${not empty list}">
							<c:forEach var="board" items="${list}">
							
							<!-- 조회수가 50이상인 경우 -->
								<c:if test="${board.hitcount >50 }">
								<div class="item clearfix rating_5">
							<div class="item_image">
							<c:if test="${empty board.savedfile}">
								<img alt="" src="resources/images/noimage.png">
							</c:if>
							<c:if test="${not empty board.savedfile}">
								<img style="width:285; height: 160;" src="download?boardnum=${board.boardnum}"/>
							</c:if>
							</div>
							<div class="item_content">
								<div class="item_price">${board.userid}</div>
								<div class="item_title">${board.title}</div>
								<ul>
									<li>HitCount::${board.hitcount}</li>
									<li>${board.regdate}</li>
									<li>${(board.hitcount/10)} star </li>
								</ul>								
								<div class="rating rating_5" data-rating="5">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
								<div class="item_text">${board.content}</div>
										<div class="item_more_link"><a href="detail?boardnum=${board.boardnum}">Read More</a></div>
									</div>
								</div>
								</c:if>	
								
								<!-- 조회수가 40이상인 경우 -->
								<c:if test="${board.hitcount >40&&board.hitcount<=50}">
								<div class="item clearfix rating_4">
							<div class="item_image">
							<c:if test="${empty board.savedfile}">
								<img alt="" src="resources/images/noimage.png">
							</c:if>
							<c:if test="${not empty board.savedfile}">
								<img style="width:285; height: 160;" src="download?boardnum=${board.boardnum}"/>
							</c:if>
							</div>
							<div class="item_content">
								<div class="item_price">${board.userid}</div>
								<div class="item_title">${board.title}</div>
								<ul>
									<li>HitCount::${board.hitcount}</li>
									<li>${board.regdate}</li>
									<li>${(board.hitcount/10)} star </li>
								</ul>								
								<div class="rating rating_4" data-rating="4">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
								<div class="item_text">${board.content}</div>
										<div class="item_more_link"><a href="detail?boardnum=${board.boardnum}">Read More</a></div>
									</div>
								</div>
								</c:if>	
								
								<!-- 조회수가 30이상인 경우 -->
								<c:if test="${board.hitcount >30 && board.hitcount<=40}">
								<div class="item clearfix rating_3">
							<div class="item_image">
							<c:if test="${empty board.savedfile}">
								<img alt="" src="resources/images/noimage.png">
							</c:if>
							<c:if test="${not empty board.savedfile}">
								<img style="width:285; height: 160;" src="download?boardnum=${board.boardnum}"/>
							</c:if>
							</div>
							<div class="item_content">
								<div class="item_price">${board.userid}</div>
								<div class="item_title">${board.title}</div>
								<ul>
									<li>HitCount::${board.hitcount}</li>
									<li>${board.regdate}</li>
									<li>${(board.hitcount/10)} star </li>
								</ul>								
								<div class="rating rating_3" data-rating="3">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
								<div class="item_text">${board.content}</div>
										<div class="item_more_link"><a href="detail?boardnum=${board.boardnum}">Read More</a></div>
									</div>
								</div>
								</c:if>	
								
								<!-- 조회수가 20이상인 경우 -->
								<c:if test="${board.hitcount >20 && board.hitcount<=30}">
								<div class="item clearfix rating_2">
							<div class="item_image">
							<c:if test="${empty board.savedfile}">
								<img alt="" src="resources/images/noimage.png">
							</c:if>
							<c:if test="${not empty board.savedfile}">
								<img style="width:285; height: 160;" src="download?boardnum=${board.boardnum}"/>
							</c:if>
							</div>
							<div class="item_content">
								<div class="item_price">${board.userid}</div>
								<div class="item_title">${board.title}</div>
								<ul>
									<li>HitCount::${board.hitcount}</li>
									<li>${board.regdate}</li>
									<li>${(board.hitcount/10)} star </li>
								</ul>								
								<div class="rating rating_2" data-rating="2">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
								<div class="item_text">${board.content}</div>
										<div class="item_more_link"><a href="detail?boardnum=${board.boardnum}">Read More</a></div>
									</div>
								</div>
								</c:if>	
								
								<!-- 조회수가 20미만인 경우 -->
								<c:if test="${board.hitcount<=20 }">
								<div class="item clearfix rating_1">
							<div class="item_image">
							<c:if test="${empty board.savedfile}">
								<img alt="" src="resources/images/noimage.png">
							</c:if>
							<c:if test="${not empty board.savedfile}">
								<img style="width:285; height: 160;" src="download?boardnum=${board.boardnum}"/>
							</c:if>
							</div>
							<div class="item_content">
								<div class="item_price">${board.userid}</div>
								<div class="item_title">${board.title}</div>
								<ul>
									<li>HitCount::${board.hitcount}</li>
									<li>${board.regdate}</li>
									<li>${(board.hitcount/10)} star </li>
								</ul>								
								<div class="rating rating_1" data-rating="1">
									<i class="fa fa-star"></i>
								</div>
								<div class="item_text">${board.content}</div>
										<div class="item_more_link"><a href="detail?boardnum=${board.boardnum}">Read More</a></div>
									</div>
								</div>
								</c:if>
															
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
								
								
			
			<!-- Paging -->
			<div class="row">
				<div class="col">					
					<div class="boardfooter">
		<c:if test="${navi.currentPage == navi.startPageGroup}">
		◁◁
		◀
		</c:if>	
		
		
		<c:if test="${navi.currentPage != navi.startPageGroup}">
		<a href="listboard?currentPage=${navi.currentPage - navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">◁◁</a>		
		<a href="listboard?currentPage=${navi.currentPage - 1}&searchItem=${searchItem}&searchWord=${searchWord}">◀</a>
		</c:if>
		
		<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<c:if test="${navi.currentPage == page}">
			<a href="listboard?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}" style="color:red">${page}</a> &nbsp;			
			</c:if>
			<c:if test="${navi.currentPage != page}">
			<a href="listboard?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}</a> &nbsp;
			</c:if>			
		</c:forEach>
		
		<c:if test="${navi.currentPage == navi.endPageGroup}">
		▶
		▷▷
		</c:if>
		
		<c:if test="${navi.currentPage != navi.endPageGroup}">
		<a href="listboard?currentPage=${navi.currentPage + 1}&searchItem=${searchItem}&searchWord=${searchWord}">▶</a>
		<a href="listboard?currentPage=${navi.currentPage + navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">▷▷</a>
		</c:if>
		
	</div>
				</div>
			</div>
		</div>
	</div>

	

<script src="js/jquery-3.3.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/greensock/TweenMax.min.js"></script>
<script src="plugins/greensock/TimelineMax.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/offers_custom.js"></script>

</body>
</html>
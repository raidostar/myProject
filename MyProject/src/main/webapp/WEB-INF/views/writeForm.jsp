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
<link rel="stylesheet" type="text/css" href="styles/join_styles.css">
<link rel="stylesheet" type="text/css" href="styles/join_responsive.css">
<style type="text/css">
input.upload {
  	width: 100%;
	height: 20px;
	border: none;
	outline: none;
	padding-left: 20px;
	padding-right: 20px;
	font-size: 50px;
	font-weight: 400;	
	line-height: 52px;
	color: black;	
	border: solid 2px rgba(255,255,255,0.5);
	background: transparent;
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
								<li class="main_nav_item "><a href="./">Home</a></li>
								<c:if test="${sessionScope.loginId eq null}">
								<li class="main_nav_item"><a href="joinForm">Join</a></li>
								</c:if>
								<li class="main_nav_item active"><a href="listboard">Errors Q&A Board</a></li>								
							</ul>
						</nav>

						<!-- Search -->
						<div class="search">
							<form action="#" class="search_form">
								<input type="search" name="search_input" class="search_input ctrl_class" required="required" placeholder="Keyword"/>
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
			</div>

		</div>

	</div>
	
	<!-- Home -->

	<div class="home">
		<!-- Image by https://unsplash.com/@peecho -->
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/programming.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_content">
						<div class="home_content_inner">
							<div class="home_title">Write Error</div>
							<div class="home_breadcrumbs">
								<ul class="home_breadcrumbs_list">
									<li class="home_breadcrumb"><a href=${ pageContext.request.contextPath}>Home</a></li>
									<li class="home_breadcrumb">Write Error</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Write Form -->
	<form action="write" method="post" enctype="multipart/form-data" id="write_form">
<div class="container">

      <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">

		
			
          <!-- Title -->
          <h2 class="mt-4"><input type="text" name="title" class="title" id="title" placeholder="Type Your Error"/></h2>
          

          <!-- Author -->
          <p class="lead">
            by
            <a href="ranking">${sessionScope.loginId }</a>
          </p>

          <hr>

          <!-- Date/Time -->
          <p>Posted on ${serverTime}</p>

          <hr>

          <!-- Preview Image -->

          <hr>

          <!-- Post Content -->
          <div class="lead">
          <div style="width: 100%;">
          <div style="z-index: 1">
          <input type="file" name="upload" class="destination find_input" style="height: 200px; color: graytext;"  draggable="true" />
          
          </div>
          <div style="z-index: 2; position: relative; bottom: 100px; left: 200px;">DRAG YOUR FILE HERE</div>
          </div>          
          <p><input type="text" name="content" class="destination find_input" id="content" placeholder="Enter your Error Message" style="height: 500px; color: graytext;"/></p>
          <div style="margin-bottom: 100px;">
          <input type="button" id="registerButton" class="button join_button" value="Register My Error" style="width: 40%; margin: 0 auto;"/> &nbsp; &nbsp; &nbsp; <input type="button" id="back" class="button join_button" value="Back" style="width: 40%; margin: 0 auto;" onclick="location.href='listboard'"/>
          </div>          
     </div>
     </div>
     </div>
     </div>
          </form>
          
	
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/greensock/TweenMax.min.js"></script>
<script src="plugins/greensock/TimelineMax.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/about_custom.js"></script>
<script>
$(function(){
	$('#registerButton').on('click', formSubmit);
})

function formSubmit(){
	var title = $('#title').val();
	var content = $('#content').val();	
	
	if(title.length <1 || content.length<1){
		alert("에러와 에러메시지를 정확히 입력해주세요");
		return;
	}
		var form = $('#write_form');
		form.submit();
}
</script>
</body>
</html>
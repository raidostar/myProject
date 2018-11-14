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
								<li class="main_nav_item active"><a href="joinForm">Join</a></li>
								</c:if>
								<li class="main_nav_item"><a href="listboard">Errors Q&A Board</a></li>								
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
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/landscape.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_content">
						<div class="home_content_inner">
							<div class="home_title">Join</div>
							<div class="home_breadcrumbs">
								<ul class="home_breadcrumbs_list">
									<li class="home_breadcrumb"><a href=${ pageContext.request.contextPath}>Home</a></li>
									<li class="home_breadcrumb">Join</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>

	<!-- Find Form -->

	<div class="find">
		<!-- Image by https://unsplash.com/@garciasaldana_ -->
		<div class="find_background_container prlx_parent">
			<div class="find_background prlx" style="background-image:url(images/find.jpg)"></div>
		</div>
		<!-- <div class="find_background parallax-window" data-parallax="scroll" data-image-src="images/find.jpg" data-speed="0.8"></div> -->
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="find_title text-center">Welcome to Code Helper</div>
				</div>
				<div class="col-12">
					<div class="find_form_container">
						<form method="post" action="join" id="join_form" class="join_form d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-md-between justify-content-start flex-wrap">
							<div class="find_item"></div>
							<div class="find_item">
								<div>ID</div>
								<input type="text" id="userid" name="userid" class="destination find_input" required="required" placeholder="ID를 입력"><p  id="idCheck"></p>
								<div>Password
								<input type="password" id="userpwd" name="userpwd" class="destination find_input" placeholder="PassWord를 입력"/></div><p  id="pwdCheck"></p>
								<div>Name
								<input type="text" id="username" name="username" class="destination find_input" placeholder="이름을 입력"/></div>
								<div>E-mail
								<div style="width: 45%;">
								<input type="text" id="emailID" name="emailID" class="destination find_input" placeholder="이메일ID"/>@
								<input type="text" id="emailDomain" name="emailDomain" class="destination find_input" placeholder="이메일DOMAIN"/>
								</div>
								
																
								</div>	
								<div align="right"><input type="button" id="joinButton" class="button join_button" value="JOIN" /></div>
								
							</div>
							<div class="find_item"></div>
							<div class="find_item"></div>
							
						</form>
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
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/about_custom.js"></script>
<script>
var isIdTrue;
var isPwdTrue;
var isEmailTrue;
$(function(){	
	
	$('#userid').on('keyup', idCheck);
	
	$('#userpwd').on('keyup',pwdCheck);	
	
	$('#joinButton').on('click', formSubmit);
	
});


function idCheck(){
	var userid = $('#userid').val();

	if(userid.length<5 || userid.length>10){			
		$('#idCheck').html("아이디는 5~10자로 입력해주세요");
		isIdTrue = false;
	}		
	else{
	$.ajax({
		method : 'GET',
		url : 'idCheck',
		data : "userid="+userid,
		dataType : 'text',
		contentType : 'application/json; charset:utf-8',
		success : function(memberCheck){
			if(memberCheck==0){
				$('#idCheck').html("이 아이디는 사용가능");				
				isIdTrue = true;				
			} else{
				$('#idCheck').html("이 아이디는 이미 있습니다.");
				isIdTrue = false;
			}
		}
	})
	}
}



function pwdCheck(){
	var userpwd = $('#userpwd').val();
	
	if(userpwd.length<6 || userpwd.length>12){
		$('#pwdCheck').html("비밀번호는 6~12자로 입력해주세요");
		isPwdTrue=false;
	} else{
		$('#pwdCheck').html("");		
		isPwdTrue=true;
	}
}

function formSubmit(){
	if(isIdTrue==true && isPwdTrue==true){
		var form = $('#join_form')
		form.submit();
	}	
}
</script>
</body>
</html>
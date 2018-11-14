<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html lang="en">


  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CODE HERE</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Destino project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/join_styles.css">
<link rel="stylesheet" type="text/css" href="styles/join_responsive.css">
    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/blog-post.css" rel="stylesheet">

<style>
	.button del_button{
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
.button del_button: hover{ 
	opacity: 0.8;
}
.button update_button{
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
.button update_button: hover{
	opacity: 0.8;
} 
</style>
  </head>

  <body>
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
					<li class="menu_item menu_mm"><a href=${pageContext.request.contextPath}>Home</a></li>
					<c:if test="${sessionScope.loginId eq null}">
					<li class="menu_item menu_mm"><a href="joinForm">Join</a></li>
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
							<div class="home_title">writeForm</div>
							<div class="home_breadcrumbs">
								<ul class="home_breadcrumbs_list">
									<li class="home_breadcrumb"><a href="./">Home</a></li>
									<li class="home_breadcrumb">writeForm</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>

    <!-- Page Content -->
    <div class="container" style="padding-bottom: 10px;">

      <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">

          <!-- Title -->
          <h1 class="mt-4">${board.title}</h1>

          <!-- Author -->
          <p class="lead">
            by
            <a href="ranking">${board.userid}</a>
          </p>

          <hr>

          <!-- Date/Time -->
          
          <p>${board.regdate}</p>		  
          <hr>

          <!-- Preview Image -->
          <c:if test="${not empty board.originalfile}">
          	<img class="img-fluid rounded" src="download?boardnum=${board.boardnum}" alt="">
          </c:if>
          <c:if test="${empty board.originalfile}">
          	<img class="img-fluid rounded" src="resources/images/noimage.png" alt="">
          </c:if>

          <hr>

          <!-- Post Content -->
          <p class="lead">
          ${board.content}
          </p>
          <c:if test="${board.userid eq sessionScope.loginId}">
          <div style="margin-bottom: 100px;">
          <input type="button" id="registerButton" class="button update_button" value="UPDATE" style="width: 40%; margin: 0 auto;" onclick="location.href='errorBoardUpdate?boardnum=${board.boardnum}'"/> 
          &nbsp; &nbsp; &nbsp; 
          <input type="button" id="back" class="button del_button" value="DELETE" style="width: 40%; margin: 0 auto;" onclick="location.href='delete?boardnum=${board.boardnum}'"/>
          </div>
          </c:if>
          <hr>
			
          <!-- Comments Form -->
          <div class="card my-4">
            <h5 class="card-header">Leave a Comment:</h5>
            <div class="card-body">
              <form>
              	<input type="hidden" id="replyId" value="${sessionScope.loginId}"/>
              	<input type="hidden" id="boardnum" value="${board.boardnum}">
                <div class="form-group">
                  <textarea class="form-control" rows="3" id="comment"></textarea>
                </div>
                <input type="button" id="insertReply"  class="btn btn-primary" value="Submit"/>
              </form>
            </div>
          </div>
<hr/>
          <!-- Single Comment -->
          <div class="media mb-4">
            <div class="media-body">
            <div id="result"></div>
            </div>
          </div>

          

        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

          <!-- Search Widget -->
          

          <!-- Categories Widget -->
          <div class="card my-4">
            <h5 class="card-header">Categories</h5>
            <div class="card-body">
              <div class="row">
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">Web Design</a>
                    </li>
                    <li>
                      <a href="#">HTML</a>
                    </li>
                    <li>
                      <a href="#">Freebies</a>
                    </li>
                  </ul>
                </div>
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">JavaScript</a>
                    </li>
                    <li>
                      <a href="#">CSS</a>
                    </li>
                    <li>
                      <a href="#">Tutorials</a>
                    </li>                    
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <!-- Side Widget -->
          <div class="card my-4">
            <h5 class="card-header">Best Answer</h5>
            <div class="card-body">
              Best Answer HERE
            </div>
          </div>

        </div>

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->



    <!-- Bootstrap core JavaScript -->
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
	<script src="plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="plugins/easing/easing.js"></script>
	<script src="plugins/parallax-js-master/parallax.min.js"></script>
	<script src="js/offers_custom.js"></script>
	<script>
		$(function(){
			init();
			$('#insertReply').on('click', insertReply);
		})
		
		function init(){
			var boardnum = $('#boardnum').val();
			$.ajax({
				method : 'get',
				url : 'answeredCheck',
				data : 'boardnum='+boardnum,
				success : function(res){
					if(res==1) {
						alert("replyAll방식::1");
						output1(boardnum);
					} else if(res==0){						
						alert("replyAll방식::2");
						output2(boardnum);
					}
				}
			})
		}
		
		//답변이 채택된 경우:: 추가적인 채택이 안 되도록 버튼과 채택 기능 삭제
		function output1(boardnum){			
			
			$.ajax({
				method : 'get',
				url : 'replyAll',
				data : 'boardnum='+boardnum,
				success : function(res){
					var replyAll = ' ';
					
					for(var i in res){
						
							replyAll +='<div class="replyContent">';
							if(res[i].bestreply==1){
							replyAll +='<p style="color:red;">★★★채택된 답변★★★</p>';
							}
							replyAll +='<p class="userid" style="color:black;">작성자::'+res[i].userid+'</p>';
							replyAll +='<p class="replytext" style>'+res[i].replytext+'</p>';
							replyAll +='<p class="regdate">'+res[i].regdate+'</p>';							
							replyAll +='</div><hr/>';
					}
					
					$('#result').html(replyAll);
					$('#comment').val("");
					
					$('.replyDelete').click(replyDeleteCheck);
				}
			})
		}
		
		//답변이 아직 미채택된 경우
		function output2(boardnum){			
			alert(boardnum);
			$.ajax({
				method : 'get',
				url : 'replyAll',
				data : 'boardnum='+boardnum,
				success : function(res){
					var replyAll = ' ';			
					for(var i in res){
							replyAll +='<div class="replyContent">';
							replyAll +='<p>replynum::'+res[i].replynum+'</p>';
							replyAll +='<p class="userid" style="color:black;">작성자::'+res[i].userid+'</p>';
							replyAll +='<p class="replytext">'+res[i].replytext+'</p>';
							replyAll +='<p class="regdate">'+res[i].regdate+'</p>';
							replyAll +='<input class="recommend" data-rno=" '+res[i].replynum+' " type="button" value="답변채택"/>';
							replyAll +='<input class="replyDelete" data-rno=" '+res[i].replynum+' " type="button" value="댓글삭제"/>';
							replyAll +='</div>';
					}			
					$('#result').html(replyAll);
					$('#comment').val("");
					
					$('.replyDelete').click(replyDeleteCheck);
					$('.recommend').click(recommendCheck);
				}
			})						
		}		
		
		//reply 삭제할 권한이 있는지 유효성 검사
		function replyDeleteCheck(){
			var loginId = $('#replyId').val();
			var replynum = $(this).attr('data-rno');			
			$.ajax({
				method : 'get',
				url : 'delAuthority',				
				data : 'replynum='+replynum,
				success : function(res){
					if(loginId != res){
						alert("작성자만 지울 수 있습니다.");
						return;
					} else {
						replyDelete(replynum);
					}
				}
			})
		}
		//reply 삭제
		function replyDelete(replynum){
			$.ajax({
				method : 'get',
				url : 'replyDelete',
				data : "replynum="+replynum,
				success : init
			})
		}
		
		//채택할 권한이 있는지 검사
		function recommendCheck(){
			var replynum = $(this).attr('data-rno');
			var loginId = $('#replyId').val();			
			var boardnum = $('#boardnum').val();
			alert(replynum);
			$.ajax({
				method : 'get',
				url : 'recAuthority',
				data : 'boardnum='+boardnum,
				success : function(res){
					if(loginId!=res){
						alert("질문자만 채택할 수 있습니다.");
						return;
					} else {
						recommend(replynum);
					}
				}
				
			})
		}
		
		//reply 채택
		function recommend(replynum){			
			var replyId = $('#replyId').val();
			var boardnum = $('#boardnum').val();
			
			var sendData = {
					"replynum" : replynum,
					"userid" : replyId,
					"boardnum" : boardnum					
			}
			alert(JSON.stringify(sendData));
			$.ajax({
				method : 'post',
				url : 'pointGet',
				data : JSON.stringify(sendData),
				dataType : 'json',
				contentType : 'application/json; charset:utf-8',
				success : function(res){
					if(res==3){
						alert("답변이 채택되었습니다");
						init();
					}					
				}
			})
		}
		
		//reply 작성
		function insertReply(){
				
				var userid = $('#replyId').val();
				var boardnum = $('#boardnum').val();
				var comment = $('#comment').val();
				
				if(comment.length<1){
					alert("답변을 입력해주세요");
					return;
				}				
				var sendData = {
						"userid" : userid,
						"boardnum" : boardnum,
						"replytext" : comment
				}
				$.ajax({
					method : "post",
					url : "replyInsert",
					data : JSON.stringify(sendData),
					dataType : "json",
					contentType : "application/json; charset:utf-8",
					success : init
				})
			}

	</script>
  </body>

</html>

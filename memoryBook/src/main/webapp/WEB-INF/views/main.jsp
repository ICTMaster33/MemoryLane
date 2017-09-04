<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Stylish Portfolio - Start Bootstrap Theme</title>
    
    <!-- 	Favicon -->
	<link rel="shortcut icon" href="/memory/resources/img/memory.ico">
	<link rel="icon" href="/memory/resources/img/memory.ico">

    <!-- Bootstrap Core CSS -->
    <link href="/memory/resources/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/memory/resources/css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/memory/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="#top" onclick=$("#menu-close").click();>Memory Book</a>
            </li>
            <li>
                <a href="#top" onclick=$("#menu-close").click();>Home</a>
            </li>
            <li>
                <a href="#services" onclick=$("#menu-close").click();>Services</a>
            </li>
            <li>
                <a href="#portfolio" onclick=$("#menu-close").click();>Portfolio</a>
            </li>
            <li>
                <a href="#contact" onclick=$("#menu-close").click();>Contact</a>
            </li>
            <li>
                <a href="#register"  onclick=$("#menu-close").click();>Register</a>
            </li>
            <li>
                <a data-toggle="modal" data-target="#myModal" onclick=$("#menu-close").click();>Login</a>
            </li>
        </ul>
    </nav>

    <!-- Header -->
    <header id="top" class="header">
	        <div class="text-vertical-center">
	            <h1 class="title100">Memory Lane</h1>
	            <p class="title101">더듬어 가는 기억</p>
<!-- 	            <br> -->
<!-- 	            <br> -->
<!-- 	            <br> -->
<!-- 	            <h3 class="title102">모든걸 기억해주는 당신만의 길을 만들어보세요</h3> -->
<!-- 	            <br> -->
<!-- 	            <a href="#about" class="btn btn-default btn-lg">Find Out More</a> -->
	        </div>
    </header>

    <!-- About -->
    <section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="about-text">당신이 걸었던 길의 기억 한조각, 한조각을 남겨보세요</h2>
                    <h3 class="about-text2">여행  책  영화  맛집  패션  뉴스  소셜  친구  쇼핑  공부 언어 </h3>
<!--                     <p class="lead">This theme features some wonderful photography courtesy of <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a>.</p> -->
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Services -->
    <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
    <section id="services" class="services bg-primary">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2 class="service-text">메모리 레인은?</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-cloud fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Service Name</strong>
                                </h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-compass fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Service Name</strong>
                                </h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-flask fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Service Name</strong>
                                </h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-shield fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Service Name</strong>
                                </h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Callout -->
    <aside class="callout">
        <div class="text-vertical-center">
            <h1>Vertically Centered Text</h1>
        </div>
    </aside>

    <!-- Portfolio -->
    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h2>Our Work</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="/memory/resources/img/portfolio-1.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="/memory/resources/img/portfolio-2.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="/memory/resources/img/portfolio-3.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="/memory/resources/img/portfolio-4.jpg">
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                    <a href="#" class="btn btn-dark">View More Items</a>
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Call to Action -->
    <aside class="call-to-action bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>The buttons below are impossible to resist.</h3>
                    <a href="#" class="btn btn-lg btn-light">Click Me!</a>
                    <a href="#" class="btn btn-lg btn-dark">Look at Me!</a>
                </div>
            </div>
        </div>
    </aside>
    
    
		    <!-- Modal -->
		  <div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content" style="width:400px;margin: 0 auto;">
		        <div class="modal-header">
		          <button type="button" class="close" id="modalClose" data-dismiss="modal">&times;</button>
		          <br>
		          <br>
		          <h4 class="modal-title" id="dragNoteTitle" style="text-align: center;">Memory Lane LogIn</h4>
		          <br>
		        </div>
		        <br>
		        	<div class="modal-body" id="joinModal"  style="display: none;">
		          	<form name="joinfrm" id="joinfrm">       
			    	<table id="joinInfo">
			    		<tr>
			    			<div class="form-group">
			    			 <label for="name">name:</label>
			    			 <input type="text" class="form-control" id="name" name="name" placeholder="이름음 입력하세요" required="" autofocus="" />
			    			</div>
			    		</tr>
			    		<tr>
			    			<div class="form-group">
			    			 <label for="email">Email:</label>
			    			 <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" required="" autofocus="" />
			    			 <span id="emailck"></span>
			    			</div>
			    		</tr>
			    		<tr>
			    			<div class="form-group">
			    			 <label for="password">password:</label>
			    			 <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required="" autofocus="" />
			    			</div>
			    		</tr>
			    		<tr>
			    			<div class="form-group">
			    			 <label for="passwordConf">password:</label>
			    			 <input type="password" class="form-control" id="passwordConf" name="passwordConf" placeholder="비밀번호를 확인하세요" required="" autofocus="" />
			    			 <span id="checkPwd"></span>
			    			</div>
			    		</tr>
			    		<tr>
			    			<td colspan="2">&nbsp;&nbsp;</td>
			    		</tr>
			    		<tr>
			    			<td id="btns" colspan="2" style="width: 368px;">
							    <button id="joinBtn" class="btn btn-default" style="width: 368px;background: #B2CCFF; margin: 0 auto;">회원가입</button>   
			    			</td>
			    		</tr>
			    		<tr>
			    			<td id="btns" colspan="2" style="width: 368px;">
							    <button id="cancelBtn" class="btn btn-default" style="width: 368px;background: #FFFFFF; margin: 0 auto;">취소</button>  
			    			</td>
			    		</tr>
		    		</table>
			    </form>
		        	</div>
		        	
		        <div class="modal-body" id="loginModal" >
		          	
		          	
		          	<form name="loginfrm" id="loginfrm">       
			    	<table id="loginInfo">
			    		<tr>
			    			<div class="form-group">
			    			 <label for="loginEmail">Email:</label>
			    			 <input type="text" class="form-control" id="loginEmail" name="loginEmail" placeholder="Email Address" required="" autofocus="" />
			    			</div>
			    		</tr>
			    		<tr>
			    			<div class="form-group">
							    <label for="loginPassword">Password:</label>
							    <input type="password" class="form-control" id="loginPassword" name="loginPassword" placeholder="Password" required=""/>
			    			</div>
			    		</tr>
			    		<br>
					    <tr >
					    	<td id="btns" colspan="2" style="width: 368px;">
							    <button id="loginBtn" class="btn btn-default"  style="width: 368px;background: #B2CCFF; margin: 0 auto;">로그인</button>   
					    	</td>
					    </tr>
					    <tr>
					    	<td id="btns" colspan="2" style="width: 368px;">
							    <div id="joinFormBtn" class="btn btn-default"  style="width: 368px;background: #FFFFFF; margin: 0 auto;">회원가입</div>
					    	</td>
					    </tr>
		    		</table>
			    </form>
		<!--           <div id="googleLoginDiv" align="center" class="g-signin2" data-onsuccess="onSignIn" style="width: 368px; text-align: center;"></div> -->
		          
		        </div>
		      </div>
		    </div>
		  </div>


    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4><strong>Start Bootstrap</strong>
                    </h4>
                    <p>3481 Melrose Place
                        <br>Beverly Hills, CA 90210</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
                        <li><i class="fa fa-envelope-o fa-fw"></i> <a href="mailto:name@example.com">name@example.com</a>
                        </li>
                    </ul>
                    <br>
                    <ul class="list-inline">
                        <li>
                            <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                        </li>
                    </ul>
                    <hr class="small">
                    <p class="text-muted">Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </div>
        <a id="to-top" href="#top" class="btn btn-dark btn-lg"><i class="fa fa-chevron-up fa-fw fa-1x"></i></a>
    </footer>

    <!-- jQuery -->
    <script src="/memory/resources/js/jquery-3.2.1.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/memory/resources/js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script>
    
    
    //모달 회원가입창버튼 
    $("#joinFormBtn").click(function (){
    	$("#dragNoteTitle").html("Welcome to Memory Lane")
    	document.getElementById("loginModal").style.display = "none";
    	document.getElementById("joinModal").style.display = "block";
    	return false;
    })
    //모달 취소버튼
    $("#cancelBtn").click(function (){
    	$("#dragNoteTitle").html("Welcome to Memory Lane")
    	document.getElementById("loginModal").style.display = "block";
    	document.getElementById("joinModal").style.display = "none";
    	return false;
    })
    //비밀번호 확인
    $("#passwordConf").on("keyup",function(){
      var f1 = document.joinfrm;
      var pw1 = f1.password.value;
      var pw2 = f1.passwordConf.value;
      if(pw1!=pw2){
       document.getElementById('checkPwd').style.color = "red";
       document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
      }else{
       document.getElementById('checkPwd').style.color = "green";
       document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
      }
    })
    
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#],[data-toggle],[data-target],[data-slide])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    //#to-top button appears after scrolling
    var fixed = false;
    $(document).scroll(function() {
        if ($(this).scrollTop() > 250) {
            if (!fixed) {
                fixed = true;
                // $('#to-top').css({position:'fixed', display:'block'});
                $('#to-top').show("slow", function() {
                    $('#to-top').css({
                        position: 'fixed',
                        display: 'block'
                    });
                });
            }
        } else {
            if (fixed) {
                fixed = false;
                $('#to-top').hide("slow", function() {
                    $('#to-top').css({
                        display: 'none'
                    });
                });
            }
        }
    });
    // Disable Google Maps scrolling
    // See http://stackoverflow.com/a/25904582/1607849
    // Disable scroll zooming and bind back the click event
    var onMapMouseleaveHandler = function(event) {
        var that = $(this);
        that.on('click', onMapClickHandler);
        that.off('mouseleave', onMapMouseleaveHandler);
        that.find('iframe').css("pointer-events", "none");
    }
    var onMapClickHandler = function(event) {
            var that = $(this);
            // Disable the click handler until the user leaves the map area
            that.off('click', onMapClickHandler);
            // Enable scrolling zoom
            that.find('iframe').css("pointer-events", "auto");
            // Handle the mouse leave event
            that.on('mouseleave', onMapMouseleaveHandler);
        }
        // Enable map zooming with mouse scroll when the user clicks the map
    $('.map').on('click', onMapClickHandler);
        
    $("#loginBtn").click(function () {
    	$.ajax ({
    		url: "/memory/member/login",
    		type: "POST",
    		data: {
    			"email" : $("input[name=loginEmail]").val(),
    			"password" : $("input[name=loginPassword]").val()
    			},
    		success : function(result) {
	    	    		if(result){
	    	    			alert("로그인 완료")
	    	    			location.href='/memory/member/index';
	    	    		}
	    	    		else {
	    	    			alert("ID/PWD를 확인해 주세요")
	    	    		}
    	    		}
    	});
    	return false;
	    });
        
		$("#joinBtn").click(function () {
	    	
	    	var frm = document.joinfrm;
	    	if (frm.name.value == "") {
	    		frm.name.focus();
	    		alert("Please insert your name");
	    		return false;
	    	}
	    	if (frm.email.value == "") {
	    		frm.email.focus();
	    		alert("Please insert your E-mail");
	    		return false;
	    	}
	    	
	    	if (frm.password.value == "") {
	    		frm.password.focus();
	    		alert("Please insert your password");
	    		return false;
	    	}
	    	if (frm.passwordConf.value == "") {
	    		frm.passwordConf.focus();
	    		alert("Please insert confirm password");
	    		return false;
	    	}
	    	if(frm.password.value != frm.passwordConf.value){
	    		frm.passwordConf.focus();
	    		alert("Please check your password");
	    		return false;	  
	    	}
	    	$.ajax ({
	     		url: "/memory/member/join",
	     		type: "POST",
	     		data: {
	 				"name" : $("input[name=name]").val(),    			
	     			"email" : $("input[name=email]").val(),
	     			"password" : $("input[name=password]").val()
	     			},
	     		success : function(result) {
	     				if(result){
	 	    	    		alert("회원가입완료");
	 	    	    		frm.name.value = "";
	 	    	    		frm.email.value = "";
	 	    	    		frm.password.value = "";
	 	    	    		frm.passwordConf.value = "";
	 	    	    		document.getElementById("loginModal").style.display = "block";
	 	    	    		document.getElementById("joinModal").style.display = "none";
	    					$("#myModal").modal('hide');
	     				}else alert("회원가입 실패");
	     	    }
	     	});
	     	return false;
	    });
    </script>

</body>

</html>
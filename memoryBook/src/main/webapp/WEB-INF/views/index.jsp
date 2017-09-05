<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple Sidebar - Start Bootstrap Template</title>

	<!-- StyleSheets -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/notosanskr.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/memory/resources/css/memory-sheet.css">

    <!-- Bootstrap core CSS -->
    <link href="/memory/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/memory/resources/css/simple-sidebar.css" rel="stylesheet">

	<script src="/memory/resources/js/jquery-3.2.1.min.js"></script>
	<script src='/memory/resources/js/fullcalendar-3.2.0/lib/moment.min.js'></script>
	<script src='/memory/resources/js/fullcalendar-3.2.0/fullcalendar.js'></script>
</head>

<body>

    <div id="wrapper" class="toggled">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#main">
                        Memory Lane
                    </a>
                </li>
                <li>
                    <a id="main">
	                    Main
                    </a>
                </li>
                <li>
                    <a id="myProfile">
	                    Profile
                    </a>
                </li>
                <li>
                    <a id="drag">
					    My Drag
					</a>
                </li>
                <li>
      		        <a id="note">
					    My Note
					</a>
                </li>
                <li>
                	<a id="friend"y>
					    My Friend
					</a>
                </li>
                <li>
                    <a data-toggle="modal" data-target="#myModal_m">Unregister</a>
                </li>
                <li>
                    <a href="#logout" onclick="logout()">Logout</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <h1>Memory Lane</h1>
                <p>${name}님 This is main screen.</p>
                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Toggle Menu</a>
            </div>
        </div>
        <!-- /#page-content-wrapper -->
		
		<div id="profile">
            <div class="container-fluid">
                <h1>Your Profile</h1>
                <p>this is your profile</p>
                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Toggle Menu</a>
            </div>
        </div>
        
        <div id='myNote'>
			<div class="container-fluid">
            <%@ include file="menu/note.jsp" %>
            </div>
        </div>
        
		<div id='myFriend'>
			<div class="container-fluid">
		  	<%@ include file="menu/friend.jsp" %>
		  	</div>
	  	</div>
        
		<div id='myDrag'>
			<div class="container-fluid">
		  	<%@ include file="menu/drag.jsp" %>
		  	</div>
	  	</div>
    </div>
    <!-- /#wrapper -->
	
	<div class="modal fade" id="myModal_m" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content" style="width:400px;margin: 0 auto;">
		        <div class="modal-header">
		          <button type="button" class="close" id="modalClose" data-dismiss="modal">&times;</button>
		          <br>
		          <br>
		          <h4 class="modal-title" id="dragNoteTitle" style="text-align: center;">Memory Lane Unregister</h4>
		          <br>
		        </div>
		        <br>
		        			        	
		        <div class="modal-body" id="unregisterModal" >
		          	
		          	<form name="unregisterfrm" id="unregisterfrm" action="unregister" method="post">       
			    	<table id="loginInfo">
			    		<tr>
			    			<div class="form-group">
			    			 <label for="loginEmail">Email:</label>
			    			 <input type="text" class="form-control" id="email" name="email" placeholder="email을 다시 입력해주세요" required="required" autofocus="autofocus" />
			    			</div>
			    		</tr>
			    		<tr>
			    			<div class="form-group">
							    <label for="loginPassword">Password:</label>
							    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 다시 입력해주세요" required="required"/>
			    			</div>
			    		</tr>
					    <tr>
					    	<td id="btns" colspan="2" style="width: 368px;">
					    		<input type="submit" value="회원탈퇴" class="btn btn-default" style="width: 368px;background: #B2CCFF; margin: 0 auto;">
<!-- 							    <button id="unregisterBtn" class="btn btn-default"  style="width: 368px;background: #B2CCFF; margin: 0 auto;">회원탈퇴</button>    -->
					    	</td>
					    </tr>
					    <tr>
					    	<td id="btns" colspan="2" style="width: 368px;">
							    <div id="cancleBtn" class="btn btn-default"  style="width: 368px;background: #FFFFFF; margin: 0 auto;">취소</div>
					    	</td>
					    </tr>
		    		</table>
			    </form>
		<!--           <div id="googleLoginDiv" align="center" class="g-signin2" data-onsuccess="onSignIn" style="width: 368px; text-align: center;"></div> -->
		        </div>
		      </div>
		    </div>
		  </div>
    
	
    <!-- Bootstrap core JavaScript -->
    <script src="/memory/resources/js/jquery-3.2.1.js"></script>
    <script src="/memory/resources/js/popper.min.js"></script>
    <script src="/memory/resources/js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    //탈퇴성공여부 로직(일단주석처리)
//     $(function(){
//     	if('${checkResult}' != null){
// 	    	if('${checkResult}' == "false"){
// 	    		alert("Email/PW를 체크해주세요");
	    		
// 	    	}else if ('${unregiResult}' == "false"){
// 	    		alert("탈퇴실패");
// 	    	}
//     	}

	//로그아웃
    function logout(){
    	var result = confirm("로그아웃하시겠습니까?");
    	if(result){
    		location.href='/memory/member/logout';
    		alert("로그아웃완료");
    	}
    }
    
  //모달 취소버튼
    $("#cancleBtn").click(function (){
    	location.href='/memory/member/index';
    });
    
    $("#menu-toggle").click(function(e){
    	e.preventDefault();
    	$("#wrapper").toggleClass("toggled");
    });
    
    // 내비바 아이콘으로 열고 닫기
    $("#myProfile").click(function(e) {
    	document.getElementById("myDrag").style.display = "none";
    	document.getElementById("myNote").style.display = "none";
    	document.getElementById("myFriend").style.display = "none";
    	$("#profile").show();
    });
    
    $("#drag").click(function(e) {
    	document.getElementById("profile").style.display = "none";
    	document.getElementById("myNote").style.display = "none";
    	document.getElementById("myFriend").style.display = "none";
    	$("#myDrag").show();
    });
    
    $("#note").click(function(e) {
    	document.getElementById("profile").style.display = "none";
    	document.getElementById("myDrag").style.display = "none";
    	document.getElementById("myFriend").style.display = "none";
    	document.getElementById("myNote").style.display = "";
    });
    
    $("#friend").click(function(e) {
    	document.getElementById("profile").style.display = "none";
    	document.getElementById("myDrag").style.display = "none";
    	document.getElementById("myNote").style.display = "none";
    	$("#myFriend").show();
    });
    </script>

</body>
</html>
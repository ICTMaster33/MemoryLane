<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
                    <a id="main" class="noteImg">
                    	<img src="/memory/resources/img/indexImg/mainHover.png" class="indexImg1">
      		        	<img src="/memory/resources/img/indexImg/main.png" class="indexImg2">
	                    Main
                    </a>
                </li>
                <li>
                    <a id="myProfile" class="noteImg">
                    	<img src="/memory/resources/img/indexImg/profileHover.png" class="indexImg3">
      		        	<img src="/memory/resources/img/indexImg/profile.png" class="indexImg4">
	                    Profile
                    </a>
                </li>
                <li>
                    <a id="drag" class="noteImg">
                    	<img src="/memory/resources/img/indexImg/dragHover.png" class="indexImg5">
      		        	<img src="/memory/resources/img/indexImg/drag.png" class="indexImg6">
					    My Drag
					</a>
                </li>
                <li>
                    <a id="dragtest" class="noteImg">
                	    <img src="/memory/resources/img/indexImg/dragHover.png" class="indexImg5">
      		        	<img src="/memory/resources/img/indexImg/drag.png" class="indexImg6">
					    My Drag_test
					</a>
                </li>
                <li>
      		        <a id="note" class="noteImg" >
      		        	<img src="/memory/resources/img/indexImg/noteHover.png" class="indexImg7">
      		        	<img src="/memory/resources/img/indexImg/note.png" class="indexImg8">
					    My Note
					</a>
                </li>
                 <li>
                	<a id="myFriend" class="noteImg">
                		<img src="/memory/resources/img/indexImg/friendHover.png" class="indexImg9">
      		        	<img src="/memory/resources/img/indexImg/friend.png" class="indexImg10">
					    My Friend
					</a>
                </li>
                <li>
                	<a id="searchFriend" class="noteImg">
					    Friend Seach
					</a>
                </li>
                <li>
                    <a onclick="logout()" class="noteImg">
                	<img src="/memory/resources/img/indexImg/logoutHover.png" class="indexImg11">
      		        <img src="/memory/resources/img/indexImg/logout.png" class="indexImg12">
                    Logout
                    </a>
                </li>
                <c:if test="${email eq 'admin'}">
                <li>
                	<a id="user" class="noteImg">
                	<img src="/memory/resources/img/indexImg/adminHover.png" class="indexImg13">
      		        <img src="/memory/resources/img/indexImg/admin.png" class="indexImg14">
					    UserList
					</a>
                </li>
                </c:if>
                <li>
                    <a data-toggle="modal" data-target="#myModal_m" class="noteImg">
      		        Unregister
                    </a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <h1>Memory Lane</h1>
                <p>${name}님 This is main screen.</p>
                <a class="btn btn-secondary" id="menu-toggle">Toggle Menu</a>
            </div>
            
			<div id="profile">
				<div class="container-fluid">
				<h1>Your Profile</h1>
				<p>this is your profile</p>
				</div>
	        </div>
	        
	        <div id='myDragList'>
	        	<div class="container-fluid">
	 		  		<%@ include file="menu/drag.jsp" %>
	 		  	</div>
		  	</div>
	        
	        <div id='myNote'>
	        	<div class="container-fluid">
	            	<%@ include file="menu/note.jsp" %>
	            </div>
	        </div>
	        
			<div id='friend'>
				<div class="container-fluid">
			  		<%@ include file="menu/friend.jsp" %> 
			  	</div>
		  	</div>
	        
			<div id='search'>
				<div class="container-fluid">
			  		<%@ include file="menu/seach.jsp" %>
			  	</div>
		  	</div>
		  	
		  	<div id='memoList'>
		  		<div class="container-fluid">
					<h1>memoList</h1>
			  	<%--  현재 에러
			  	<%@ include file="manager/receivedMemos.jsp" %>
	    	    --%>
	    		</div>
		  	</div>
		  	
		  	<div id='userList'>
		  		<div class="container-fluid">
			  		<%@ include file="manager/userList.jsp" %>
			  	</div>
		  	</div> 
		  	
			<div id='myDragtest'>
				<div class="container-fluid">
			  		<%@ include file="menu/drag_test.jsp" %>
			  	</div>
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
							    <input type="password" class="form-control" id="mem_pwd" name="mem_pwd" placeholder="비밀번호를 다시 입력해주세요" required="required"/>
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
    
	// 로딩 시 위치 지정
	window.onload = function () {
		mainNoteList(); //노트 리스트
		mainDragList(); //드래그 리스트
		makeDragList_mini(); //글 작성창 드래그 리스트
		getMainCategory(); //카테고리 리스트
		//노트 리스트 화면
		document.getElementById("profileModal").style.display = "";
		document.getElementById("noteView").style.display = "";
		document.getElementById("noteView").style.width = (screen.innerWidth - 420) +"px";
		document.getElementById("noteView").style.height = screen.innerHeight +"px";
		document.getElementById("noteEditor").style.display = "none";
		$("#noteTitle").val("");
		$(".nicEdit-main").html('');
		
		//노트 에디터
		document.getElementById("editorView").style.width = (screen.innerWidth - 420) +"px";
		document.getElementById("editorView").style.height = screen.innerHeight +"px";
		
		//드래그 리스트
		document.getElementById("dragView").style.height = screen.innerHeight +"px";

		//메뉴 이동시 에디터 체크
		var chk_tf;
	}

	// 브라우저 창 크기 변화 시 위치 지정 (통합)
	$(window).resize(function(){
		//드래그 리스트
		document.getElementById("dragView").style.width = (screen.innerWidth - 420) +"px";
		document.getElementById("dragView").style.height = screen.innerHeight +"px";
		//노트 리스트
		document.getElementById("noteView").style.width = (screen.innerWidth - 420) +"px";
		document.getElementById("noteView").style.height = screen.innerHeight +"px";
		//노트 에디터
		document.getElementById("editorView").style.width = (screen.innerWidth - 420) +"px";
		document.getElementById("editorView").style.height = screen.innerHeight +"px";
	});
    
    // 내비바 아이콘으로 열고 닫기
    $("#myProfile").click(function(e) {
    	function profile_menu(){
	    	document.getElementById("myDragList").style.display = "none";
	    	document.getElementById("myNote").style.display = "none";
	    	document.getElementById("userList").style.display = "none";
	    	document.getElementById("memoList").style.display = "none";
	    	document.getElementById("friend").style.display = "none";
	    	document.getElementById("myDragtest").style.display = "none";
	    	document.getElementById("search").style.display = "none";
	    	document.getElementById("profile").style.display = "";
    	}
    	if(editor_chk){
    		editorCancelChk();
    		if(chk_tf) {
    			profile_menu();
    		}
    	} else {
    		profile_menu();
    	}
    });
    
    $("#drag").click(function(e) {
    	function drag_menu(){
    		document.getElementById("profile").style.display = "none";
        	document.getElementById("myNote").style.display = "none";
        	document.getElementById("userList").style.display = "none";
        	document.getElementById("friend").style.display = "none";
        	document.getElementById("memoList").style.display = "none";
        	document.getElementById("search").style.display = "none";
        	document.getElementById("myDragtest").style.display = "none";
        	document.getElementById("myDragList").style.display = "";
    	}
    	if(editor_chk){
    		editorCancelChk();
    		if(chk_tf) {
    			drag_menu();
    		}
    	} else {
    		drag_menu();
    	}
    });
    
    $("#dragtest").click(function(e) {
    	function dragTest_menu(){
    		document.getElementById("profile").style.display = "none";
        	document.getElementById("myNote").style.display = "none";
        	document.getElementById("userList").style.display = "none";
        	document.getElementById("friend").style.display = "none";
        	document.getElementById("memoList").style.display = "none";
        	document.getElementById("myDragList").style.display = "none";
        	document.getElementById("search").style.display = "none";
        	document.getElementById("myDragtest").style.display = "";
    	}
    	if(editor_chk){
    		editorCancelChk();
    		if(chk_tf) {
    			dragTest_menu();
    		}
    	} else {
    		dragTest_menu();
    	}
    });
    
    $("#note").click(function(e) {
    	function note_menu(){
    		document.getElementById("profile").style.display = "none";
        	document.getElementById("myDragList").style.display = "none";
        	document.getElementById("friend").style.display = "none";
        	document.getElementById("userList").style.display = "none";
        	document.getElementById("memoList").style.display = "none";
        	document.getElementById("myDragtest").style.display = "none";
        	document.getElementById("search").style.display = "none";
        	document.getElementById("myNote").style.display = "";
    	}
    	if(editor_chk){
    		editorCancelChk();
    		if(chk_tf) {
    			note_menu();
    		}
    	} else {
    		note_menu();
    	}
    });
    
    $("#myFriend").click(function(e) {
    	function friend_menu(){
    		document.getElementById("profile").style.display = "none";
        	document.getElementById("myDragList").style.display = "none";
        	document.getElementById("myNote").style.display = "none";
        	document.getElementById("userList").style.display = "none";
        	document.getElementById("memoList").style.display = "none";
        	document.getElementById("search").style.display = "none";
        	document.getElementById("myDragtest").style.display = "none";
        	document.getElementById("friend").style.display = "";
    	}
    	if(editor_chk){
    		editorCancelChk();
    		if(chk_tf) {
    			friend_menu();
    		}
    	} else {
    		friend_menu();
    	}
    });
    
    $("#searchFriend").click(function(e) {
    	function search_menu(){
	    	document.getElementById("profile").style.display = "none";
	    	document.getElementById("myDragList").style.display = "none";
	    	document.getElementById("myNote").style.display = "none";
	    	document.getElementById("userList").style.display = "none";
	    	document.getElementById("memoList").style.display = "none";
	    	document.getElementById("myDragtest").style.display = "none";
	    	document.getElementById("friend").style.display = "none";
	    	document.getElementById("search").style.display = "";
    	}
	    if(editor_chk){
			editorCancelChk();
			if(chk_tf) {
				search_menu();
			}
		} else {
			search_menu();
		}
	});
    
    $("#user").click(function(e) {
    	function user_menu(){
    		document.getElementById("profile").style.display = "none";
        	document.getElementById("myDragList").style.display = "none";
        	document.getElementById("myNote").style.display = "none";
        	document.getElementById("friend").style.display = "none";
        	document.getElementById("memoList").style.display = "none";
        	document.getElementById("myDragtest").style.display = "none";
        	document.getElementById("search").style.display = "none";
        	document.getElementById("userList").style.display = "";
    	}
    	if(editor_chk){
    		editorCancelChk();
    		if(chk_tf) {
    			user_menu();
    		}
    	} else {
    		user_menu();
    	}
    });
    
    $("#memo").click(function(e) {
    	function memo_menu(){
    		document.getElementById("profile").style.display = "none";
        	document.getElementById("myDragList").style.display = "none";
        	document.getElementById("myNote").style.display = "none";
        	document.getElementById("friend").style.display = "none";
        	document.getElementById("userList").style.display = "none";
        	document.getElementById("search").style.display = "none";
        	document.getElementById("myDragtest").style.display = "none";
        	document.getElementById("memoList").style.display = "";
    	}
    	if(editor_chk){
    		editorCancelChk();
    		if(chk_tf) {
    			memo_menu();
    		}
    	} else {
    		memo_menu();
    	}
    });
    
    //인덱스 메뉴 이미지 호버
    $(function(){
    	$(".noteImg").hover(function(){
    	     $("img",this).eq(1).stop().fadeToggle(500);
    	},function(){
    	     $("img",this).eq(1).stop().fadeToggle(500);
    	});
    });
    
    //에티터 작동중 취소여부 확인 (noteWrite.jsp에도 연동되어 같이 적용됨)
	function editorCancelChk() {
		var chk;
		chk = confirm("정말로 취소하시겠습니까?");
		if(chk) {
		editor_chk = false;
		$("#noteTitle").val('');
		$(".nicEdit-main").html('');
    	document.getElementById("noteEditor").style.display = "none";
    	document.getElementById("profileModal").style.display = "";
    	document.getElementById("noteView").style.display = "";
    	document.getElementById("noteView").style.width = (screen.innerWidth - 420) +"px";
		document.getElementById("noteView").style.height = screen.innerHeight +"px";
		chk_tf = true;
		} else {
		chk_tf = false;
		}
	}
    </script>

</body>
</html>
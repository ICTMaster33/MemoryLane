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

    <!-- Bootstrap core CSS -->
    <link href="/memory/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/memory/resources/css/simple-sidebar.css" rel="stylesheet">

	<script src="/memory/resources/js/jquery-3.2.1.min.js"></script>
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
                    <a href="#main">Main</a>
                </li>
                <li>
                    <a href="#profile">Profile</a>
                </li>
                <li>
                      <a href="#" onclick="drag_open()" class="w3-bar-item w3-button w3-padding-large">
					    <i class="fa fa-inbox w3-xxlarge"></i>
					    <p>My Drag</p>
					  </a>
                </li>
                <li>
      		          <a href="#" onclick="note_open()" class="w3-bar-item w3-button w3-padding-large">
					    <i class="fa fa-inbox w3-xxlarge"></i>
					    <p>My Note</p>
					  </a>
                </li>
                <li>
                    <a href="#myFriend">Friend</a>
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
        
        <!-- 뉴스뷰 -->
		<div id='myDrag' style="z-index: 4; min-height: 100%; width: 1200px;">
		  	<%@ include file="menu/drag.jsp" %>
	  	</div>
        
        <div id="myNote">
            <%@ include file="menu/note.jsp" %>
        </div>
		
    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="/memory/resources/js/jquery-3.2.1.js"></script>
    <script src="/memory/resources/js/popper.min.js"></script>
    <script src="/memory/resources/js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    
    // 내비바 아이콘으로 열고 닫기
    function drag_open() {
    	$("#page-content-wrapper").hide();
    	$("#profile").hide();
    	$("#myNote").hide();
    	$("#myDrag").show();
    }
    
    function note_open() {
    	$("#page-content-wrapper").hide();
    	$("#profile").hide();
    	$("#myNote").show();
    	$("#myDrag").hide();
    }
    </script>

</body>
</html>
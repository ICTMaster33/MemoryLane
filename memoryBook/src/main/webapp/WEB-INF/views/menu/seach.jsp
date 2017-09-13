<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Simple Sidebar - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="/memory/resources/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/memory/resources/css/simple-sidebar.css" rel="stylesheet">
<script src="/memory/resources/js/jquery-3.2.1.min.js"></script>
</head>

<body>

<h1>${name}님 친구를 찾고 추가해보세요</h1><br>
<input type="text" name="findId" id="findId" class="form-control" placeholder="이름 or Email을 입력하세요">
<button name="findBtn" id="findBtn" class="btn btn-default" onclick="findMember()">Search</button><br><br><br><br>

<table class="table table-hover" id="table">
	
</table>

<table class="table table-striped" id="listTable">

</table>

<script>
	$(function(){
		getFriendList();
	});

	//내 친구 목록 불러오기
	function getFriendList(){
		$.ajax ({
			url: "/memory/member/getFriendList",
			type: "POST",
			success : function(result){
				var addTitle = "<tr><th>이름</th>";
				addTitle+= "<th>이메일</th>";
				addTitle+= "<th>친구삭제</th></tr>";
				$("#listTable").append(addTitle);
				$(result).each(function(index, item) {
					var addRow  = '<tr id="flist"><td id="friendName'+ index +'">' + item.name + '</td>';
		                addRow += '<td id="friendEmail">' + item.friend_Email + '</td>';
		                addRow +='<td class = "deleteFriend">' + '<img id = deleteF'+index+' src = "/memory/resources/img/cancel.png">' + '</td>';
		                addRow += '</tr>';
						$("#listTable").append(addRow);
						
						$("#deleteF"+index).click(function(){
							$.ajax({
								url: "/memory/member/deleteFriend",
								dataType: "json",
								type: "post",
								data: {"friend_Email" : item.friend_Email},
								success: function(result){
									if(result){
										alert("친구가 삭제되었습니다.");
										$("#listTable").empty();
										getFriendList();
									}else {
										alert("친구삭제 실패")
									}
								}
							});
						});
				})
			}
		})
	}


	//회원찾기
	function findMember() {
		$.ajax ({
			url: "/memory/member/findMember",
			type: "POST",
			data: {
				"findId" : $("input[name=findId]").val()
				},
			success : function(result) {
						$("#table").empty();
						var addTitle = "<tr><th>이름</th>";
						addTitle+= "<th>이메일</th>";
						addTitle+= "<th>친구추가</th></tr>";
						$("#table").append(addTitle);
						var btn;
// 						var Email = ${email};
						$(result).each(function(index, item) {
							var addRow  = '<tr id="mlist"><td id="userName'+ index +'">' + item.name + '</td>';
				                addRow += '<td id="userEmail">' + item.email + '</td>';
				                addRow +='<td class = "addFriend">' + '<img id = addF'+index+' src = "/memory/resources/img/adduser.png">' + '</td>';
				                addRow += '</tr>';
								$("#table").append(addRow);

								$("#addF"+index).click(function(){
								$.ajax({
									url: "/memory/member/addFriend",
									dataType: "json",
									type: "post",
									data: {"myEmail": '${email}', "friend_Email" : item.email},
									success: function(result){
										if(result){
											alert("친구가 추가되었습니다.");
											$("#table").empty();
											$("#listTable").empty();
											getFriendList();
										}else {
											alert("친구추가 실패")
										}
									}
								});
							});
						});
						
		    		}
		});
		return false;
    };
	
</script>

</body>
</html>
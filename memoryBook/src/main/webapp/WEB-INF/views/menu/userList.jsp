<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link href="/memory/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/memory/resources/css/simple-sidebar.css" rel="stylesheet">
<script src="/memory/resources/js/jquery-3.2.1.min.js"></script>
</head>

<body>

<h1>UserList</h1>
<script>
$(function(){
	getList();
});

function getList(){
	$.ajax({
		url: "/memory/member/getList",
		dataType: "json",
		success: function(result){   		
				var addTitle = "<tr><th>이름</th>";
					addTitle+= "<th>이메일</th>";
					addTitle+= "<th>접속가능여부</th></tr>";
					$(".list").append(addTitle);
					$(result).each(function(index, item) {
						var addRow  = '<tr id="userList"><td id="name'+ index +'">' + item.name + '</td>';
			                addRow += '<td id="email">' + item.email + '</td>';
			               if(item.approvalNum == 0){
			                   addRow +='<td class = "practice">' + '<img id = "normal'+index+'" src = "/memory/resources/img/open-lock.png">' + '</td>';
			                }else{
			                   addRow +='<td class = "practice">' + '<img id = "stop'+index+'" src = "/memory/resources/img/lock.png">' + '</td>';
			                }
							addRow += '</tr>';
							$(".list").append(addRow);
							
							$("#stop"+index).click(function(){
							var check = confirm("정말로 해제시키시겠습니까?");
							if(check){
								$.ajax({
									url: "/memory/member/click",
									dataType: "json",
									type: "post",
									data: {"name": item.name, "approvalNum" :item.approvalNum},
									success: function(result){
										if(result){
											$(".list").empty();
											getList();
										}
									}
								});
							}
						});
							 $("#normal"+index).click(function(){
								var check = confirm("정말로 정지시키시겠습니까?");
									if(check){
									$.ajax({
										url: "/memory/member/click",
										dataType: "json",
										type: "post",
										data: {"name": item.name,"approvalNum" :item.approvalNum},
										success: function(result){
											if(result){
												$(".list").empty();
												getList();
											}
											
										}
									});
								}
							}); 
					});
				}
	});
}

</script>

<table class="list">
	
</table>

</body>
</html>
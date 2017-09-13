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

<h1>${name}님 친구의 메일을 클릭후 구경해보세요</h1><br>



<table  id="freindTable">

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
				addTitle+= "<th>이메일</th></tr>";
				$("#freindTable").append(addTitle);
				$(result).each(function(index, item) {
					var addRow  = '<tr id="flist"><td id="friendName'+ index +'">' + item.name + '</td>';
		                addRow += '<td id="friendEmail">' + item.friend_Email + '</td>';
		                addRow += '</tr>';
						$("#freindTable").append(addRow);
				})
			}
		})
	}


</script>

</body>
</html>
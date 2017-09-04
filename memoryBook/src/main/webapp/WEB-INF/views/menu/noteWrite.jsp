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

<title>Simple Sidebar - Start Bootstrap Template </title>

<!-- Bootstrap core CSS -->
<link href="/memory/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/memory/resources/css/simple-sidebar.css" rel="stylesheet">
<script src="/memory/resources/js/jquery-3.2.1.min.js"></script>
<script src="/memory/resources/js/NicEdit-Korean/nicEdit.js" type="text/javascript"></script>
<script src='/memory/resources/js/fullcalendar-3.2.0/lib/moment.min.js'></script>
<script src='/memory/resources/js/fullcalendar-3.2.0/fullcalendar.js'></script>
</head>

<body>
	<!-- 에디터 -->
	<div id="editorView" style="z-index: 2;">
		<div>
			<br>
			<h3 class="tit_brunch">노트 작성</h3>

			<p class="desc_brunch">
				<span class="part">드래그 박스에서 원하는 항목을 클릭하여 글을 작성해보세요.<br></span>
				<!-- 			<span class="part">그리고 다시 꺼내 보세요.<br></span>  -->
				<!-- 			<span class="part"><span class="txt_brunch">서랍 속 간직하고 있는 글과 감성을.</span></span> -->
			</p>
		</div>

		<form name="noteFrm" id="noteFrm" method="POST"
			enctype="multipart/form-data" style="z-index: 2; width: 1069px;">
			<div>
				<br>
				<table class='pull-left'>
					<tr>
						<td><label for="category">카테고리</label></td>
						<td>&nbsp;&nbsp;</td>
						<td><select name="category" id="category"
							class="form-control">
						</select></td>
						<td>&nbsp;&nbsp;</td>
						<td><i class="fa fa-plus-circle w3-xlarge"
							onclick="showInput();" style="color: #ccc;"></i></td>
						<td>&nbsp;&nbsp;</td>
						<td><input type="text" id="categoryToAdd"
							name="categoryToAdd" style="display: none;" /></td>
						<td>&nbsp;&nbsp;</td>
						<td><i id="Category1" style="display: none; color: #ccc;"
							class="fa fa-check-circle w3-xlarge" onclick="addCategory();"></i>
						</td>
						<td>&nbsp;&nbsp;</td>
						<td><i id="Category2" style="display: none; color: #ccc;"
							class="fa fa-times-circle w3-xlarge" onclick="closeInput();"></i>
						</td>
					</tr>
				</table>
				<br> <br>
				<table>
					<tr>
						<td><input type="text" id="noteTitle" name="noteTitle"
							style="width: 1069px;" placeholder="제목을 입력하세요" /></td>
					</tr>
					<tr>
						<td><textarea id="myNicEditor" name="myNicEditor" cols="150"
								rows="20"></textarea></td>
					</tr>
				</table>
			</div>
			<table class='pull-right'>
				<tr>
					<td>
						<div class="btn btn-default" style="width: 60px;"
							id="noteSubmitBtn">저장</div>
					</td>
					<td>
						<div class="btn btn-default" style="width: 60px;"
							id="noteUpdateBtn" style="display: none;">수정</div>
					</td>
					<td>
						<div class="btn btn-default" style="width: 60px;"
							id="cancelBtn" style="display: none;">취소</div>
					</td>
				</tr>
			</table>
		</form>
		<br><br><br><br><br>
	</div>

	<!-- 본문내용 끝 -->

	<script>
	$("#cancelBtn").click(function(e) {
    	document.getElementById("noteEditor").style.display = "none";
    	document.getElementById("profileModal").style.display = "";
    	document.getElementById("mainView").style.display = "";
    	document.getElementById("mainView").style.width = (window.innerWidth - 420) +"px";
		document.getElementById("mainView").style.height = window.innerHeight +"px";
    });
	
	//카테고리 수정
	function categoryUpdate(event){
		var categoryToUpdate = event.target.id;
		var categoryInput = "categoryUpdate" + categoryToUpdate.substring(8);
		alert(categoryInput);
		document.getElementById(categoryToUpdate).style.display = "none";
//	 	document.getElementById(categoryInput).style.display = "block";
		$("#"+categoryInput).attr("style","display:block !important");
	}

	// 에디터 가져오기
	bkLib.onDomLoaded(nicEditors.allTextAreas); 

	// 로딩 시 위치 지정
	window.onload = function () {
		document.getElementById("editorView").style.width = (window.innerWidth - 420) +"px";
		document.getElementById("editorView").style.height = window.innerHeight +"px";
		getMainCategory();
	}

	// 브라우저 창 크기 변화 시 위치 지정 
	$(window).resize(function(){
		document.getElementById("editorView").style.width = (window.innerWidth - 420) +"px";
		document.getElementById("editorView").style.height = window.innerHeight +"px";
	});

	function open_editor() {
//	 	document.getElementById("editorBtnDiv").style.display = "block";
		document.getElementById("mainView").style.display = "none";
//	 	document.getElementById("searchView").style.display = "none";
		document.getElementById("newsView").style.display = "none";

		if(updateYn){
			document.getElementById("noteUpdateBtn").style.display = "block";
			document.getElementById("noteSubmitBtn").style.display = "none";
		} else {
			document.getElementById("noteUpdateBtn").style.display = "none";
			document.getElementById("noteSubmitBtn").style.display = "block";
		}
	}

	var updateYn = false;

	//노트 업데이트
	function updateNote(noteNo){
		localStorage.setItem("noteNoToUpdate",noteNo);
		$.ajax({
			type: "POST",
			url : "/memory/note/noteDetail",
			data: {"noteNo" : noteNo},
			dataType : "json"
		})
		.done(function (result) {
			var title = result.noteTitle;
			var content = result.noteContent;
			$("input[name=noteTitle]").val(title);
			$(".nicEdit-main").html(content);
			localStorage.setItem("selectedItem", "categoryNo" + result.categoryNo)
			updateYn = true;
			noteOpenYn = true;
			getCategory();
			open_editor();
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("에러발생: " + errorText + "<br>" + "상태: " + status);
		});
		
	}

	// 노트 등록
	$("#noteSubmitBtn").click(function() {

		var frm = document.noteFrm;
		if (frm.noteTitle.value == "") {
			swal("₍ᐢ•ﻌ•ᐢ₎*･ﾟ｡","제목을 입력하세요.");
			frm.noteTitle.focus();
			return false;
		}
		if (frm.category.value == "") {
			swal("₍ᐢ•ﻌ•ᐢ₎*･ﾟ｡","카테고리를 선택하세요.",'success');
			return false;
		}
//	 	if (!confirm("노트를 등록하시겠습니까?"))
//	 		return;

		var fd = new FormData();
		
		fd.append("memberNo",localStorage.getItem("memberNo"));
		fd.append("noteTitle",$("input[name=noteTitle]").val());
		fd.append("noteContent",$(".nicEdit-main").html());
		fd.append("categoryNo", $("#category").val());
		$.ajax({
			url : "/memory/note/note",
			type:"POST",
			data :fd,
			dataType : "json",
			processData: false,
			contentType:false
		})
		.done(function (result) {
			swal("₍ᐢ•ﻌ•ᐢ₎*･ﾟ｡", result.msg, "success");
			makeNoteList();
			$("input[name=noteTitle]").val("");
			$(".nicEdit-main").html("");
			main_open();
		})
		.fail(function (jqXhr, textStatus, errorText) {
			alert("에러발생 : " + errorText);
		});
		
		return false;
	});
	
	// 노트 수정
	$("#noteUpdateBtn").click(function() {
		var frm = document.noteFrm;
		if (frm.noteTitle.value == "") {
			swal("₍ᐢ•ﻌ•ᐢ₎*･ﾟ｡","제목을 입력하세요.");
			frm.noteTitle.focus();
			return false;
		}
		if (frm.category.value == "") {
			swal("₍ᐢ•ﻌ•ᐢ₎*･ﾟ｡","카테고리를 선택하세요.");
			return false;
		}
//	 	if (!confirm("노트를 등록하시겠습니까?"))
//	 		return;

		var fdUpdate = new FormData();
		
		fdUpdate.append("memberNo",localStorage.getItem("memberNo"));
		fdUpdate.append("noteTitle",$("input[name=noteTitle]").val());
		fdUpdate.append("noteContent",$(".nicEdit-main").html());
		fdUpdate.append("categoryNo", $("#category").val());
		fdUpdate.append("noteNo", localStorage.getItem("noteNoToUpdate"));
		$.ajax({
			url : "/memory/note/noteUpdate",
			type:"POST",
			data :fdUpdate,
			dataType : "json",
			processData: false,
			contentType:false
		})
		.done(function (result) {
			swal("₍ᐢ•ﻌ•ᐢ₎*･ﾟ｡", result.msg, "success");
			makeNoteList();
			noteDetail(result.noteNo);
			updateYn = false;
			$("input[name=noteTitle]").val("");
			$(".nicEdit-main").html("");
			$("#category").val("");
			main_open();
		})
		.fail(function (jqXhr, textStatus, errorText) {
			alert("에러발생 : " + errorText);
		});
		
		return false;
	});

	// 카테고리 인풋창 열기
	function showInput() {
		document.getElementById("categoryToAdd").style.display = "block";
	    document.getElementById("Category1").style.display = "block";
	    document.getElementById("Category2").style.display = "block";
	    return false;
	}

	// 카테고리 인풋창 끄기
	function closeInput() {
		document.getElementById("categoryToAdd").style.display = "none";
	    document.getElementById("Category1").style.display = "none";
	    document.getElementById("Category2").style.display = "none";
	    $("#categoryToAdd").val("");
	    return false;
	}

	// 카테고리 추가
	function addCategory(){
		
		var categoryName = $("#categoryToAdd").val();
		var memberNo = ${memberNo};
		
		if (categoryName == "") {
			alert("카테고리를 입력하세요");
			return false;
		}
		
		$.ajax({
			type: "POST",
			url : "/memory/note/addCategory",
			data: {"categoryName" : categoryName,
					"memberNo"	  : memberNo},
			dataType : "json"
		})
		.done(function (result) {
			swal(result.msg);
			appendCategory(result.categoryList);
			document.getElementById("categoryToAdd").style.display = "none";
		    document.getElementById("Category1").style.display = "none";
		    document.getElementById("Category2").style.display = "none";
		    $("#categoryToAdd").val("");
			
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("에러발생: " + errorText + "<br>" + "상태: " + status);
		});
	}

	// 카테고리 셀렉박스에 옵션 추가
	function appendCategory(categoryList){
		 $("#category option").remove();
		 for(var i = 0; i < categoryList.length; i++){
				var category = categoryList[i];
				var categoryName = category.categoryName;
				var categoryNo = category.categoryNo;
				$("#category").append("<option value='"+categoryNo+"' id='categoryNo"+categoryNo+"'>"+categoryName+"</option>");
		}
	}

	// DB에서 카테고리 가져오기
	function getCategory(){
		var memberNo = ${memberNo};
		$.ajax({
			type: "POST",
			url : "/memory/note/getCategory",
			data: {"memberNo" : memberNo},
			dataType : "json"
		})
		.done(function (result) {
			appendCategory(result.categoryList);
			var selcat = localStorage.getItem("selectedItem");
			$("#"+selcat).attr("selected", "selected");
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("에러발생: " + errorText + "<br>" + "상태: " + status);
		});
	}
	
	//Tooltip 효과
	$(document).ready(function(){
	    $('[dragNote-toggle="tooltip"]').tooltip();   
	});
    </script>
</body>
</html>
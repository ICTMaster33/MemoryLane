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
			</p>
		</div>

		<!-- 드래그바 -->
		<div class="w3-sidebar w3-round"
			style="background-color: white; width: 300px; z-index: 102;"
			id="sideDragBar">
			<div style="padding: 8px 25px; margin-top: 20px; text-align: center; font-size: 18px;">
				<i class="fa fa-inbox w3-xlarge"></i> DRAGS
			</div>
			<!-- 드래그 리스트 -->
			<div id="dragList"></div>
		</div>

		<!-- 입력창 -->
		<form name="noteFrm" id="noteFrm" method="POST"
			enctype="multipart/form-data" style="z-index: 2; width: 1069px;">
			<div>
				<br>
				<table class='pull-left'>
					<tr>
						<td><label for="category">카테고리</label></td>
						<td>&nbsp;&nbsp;</td>
						<td><select name="category" id="category" class="form-control">
						</select></td>
						<td>&nbsp;&nbsp;</td>
						<td>
						<i class="fa fa-plus-circle w3-xlarge" onclick="showInput();" style="color: #ccc;"></i>
						</td>
						<td>&nbsp;&nbsp;</td>
						<td>
				        	<input type ="text" id="categoryToAdd" name="categoryToAdd" style="display: none;" />
						</td>
						<td>&nbsp;&nbsp;</td>
						<td>
				        	<i id="Category1" style="display: none;color: #ccc;" class="fa fa-check-circle w3-xlarge" onclick="addCategory();"></i>
						</td>
						<td>&nbsp;&nbsp;</td>
						<td>
				        	<i id="Category2" style="display: none;color: #ccc;" class="fa fa-times-circle w3-xlarge" onclick="closeInput();"></i>
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
	// 글 쓰기/수정 로직 외 카테고리,리스트,삭제 등의 로직은 note.jsp에 있습니다. (로직은 note.jsp와 연동됩니다)
	
	// 에디터 가져오기
	bkLib.onDomLoaded(nicEditors.allTextAreas);

	// 노트 등록
	$("#noteSubmitBtn").click(function() {
		var frm = document.noteFrm;
		if (frm.noteTitle.value == "") {
			alert("제목을 입력하세요.");
			frm.noteTitle.focus();
			return false;
		}
		if (frm.category.value == "") {
			alert("카테고리를 선택하세요.",'success');
			return false;
		}
//	 	if (!confirm("노트를 등록하시겠습니까?"))
//	 		return;

		var memNo = ${memberNo};
		console.log("회원번호: "+memNo);
		console.log("노트제목: "+$("input[name=noteTitle]").val());
		console.log("노트내용: "+$(".nicEdit-main").html());
		console.log("카테고리번호: "+$("#category").val());
		$.ajax({
			url : "/memory/note/note",
			type : "POST",
			data : {"memberNo" : memNo, "noteTitle" : $("input[name=noteTitle]").val(), "noteContent" : $(".nicEdit-main").html(), "categoryNo" : $("#category").val()},
		})
		.done(function (result) {
			alert(result.msg, "success");
			makeNoteList();
			$("input[name=noteTitle]").val("");
			$(".nicEdit-main").html("");
			editor_chk = false;
			main_open();
		})
		.fail(function (jqXhr, textStatus, errorText) {
			alert("오류 : " + errorText);
		});
		
		return false;
	});
	
	// 노트 수정
	$("#noteUpdateBtn").click(function() {
		var frm = document.noteFrm;
		if (frm.noteTitle.value == "") {
			alert("제목을 입력하세요.");
			frm.noteTitle.focus();
			return false;
		}
		if (frm.category.value == "") {
			alert("카테고리를 선택하세요.");
			return false;
		}
//	 	if (!confirm("정말 수정하시겠습니까?"))
//	 		return;

		var memNo = ${memberNo};
		console.log(localStorage.getItem("noteNoToUpdate"));
		$.ajax({
			url : "/memory/note/noteUpdate",
			type : "POST",
			data : {"memberNo" : memNo, "noteTitle" : $("input[name=noteTitle]").val(), "noteContent" : $(".nicEdit-main").html(),
				"categoryNo" : $("#category").val(), "noteNo" : localStorage.getItem("noteNoToUpdate")}
		})
		.done(function (result) {
			alert(result.msg, "success");
			makeNoteList();
			noteDetail(result.noteNo);
			$("input[name=noteTitle]").val("");
			$(".nicEdit-main").html("");
			$("#category").val("");
			editor_chk = false;
			main_open();
		})
		.fail(function (jqXhr, textStatus, errorText) {
			alert("오류 : " + errorText);
		});
		
		return false;
	});
	
	//글 작성 및 수정취소
	$("#cancelBtn").click(function(e) {
		var chk;
		chk = confirm("정말로 취소하시겠습니까?");
		if(chk) {
		editor_chk = false;
		$("#noteTitle").val('');
		$(".nicEdit-main").html('');
    	document.getElementById("noteEditor").style.display = "none";
    	document.getElementById("profileModal").style.display = "";
    	document.getElementById("mainView").style.display = "";
    	document.getElementById("mainView").style.width = (window.innerWidth - 420) +"px";
		document.getElementById("mainView").style.height = window.innerHeight +"px";
		}
    });
	
	// 드래그내용 입력시 필요한 드래그 리스트 출력
    function makeDragListAll(result) {
    	var html = "";
    	for (var i = 0; i < result.length; i++) {

    		var drag = result[i];	
    		var dragNo = drag.dragNo;
    		
    		html += "<div class='quote-box1 w3-margin w3-padding' ondragstart='drag(event)' draggable='true' id='drag"+ drag.dragNo+"'  >";
    		html += "<p class='quotation-mark1' id='drag"+ drag.dragNo+"'> “ </p> ";
    		html += "<br>";
    		html += "<br>";
    		html += "<div class='quote-text' style='overflow:auto;max-height:170px; font-size:15px;' id='drag"+ drag.dragNo+"'>";
    		html += "		<p id='drag"+ drag.dragNo+"'>" + drag.dragContent.replace("amp;", "&") + "</p><br>";
    		html += "</div>";
    		html += " <hr>";
    		html += " <div class='blog-post-actions'>";
    		// 시간 뿌리기
    		var date = new Date(drag.dragRegDate);
    		var time = date.getFullYear() + "-" 
    		         + (date.getMonth() + 1) + "-" 
    		         + date.getDate() + " "
    		         + date.getHours() + ":"
    		         + date.getMinutes() + ":"
    		         + date.getSeconds();
    		html += "<p class='blog-post-bottom'>"+ time +"</p>";
    		if(drag.dragUrlTitle != null){
    			html += "<p class='blog-post-bottom pull-left' style='font-style:italic;font-size:12px;'>출처 : "+ drag.dragUrlTitle +"</p>";
    			html += "<p class='blog-post-bottom pull-right'><span class='badge quote-badge'dragNote-toggle='tooltip' title='링크'><i class='fa fa-link' dragNote-toggle='tooltip' title='링크' onclick='openUrl(event);' id='" + drag.dragUrl + "'></i></span></p>";
    		}else {
    			html += "<p class='blog-post-bottom pull-left' style='font-style:italic;font-size:12px;'>출처 : 알 수 없음</p>";
    		}
    		html += "</div>";
    		//시간 뿌리기 끝
    		html += "</div>";
    	}
    	if (result.length == 0) {
    		html += "<div class='w3-container w3-card-2 w3-white w3-round w3-margin w3-padding'>";
    		html += "<h6>드래그가 없습니다.</h6>";
    		html += "</div>";
    	}
    	$("#dragList").html(html);
    }
	
    //노트에 드래그 입력하기.
    $("div[id^=drag]").click(function(event){
    	var addDragNo = event.target.id.substring(4);
    	if (editor_chk) {
    		$.ajax({
    			url : "/memory/drag/selectDrag",
    			type: "POST",
    			data: {"dragNo" : addDragNo},
    			dataType: "json"
    		})
    		.done(function (result) {
    			$(".nicEdit-main").append(result.dragContent.replace("amp;", "&") + "<br>");
    		})
    		.fail(function (jqXhr, textStatus, errorText) {
//     			alert("오류 : " + errorText);
    		});
    		return false;
    	}
    });
    </script>
</body>
</html>
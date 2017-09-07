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

<script src="/memory/resources/js/jquery-3.2.1.min.js"></script>
<script src='/memory/resources/js/fullcalendar-3.2.0/lib/moment.min.js'></script>
<script src='/memory/resources/js/fullcalendar-3.2.0/fullcalendar.js'></script>
</head>

<body>
	<!-- 노트바 -->
	<div class="w3-sidebar w3-round"
		style="display: none; background-color: white; width: 300px; z-index: 101;"
		id="noteBar">
		<div
			style="padding: 8px 25px; margin-top: 20px; text-align: center; font-size: 18px;">
			<i class="fa fa-book w3-xlarge"></i> NOTES
		</div>
		<!-- 노트 캘린더 -->
		<div id='calendar' style="width: 260px;" class="w3-margin"></div>
		<!-- 노트 리스트 -->
		<div id="noteList"></div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title">
						<i class="fa fa-envelope" style="color: #555555;"></i> Share a
						note
					</h2>
				</div>
				<br>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;노트를 공유할 메일 주소를 입력해주세요.</p>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon"
							style="box-shadow: 1px 2px 5px #bbb;"><i
							class="fa fa-envelope"></i></span> <input id="email" type="text"
							style="box-shadow: 1px 2px 5px #bbb;" class="form-control"
							name="email" placeholder="받는 사람">
					</div>
				</div>
				<div class="modal-footer">
					<div id="emailNoteSubmitBtn" class="btn btn-default"
						data-dismiss="modal">
						<i class="fa fa-share"></i>보내기
					</div>
					<div class="btn btn-default" data-dismiss="modal">취소</div>
				</div>
			</div>

		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="downloadNoteModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">

				<div class="modal-body">
					<h1>[노트 다운로드]</h1>
					<br>
					<h2>노트를 다운로드 하겠습니까?</h2>
					<br> <a id="downloadNotePath" class="btn btn-default">다운로드</a>
					<div type="button" class="btn btn-default" data-dismiss="modal">취소</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 노트모달 -->
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<div id='title' class="w3-margin w3-padding"
						style="text-align: center;"></div>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div id='date' class="w3-margin w3-padding"
								style="text-align: right;"></div>
							<div id='content' class="w3-margin w3-padding"
								style="text-align: left;"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<span id='update' class="w3-margin w3-padding"
						style="text-align: right;"> </span>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인뷰 -->
	<div id="mainView" class="container" style="z-index: 7;">
		<!-- 검색 -->
		<div>
			<br>
			<h3 class="tit_brunch">드래그가 글이 되는 공간, 드래그노트</h3>
			<p class="desc_brunch">
				<span class="part">드래그만으로 원하는 텍스트를 담아보세요.<br></span>
				<!-- 			<span class="part">그리고 다시 꺼내 보세요.<br></span>  -->
				<!-- 			<span class="part"><span class="txt_brunch">노트 속 간직하고 있는 글과 감성을.</span></span> -->
				<span class="part">
					<div class="col-md-4 col-md-offset">
						<div action="" class="search-form">
							<div class="form-group has-feedback"
								onkeydown="javascript:if(event.keyCode == 13) searchList();">
								<label for="search" class="sr-only">Search</label>
									<input type="text" class="form-control" name="searchWrd"
									id="searchWrd" placeholder="노트 검색">
									<span class="glyphicon glyphicon-search form-control-feedback"></span>
							</div>
						</div>
					</div>
				</span>
				<div class="btn btn-default" style="width: 90px;"
							id="noteWrite">노트작성</div><br>
		</div>
		<br><br><br>
		<!-- 카테고리 선택 -->
		<ul class="nav nav-tabs" id="categoryList">

		</ul>
		<div class="tab-content">
			<br>
			<br>
			<!-- 			<div id="categoryList" class="btn-group" style='position:relative; width:100%; height:60px;'></div> -->
			<!-- 노트카드 뿌리기 -->
			<div id="noteCardList"
				style='position: relative; width: 100%; height: 500px;'></div>
		</div>
	</div>
	
	<div class="noteEditor" id="noteEditor">
				<br><br><br>
			<%@ include file="noteWrite.jsp" %>
	</div>

	<!-- profile modal -->
	<div id="profileModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">설정</h4>
				</div>
				<div class="modal-body">

					<div class="container">
						<h2>이메일 설정</h2>
						<br>
						<p>보낼 이메일을 설정해주세요 :)</p>
						<br>
						<form class="form-inline">
							<div class="form-group">
								<label for="email">Email:</label> <input type="email"
									class="form-control" id="email" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
									class="form-control" id="pwd" placeholder="Enter password">
							</div>
							<button type="submit" class="btn btn-default">설정</button>
						</form>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!-- 본문내용 끝 -->

	<script>
	//노트 검색
	function searchList(){
		var searchWrd = $("#searchWrd").val();
		var memberNo = localStorage.getItem("memberNo");
		$.ajax({
			type: "POST",
			url : "/memory/note/noteList",
			data: {"searchWrd" : searchWrd,
				   "memberNo" : memberNo
			 	},
			dataType : "json"
		})
		.done(function (result) {
			makeNoteCards(result);
			$("#searchWrd").val("");
			return false;
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
		
	}

	//검색 드래그 리스트 만들기
	function searchDragList() {
		var searchWrd = $("#searchWrd1").val();
		var memberNo = localStorage.getItem("memberNo");
		$.ajax({
			type: "POST",
			url : "/memory/drag/dragList",
			data: {"searchWrd" : searchWrd,
					"memberNo" : memberNo},
			dataType : "json"
		})
		.done(function (result) {
			makeDragListAll(result);
			$("#searchWrd1").val("");
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
	}

	//메일로 노트 보내기
	$("#emailNoteSubmitBtn").click(function(){
		var memberNo = localStorage.getItem("memberNo");
		var noteNo = localStorage.getItem("emailNoteNo");
		var emailTo = $("#email").val()
		$.ajax({
			type: "POST",
			url : "/memory/note/mailNote",
			data: {"noteNo" : noteNo,
				   "memberNo" : memberNo,
				   "emailTo"  : emailTo
			},
			dataType : "json"
		})
		.done(function (result) {
			alert(result.msg, "success");
	        $("#email").val("");
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
	})
	function saveNoteNo(noteNo){
		localStorage.setItem("emailNoteNo",noteNo);
	}

	//노트 디테일
	function noteDetail(noteNo){
		$.ajax({
			type: "POST",
			url : "/memory/note/noteDetail",
			data: {"noteNo" : noteNo},
			dataType : "json"
		})
		.done(function (result) {
			var title = result.noteTitle;
			var content = result.noteContent;
			// 시간 뿌리기
			var date = new Date(result.noteRegDate);
			var time = date.getFullYear() + "-" 
			         + (date.getMonth() + 1) + "-" 
			         + date.getDate() + " "
			         + date.getHours() + ":"
			         + date.getMinutes() + ":"
			         + date.getSeconds();
			//시간 뿌리기 끝
//	 		document.getElementById("noteView").style.display = "block";
			$("#title").html("<span>[ "+ result.categoryName +" ]</span><h3>" + title +"</h3>");
			$("#date").html(time);
			$("#content").html(content);
			$("#update").html("<span class='badge quote-badge' dragNote-toggle='tooltip' title='수정'> <a href='#' class='btn_note'><i class='fa fa-text-width' dragNote-toggle='tooltip' title='수정' data-dismiss='modal' onclick='updateNote("+noteNo+");'></i></a></span>&nbsp;<span class='badge quote-badge'dragNote-toggle='tooltip' title='메일로 보내기'> <a href='#' class='btn_note'><i class='fa fa-envelope-o' dragNote-toggle='tooltip' title='메일로 보내기' data-toggle='modal' data-target='#myModal' data-dismiss='modal' onclick='saveNoteNo("+noteNo+");'></i></a></span>&nbsp;<span class='badge quote-badge' dragNote-toggle='tooltip' title='다운로드'><a href='/memory/download/downloadNote?noteNo=" + noteNo +"' class='btn_note'><i class='fa fa-download'></i></a></span></p>");
//	 		document.getElementById("editorBtnDiv").style.display = "none";
			
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
	}
	
	//노트 캘린더
	makeCalendar();
	function makeCalendar() {
//	 	var events = [];
//	 	if (result != null) {
//	 		for (var i = 0; i < result.length; i++) {
//	 			var event = result[i];
//	 			var date = new Date(event.eventDate);
//	 			var time = date.getFullYear() + "-" 
//	 			+ (date.getMonth() + 1) + "-" 
//	 			+ date.getDate();
//	 			events.push({title: event.eventName, start: time, url: event.eventNo});
//	 		}
//	 	}
		
	    $('#calendar').fullCalendar({
	        dayClick: function(date) {
	        	var date = date.format()
	        	$.ajax({
	        		type: "POST",
	        		url : "/memory/note/noteByDate",
	        		data: {"memberNo" : localStorage.getItem("memberNo"),
	        			   "date" : date
	        		},
	        		dataType : "json"
	        	})
	        	.done(function (result) {
	        		var html = "";
	        		for (var i = 0; i < result.length; i++) {

	        			var note = result[i];	
	        			var noteNo = note.noteNo;
	        			
	        			console.log("노트번호"+noteNo)
	        			html += " <div class='quote-box w3-margin w3-padding' ondragstart='drag(event)' draggable='true' id='note"+note.noteNo+"' >";
//	         			html += " <blockquote class='quote-box'>;
	        			html += " <p class='quotation-mark' onclick='noteDetail("+note.noteNo+")'data-toggle='modal' data-target='#detailModal' > “ </p><br> ";
	        			html += " <p class='quote-text' onclick='noteDetail("+note.noteNo+")'data-toggle='modal' data-target='#detailModal'>" + note.noteTitle +" </p>";
	        			html += " <hr>";
	        			html += " <div class='blog-post-actions'>";
	        			// 시간 뿌리기
	        			var date = new Date(note.noteRegDate);
	        			var time = date.getFullYear() + "-" 
	        			         + (date.getMonth() + 1) + "-" 
	        			         + date.getDate() + " "
	        			         + date.getHours() + ":"
	        			         + date.getMinutes() + ":"
	        			         + date.getSeconds();
	        			html += "<p class='blog-post-bottom pull-left'>"+ time +"</p>";
	        					         
	        			html += "<p class='blog-post-bottom pull-right'>";         
	        			html += "   <span class='badge quote-badge'dragNote-toggle='tooltip' title='메일로 보내기'><a href='#'><i class='fa fa-envelope-o' dragNote-toggle='tooltip' title='메일로 보내기' data-toggle='modal' data-target='#myModal' onclick='saveNoteNo("+noteNo+");'></i></a></span>";
	        			html += "	<span class='badge quote-badge'dragNote-toggle='tooltip' title='다운로드'><a href='/memory/download/downloadNote?noteNo=" + noteNo +"'><i class='fa fa-download'></i></a></span></p>";
	        			//시간 뿌리기 끝
	        			html += "</div>";
	        			html += "</div>";
	        			
	        	
	        		}
	        		if (result.length == 0) {
	        			html += "<div class='container'>";
	        			html += "<h6>작성된 노트가 없습니다.</h6>";
	        			html += "</div>";
	        		}
	        		$("#noteList").html(html);

	        	})
	        	.fail(function(jqXhr, textStatus, errorText){
	        		alert("오류: " + errorText + "<br>" + "오류코드: " + status);
	        	});
	        }
	        ,editable : false
	        ,eventLimit : true
//	         ,events: events
//	         ,eventClick: function(event) {
//	             loadEventTimeline(event.url);
//	             return false
	        
	    })
	}
	//메인에 카테고리 뿌리기
	function getMainCategory(){
		var memberNo = localStorage.getItem("memberNo");
		$.ajax({
			type: "POST",
			url : "/memory/note/getCategory",
			data: {"memberNo" : memberNo},
			dataType : "json"
		})
		.done(function (result) {
			var html = '<li class="active"><a data-toggle="tab" onclick="mainNoteList()">전체</a></li>';
			var categoryList = result.categoryList;
			for(var i = 0; i < categoryList.length; i++){
				var category = categoryList[i];
				var categoryNo = category.categoryNo;
				html += "<li class='active' onclick='getNoteByCategoryNo("+category.categoryNo+")' ondragstart='drag(event)' draggable='true' id='category"+category.categoryNo+"' aria-expanded='false' style='min-width:20px;'>"
				html += "<a data-toggle='tab' ondblclick='categoryUpdate(event);' href='#' ondragstart='drag(event)' draggable='true' id='category"+category.categoryNo+"' style='min-width:20px;'>"+category.categoryName+"</a>";
				html += "<a data-toggle='tab' contenteditable='true' style='min-width:20px; display:none;' id='categoryUpdate"+category.categoryNo+"'>"+category.categoryName+"</a>";
				html += "</li>";
			}
			$("#categoryList").html(html);
//	 		document.getElementById("noteView").style.display = "none";
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
	}
	//카테고리 수정
	function categoryUpdate(event){
		var categoryToUpdate = event.target.id;
		var categoryInput = "categoryUpdate" + categoryToUpdate.substring(8);
		alert(categoryInput);
		document.getElementById(categoryToUpdate).style.display = "none";
//	 	document.getElementById(categoryInput).style.display = "block";
		$("#"+categoryInput).attr("style","display:block !important");
	}

	//메인에 카테고리 별로 리스트 뿌리기
	function getNoteByCategoryNo(categoryNo){
		var categoryNo = categoryNo;
		var memberNo = localStorage.getItem("memberNo");
		$.ajax({
			type: "POST",
			url : "/memory/note/noteCartegoryList",
			data: {"memberNo" : memberNo,
				   "categoryNo" : categoryNo		
			},
			dataType : "json"
		})
		.done(function (result) {
			makeNoteCards(result);
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
	}

	// 메인에 노트 뿌리기
	function mainNoteList() {
		var memberNo = localStorage.getItem("memberNo");
		$.ajax({
			type: "POST",
			url : "/memory/note/noteList",
			data: {"memberNo" : memberNo},
			dataType : "json"
		})
		.done(function (result) {
			makeNoteCards(result);
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
	}

	function makeNoteCards(result) {
		var html = "";
		for (var i = 0; i < result.length; i++) {

			var note = result[i];	
			var noteNo = note.noteNo;
			var categoryNo = note.categoryNo;
			html += "<div class='gallery' onclick='noteDetail("+note.noteNo+")' style='box-shadow: 1px 2px 5px #bbb;' ondragstart='drag(event)' draggable='true' id='note"+note.noteNo+"' data-toggle='modal' data-target='#detailModal'  >";
			// 이미지 뿌리기
			var noteContent = note.noteContent;
			if(noteContent.indexOf('<img') != -1) {
				var noteImgSrc = noteContent.split('src="')[1].split('"')[0];
				html += '<figure><img id="note'+note.noteNo+'" src="' + noteImgSrc + '" alt="" onclick="noteDetail('+note.noteNo+')" ></figure>';
			} else {
				html += '<figure><img id="note'+note.noteNo+'" src="/memory/resources/img/D.png" width="180" height="140" alt="" onclick="noteDetail('+note.noteNo+')" ></figure>';
			}
			html += "	<div  class='desc'><p>" + note.noteTitle + "</p></div>";
			html += "</div>";

		}
		if (result.length == 0) {
			html += "<div class='gallery'>";
			html += '	<img src="/memory/resources/img/D.png" alt="" width="300px" height="200px" >';
			html += "	<div  class='desc'><p> 노트가 없습니다. </p></div>";
			html += "</div>";
		}
		$("#noteCardList").html(html);
	}

	//다음 검색 버튼 클릭 
	// $("#daumSubmit").click(function(){
//	     daumSearch.init();
//	     daumSearch.search();
//	     document.getElementById("daumView").style.display = "block";
//	 	return false;
	// })

	// 로딩 시 위치 지정
	window.onload = function () {
//	 	document.getElementById("editorOpenBtn").style.top = (window.innerHeight - 36)/2 +"px";
//	 	document.getElementById("editorCloseBtn").style.top = (window.innerHeight - 36)/2 +"px";
//	 	document.getElementById("searchView").style.width = (window.innerWidth - 420) +"px";
//	 	document.getElementById("searchView").style.height = window.innerHeight +"px";
//	 	document.getElementById("noteView").style.width = (window.innerWidth - 420) +"px";
//	 	document.getElementById("noteView").style.height = window.innerHeight +"px";
		document.getElementById("mainView").style.width = (window.innerWidth - 420) +"px";
		document.getElementById("mainView").style.height = window.innerHeight +"px";
		document.getElementById("noteEditor").style.display = "none";
		getMainCategory();
		makeDragList();
		mainNoteList();
	}

	// 브라우저 창 크기 변화 시 위치 지정 
	$(window).resize(function(){
//	 	document.getElementById("editorOpenBtn").style.top = (window.innerHeight - 36)/2 +"px";
//	 	document.getElementById("editorCloseBtn").style.top = (window.innerHeight - 36)/2 +"px";
//	 	document.getElementById("searchView").style.width = (window.innerWidth - 420) +"px";
//	 	document.getElementById("searchView").style.height = window.innerHeight +"px";
//	 	document.getElementById("noteView").style.width = (window.innerWidth - 420) +"px";
//	 	document.getElementById("noteView").style.height = window.innerHeight +"px";
		document.getElementById("mainView").style.width = (window.innerWidth - 420) +"px";
		document.getElementById("mainView").style.height = window.innerHeight +"px";
	});

	// 내비바 아이콘으로 열고 닫기
	$("#noteWrite").click(function(e) {
    	document.getElementById("mainView").style.display = "none";
    	document.getElementById("profileModal").style.display = "none";
    	document.getElementById("noteEditor").style.display = "";
    	document.getElementById("noteUpdateBtn").style.display = "none";
		document.getElementById("noteSubmitBtn").style.display = "block"
    	getCategory();
    });
	
	function drag_open() {
		document.getElementById("sideDragBar").style.display = "none";
//	 	document.getElementById("editorBtnDiv").style.display = "none";
		document.getElementById("noteBar").style.display = "none";
		$("#sideDragBar").show("slide", {direction: "left" }, 600);
//	 	$("#editorBtnDiv").show("slide", {direction: "left" }, 600);
	    makeDragList();
		getCategory(); // 카테고리 셀렉박스에 옵션 넣기
	}

	function drag_close() {
		$("#noteBar").hide("slide", {direction: "left" }, 600);
	}

	// function note_close() {
//	     document.getElementById("noteBar").style.display = "none";
	// }

	// function search_open() {
//	 	document.getElementById("mainView").style.display = "none";
//	 	document.getElementById("newsView").style.display = "none";
//	 	$("#sideDragBar").show("slide", {direction: "left" }, 600);
//	 	document.getElementById("searchView").style.display = "block";
	// }

	function main_open() {
//		document.getElementById("newsView").style.display = "none";
//		document.getElementById("noteBar").style.display = "none";
//		document.getElementById("sideDragBar").style.display = "block";
//	 	document.getElementById("editorBtnDiv").style.display = "none";
//		document.getElementById("mainView").style.display = "block";
    	document.getElementById("noteEditor").style.display = "none";
    	document.getElementById("profileModal").style.display = "";
    	document.getElementById("mainView").style.display = "";
    	document.getElementById("mainView").style.width = (window.innerWidth - 420) +"px";
		document.getElementById("mainView").style.height = window.innerHeight +"px";
		getMainCategory();
		mainNoteList();
		makeDragList();
		$("#noteTitle").val("");
		$(".nicEdit-main").html('');
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
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
	}
	
	function open_editor() {
//	 	document.getElementById("editorBtnDiv").style.display = "block";
//		document.getElementById("mainView").style.display = "none";
//	 	document.getElementById("searchView").style.display = "none";
//		document.getElementById("newsView").style.display = "none";
    	document.getElementById("mainView").style.display = "none";
    	document.getElementById("profileModal").style.display = "none";
    	document.getElementById("noteEditor").style.display = "";
	}

	//노트 다운로드
	function downloadNote(noteNo){
		var url = "/memory/download/downloadNote?noteNo=" + noteNo;
		$("#downloadNotePath").attr("href", url);
	}

	$("#downloadNotePath").click(function(){
		$("#downloadNoteModal").modal('hide');
	})

	//노트 업데이트
	function updateNote(noteNo){
		localStorage.setItem("noteNoToUpdate",noteNo);
    	document.getElementById("noteUpdateBtn").style.display = "block";
		document.getElementById("noteSubmitBtn").style.display = "none"
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
			localStorage.setItem("selectedItem", "categoryNo" + result.categoryNo);
			getCategory();
			open_editor();
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
		
	}
	// 검색 뒤로 가기
	// function goBack() {
//	 	document.getElementById("searchResult").style.display = "none";
//	 	document.getElementById("daumView").style.display = "block";
	// }

	// 노트 에티터 뿌리기
	$("#editorOpenBtn").click(function() {
		document.getElementById("mainView").style.display = "none";
//	 	document.getElementById("searchView").style.display = "none";
		document.getElementById("newsView").style.display = "none";
		$("#editorView").show("slide", {direction: "left" }, 600);
		$("#editorOpenBtn").toggle();
		$("#editorCloseBtn").toggle();
	});

	// 노트 에디터 닫기
	$("#editorCloseBtn").click(function() {
		$("#editorView").hide("slide", {direction: "left" }, 700);
//	 	$("#searchView").show("slide", {direction: "left" }, 1300);
//	 	$("#searchView").show("slide", {direction: "left" }, 1300);
		$("#editorOpenBtn").toggle();
		$("#editorCloseBtn").toggle();
	});

	// 노트리스트 만들기
	function makeNoteList() {
		var memberNo = ${memberNo};
		$.ajax({
			type: "POST",
			url : "/memory/note/noteList",
			data: {"memberNo" : memberNo},
			dataType : "json"
		})
		.done(function (result) {
			var html = "";
			for (var i = 0; i < result.length; i++) {

				var note = result[i];	
				var noteNo = note.noteNo;
				
				console.log("노트번호"+noteNo)
				html += " <div class='quote-box w3-margin w3-padding' ondragstart='drag(event)' draggable='true' id='note"+note.noteNo+"' >";
//	 			html += " <blockquote class='quote-box'>;
				html += " <p class='quotation-mark' onclick='noteDetail("+note.noteNo+")'data-toggle='modal' data-target='#detailModal' > “ </p><br> ";
				html += " <p class='quote-text' onclick='noteDetail("+note.noteNo+")'data-toggle='modal' data-target='#detailModal'>" + note.noteTitle +" </p>";
				html += " <hr>";
				html += " <div class='blog-post-actions'>";
				// 시간 뿌리기
				var date = new Date(note.noteRegDate);
				var time = date.getFullYear() + "-" 
				         + (date.getMonth() + 1) + "-" 
				         + date.getDate() + " "
				         + date.getHours() + ":"
				         + date.getMinutes() + ":"
				         + date.getSeconds();
				html += "<p class='blog-post-bottom pull-left'>"+ time +"</p>";
						         
				html += "<p class='blog-post-bottom pull-right'>";         
				html += "   <span class='badge quote-badge'dragNote-toggle='tooltip' title='메일로 보내기'><a href='#'><i class='fa fa-envelope-o' dragNote-toggle='tooltip' title='메일로 보내기' data-toggle='modal' data-target='#myModal' onclick='saveNoteNo("+noteNo+");'></i></a></span>";
				html += "	<span class='badge quote-badge'dragNote-toggle='tooltip' title='다운로드'><a href='/memory/download/downloadNote?noteNo=" + noteNo +"'><i class='fa fa-download'></i></a></span></p>";
				//시간 뿌리기 끝
				html += "</div>";
				html += "</div>";
				
		
			}
			if (result.length == 0) {
				html += "<div class='container'>";
				html += "<h6>작성된 노트가 없습니다.</h6>";
				html += "</div>";
			}
			$("#noteList").html(html);
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
	}

	// 노트 드래그로 삭제
	function deleteNote(noteNo) {
		var noteNo = noteNo;
		var memberNo = ${memberNo};
		
		alert({
			  title: "확인",
			  text: "노트를 삭제하시겠어요~?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonText: "네, 삭제해주세요 :)",
			  cancelButtonText: "아니요!",
			  closeOnConfirm: false
			},
			function(){
				$.ajax({
					url:"/memory/note/deleteNote",
					dataType:"json",
					data: {"noteNo":noteNo},
					type: "POST"
					}).done(function (result){
						alert(result.msg,'success');
						makeNoteList();
						mainNoteList();
				});
			}
		);
	}
	//카테고리 삭제
	function deleteCategory(categoryNo) {
		alert({
			  title: "확인",
			  text: "카테고리와 해당 게시물을 모두 삭제하시겠어요?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonText: "네, 삭제해주세요 :)",
			  cancelButtonText: "아니요!",
			  closeOnConfirm: false
			},
			function(){
				$.ajax({
					url:"/memory/note/deleteCategory",
					dataType:"json",
					data: {"categoryNo":categoryNo},
					type: "POST"
					}).done(function (result){
						alert(result.msg,'success');
						makeNoteList();
						mainNoteList();
						getMainCategory();
				});
			}
		);
	}	

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
			alert(result.msg);
			appendCategory(result.categoryList);
			document.getElementById("categoryToAdd").style.display = "none";
		    document.getElementById("Category1").style.display = "none";
		    document.getElementById("Category2").style.display = "none";
		    $("#categoryToAdd").val("");
			
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
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

	//Tooltip 효과
	$(document).ready(function(){
	    $('[dragNote-toggle="tooltip"]').tooltip();   
	});
    </script>
</body>
</html>
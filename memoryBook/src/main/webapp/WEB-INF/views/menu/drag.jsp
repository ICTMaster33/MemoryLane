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
	<!-- Modal -->
	<div class="modal fade" id="myModal_drag" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title">
						<i class="fa fa-envelope" style="color: #555555;"></i> Share a
						drag
					</h2>
				</div>
				<br>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;드래그를 공유할 메일 주소를 입력해주세요.</p>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon"
							style="box-shadow: 1px 2px 5px #bbb;"><i
							class="fa fa-envelope"></i></span> <input id="email_drag" type="text"
							style="box-shadow: 1px 2px 5px #bbb;" class="form-control"
							name="email_drag" placeholder="받는 사람">
					</div>
				</div>
				<div class="modal-footer">
					<div id="emailDragSubmitBtn" class="btn btn-default"
						data-dismiss="modal">
						<i class="fa fa-share"></i>보내기
					</div>
					<div class="btn btn-default" data-dismiss="modal">취소</div>
				</div>
			</div>

		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="downloadDragModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">

				<div class="modal-body">
					<h1>[드래그 다운로드]</h1>
					<br>
					<h2>드래그를 다운로드 하겠습니까?</h2>
					<br> <a id="downloadDragPath" class="btn btn-default">다운로드</a>
					<div type="button" class="btn btn-default" data-dismiss="modal">취소</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 드래그모달 -->
	<div class="modal fade" id="detailModal_drag" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<div id='title_drag' class="w3-margin w3-padding"
						style="text-align: center;"></div>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div id='date_drag' class="w3-margin w3-padding"
								style="text-align: right;"></div>
							<div id='content_drag' class="w3-margin w3-padding"
								style="text-align: left;"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<span id='update_drag' class="w3-margin w3-padding"
						style="text-align: right;"> </span>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인뷰 -->
	<div id="mainView_drag" class="container" style="z-index: 7;">
		<!-- 검색 -->
		<div>
			<br>
			<h3 class="tit_brunch">드래그 리스트</h3>
			<p class="desc_brunch">
				<span class="part">드래그를 공유해 보세요.<br></span>
				<!-- 			<span class="part">그리고 다시 꺼내 보세요.<br></span>  -->
				<!-- 			<span class="part"><span class="txt_brunch">드래그 속 간직하고 있는 글과 감성을.</span></span> -->
				<span class="part">
					<div class="col-md-4 col-md-offset">
						<div action="" class="search-form">
							<div class="form-group has-feedback"
								onkeydown="javascript:if(event.keyCode == 13) searchList_drag();">
								<label for="search" class="sr-only">Search</label>
									<input type="text" class="form-control" name="searchWrd_drag"
									id="searchWrd_drag" placeholder="드래그 검색">
									<span class="glyphicon glyphicon-search form-control-feedback"></span>
							</div>
						</div>
					</div>
				</span>
		</div>
		<br><br><br>
			<!-- 드래그카드 뿌리기 -->
			<div id="dragCardList"
				style='position: relative; width: 100%; height: 500px;'></div>
		</div>
	</div>
	
	<!-- profile modal -->
	<div id="profileModal_drag" class="modal fade" role="dialog">
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
						<p>드래그 내용을 보낼 이메일을 설정해주세요 :)</p>
						<br>
						<form class="form-inline">
							<div class="form-group">
								<label for="email">Email:</label> <input type="email"
									class="form-control" id="email_drag" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
									class="form-control" id="pwd_drag" placeholder="Enter password">
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
	//드래그 검색
	function searchList_drag(){
		var searchWrd_drag = $("#searchWrd_drag").val();
		var memberNo = ${memberNo};
		$.ajax({
			type: "POST",
			url : "/memory/drag/dragList",
			data: {"searchWrd_drag" : searchWrd_drag,
				   "memberNo" : memberNo
			 	},
			dataType : "json"
		})
		.done(function (result) {
			makeDragCards(result);
			$("#searchWrd_drag").val("");
			return false;
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
		
	}

	//메일로 드래그 보내기
	$("#emailDragSubmitBtn").click(function(){
		var memberNo = localStorage.getItem("memberNo");
		var dragNo = localStorage.getItem("emailDragNo");
		var emailTo = $("#email_drag").val()
		$.ajax({
			type: "POST",
			url : "/memory/drag/mailDrag",
			data: {"dragNo" : dragNo,
				   "memberNo" : memberNo,
				   "emailTo"  : emailTo
			},
			dataType : "json"
		})
		.done(function (result) {
			alert(result.msg, "success");
	        $("#email_drag").val("");
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
	})
	function saveDragNo(dragNo){
		localStorage.setItem("emailDragNo",dragNo);
	}

	//드래그 디테일
	function dragDetail(dragNo){
		$.ajax({
			type: "POST",
			url : "/memory/drag/dragDetail",
			data: {"dragNo" : dragNo},
			dataType : "json"
		})
		.done(function (result) {
			var title = result.dragUrlTitle;
			var content = result.dragContent;
			// 시간 뿌리기
			var date = new Date(result.dragRegDate);
			var time = date.getFullYear() + "-" 
			         + (date.getMonth() + 1) + "-" 
			         + date.getDate() + " "
			         + date.getHours() + ":"
			         + date.getMinutes() + ":"
			         + date.getSeconds();
			var time2 = date.getFullYear() + "-" 
			         + (date.getMonth() + 1) + "-" 
			         + date.getDate();         
			//시간 뿌리기 끝
//	 		document.getElementById("dragView").style.display = "block";
			$("#title_drag").html("<span>[ 드래그 데이터  "+time2+" ]</span><h3>" + title +"</h3>");
			$("#date_drag").html(time);
			$("#content_drag").html(content);
			$("#update_drag").html("<span class='badge quote-badge' dragNote-toggle='tooltip' title='삭제'> <a href='#' class='btn_drag'><i class='fa fa-eraser' dragNote-toggle='tooltip' title='삭제' data-dismiss='modal' onclick='deleteDrag("+dragNo+");'></i></a></span>&nbsp;<span class='badge quote-badge'dragNote-toggle='tooltip' title='메일로 보내기'> <a href='#' class='btn_drag'><i class='fa fa-envelope-o' dragNote-toggle='tooltip' title='메일로 보내기' data-toggle='modal' data-target='#myModal_drag' data-dismiss='modal' onclick='saveDragNo("+dragNo+");'></i></a></span>&nbsp;<span class='badge quote-badge' dragNote-toggle='tooltip' title='다운로드'><a href='/memory/download/downloadDrag?dragNo=" + dragNo +"' class='btn_drag'><i class='fa fa-download'></i></a></span></p>");
//	 		document.getElementById("editorBtnDiv").style.display = "none";
			
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
	}
		
	// 메인에 드래그 뿌리기
	function mainDragList() {
		var memberNo = localStorage.getItem("memberNo");
		$.ajax({
			type: "POST",
			url : "/memory/drag/dragList",
			data: {"memberNo" : memberNo},
			dataType : "json"
		})
		.done(function (result) {
			makeDragCards(result);
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
	}

	function makeDragCards(result) {
		var html = "";
		for (var i = 0; i < result.length; i++) {

			var drag = result[i];	
			var dragNo = drag.dragNo;
			html += "<div class='gallery' onclick='dragDetail("+drag.dragNo+")' style='box-shadow: 1px 2px 5px #bbb;' ondragstart='drag(event)' draggable='true' id='drag"+drag.dragNo+"' data-toggle='modal' data-target='#detailModal_drag'  >";
			// 이미지 뿌리기
			var dragContent = drag.dragContent;
			if(dragContent.indexOf('<img') != -1) {
				var dragImgSrc = dragContent.split('src="')[1].split('"')[0];
				html += '<figure><img id="drag'+drag.dragNo+'" src="' + dragImgSrc + '" alt="" onclick="dragDetail('+drag.dragNo+')" ></figure>';
			} else {
				html += '<figure><img id="drag'+drag.dragNo+'" src="/memory/resources/img/D.png" width="180" height="140" alt="" onclick="dragDetail('+drag.dragNo+')" ></figure>';
			}
			html += "	<div  class='desc'><p>" + drag.dragUrlTitle + "</p></div>";
			html += "</div>";

		}
		if (result.length == 0) {
			html += "<div class='gallery'>";
			html += '	<img src="/memory/resources/img/D.png" alt="" width="300px" height="200px" >';
			html += "	<div  class='desc'><p> 드래그가 없습니다. </p></div>";
			html += "</div>";
		}
		$("#dragCardList").html(html);
	}

	//드래그 다운로드
	function downloadDrag(dragNo){
		var url = "/memory/download/downloadDrag?dragNo=" + dragNo;
		$("#downloadDragPath").attr("href", url);
	}

	$("#downloadDragPath").click(function(){
		$("#downloadDragModal").modal('hide');
	})

	// 검색 뒤로 가기
	// function goBack() {
//	 	document.getElementById("searchResult").style.display = "none";
//	 	document.getElementById("daumView").style.display = "block";
	// }

	// 드래그리스트 만들기
	function makeDragList() {
		var memberNo = ${memberNo};
		$.ajax({
			type: "POST",
			url : "/memory/drag/dragList",
			data: {"memberNo" : memberNo},
			dataType : "json"
		})
		.done(function (result) {
			var html = "";
			for (var i = 0; i < result.length; i++) {

				var drag = result[i];	
				var dragNo = drag.dragNo;
				
				console.log("드래그번호"+dragNo)
				html += " <div class='quote-box w3-margin w3-padding' ondragstart='drag(event)' draggable='true' id='drag"+drag.dragNo+"' >";
//	 			html += " <blockquote class='quote-box'>;
				html += " <p class='quotation-mark' onclick='dragDetail("+drag.dragNo+")'data-toggle='modal' data-target='#detailModal_drag' > “ </p><br> ";
				html += " <p class='quote-text' onclick='dragDetail("+drag.dragNo+")'data-toggle='modal' data-target='#detailModal_drag'>" + drag.dragTitle +" </p>";
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
				html += "<p class='blog-post-bottom pull-left'>"+ time +"</p>";
				//시간 뿌리기 끝
				html += "</div>";
				html += "</div>";
				
		
			}
			if (result.length == 0) {
				html += "<div class='container'>";
				html += "<h6>등록 된 드래그가 없습니다.</h6>";
				html += "</div>";
			}
			$("#dragList").html(html);
		})
		.fail(function(jqXhr, textStatus, errorText){
			alert("오류: " + errorText + "<br>" + "오류코드: " + status);
		});
	}

	// 드래그 삭제
	function deleteDrag(dragNo) {
		var dragNo = dragNo;
		var memberNo = ${memberNo};
		
		var del_chk;
		del_chk = confirm("정말 드래그를 삭제하시겠습니까?");
		
		if (del_chk) {
			$.ajax({
				url:"/memory/drag/deleteDrag",
				dataType:"json",
				data: {"dragNo":dragNo},
				type: "POST"
				}).done(function (result){
					alert(result.msg,'success');
					makeDragList();
					makeDragList_mini();
					mainDragList();
			});
		}
	}
    </script>
</body>
</html>
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

	<div id="wrapper" class="toggled">

		<!-- 뉴스뷰 -->
		<div id='myDrag' style="z-index: 4; min-height: 100%; width: 1200px;">
			<div>
				5대 은행 주담대 대출 신청 건수·신청액 모두 급증<br><br><br>
				<div><div class="articleMedia mediaImageZoom">
				<span class="imageZoom"><span class="imgad_area">
				<img id="mainimg0" style="cursor: pointer;" alt="기사이미지" src="http://thumbnews.nateimg.co.kr/view610/http://news.nateimg.co.kr/orgImg/yt/2017/08/29/AKR20170828168300002_01_i.jpg?type=w540">
				</span><span class="sub_tit">가계대출[연합뉴스 자료사진]</span></span></div></div><br><br>
				(서울=연합뉴스) 이세원 박의래 기자 = 정부가 8·2 부동산대책을 통해 주택담보대출 조이기에 들어가자 정책 시행 전에 대출 신청자가 크게 늘어난 것으로 나타났다.<br><br>
				29일 금융권에 따르면 KB국민·신한·우리·KEB하나·농협 등 5대 은행의 지난 21일과 22일 주택담보대출 신청 건수는 각각 3천643건, 3천215건을 기록했다.<br><br>
				8월 일평균 대출 신청 건수가 2천 건대였던 것과 비교하면 약 1천 건 이상 늘어난 것이다.<br><br>
				다만 지난 23일부터 정부의 8·2 부동산대책이 본격적으로 시행되면서 주택담보대출 증가세는 꺾일 것으로 보인다.<br><br>
				실제로 LTV·DTI 강화가 시작된 첫날인 지난 23일에는 주택담보대출 신청 건수가 1천562건으로 줄었고 신청액도 1천556억원으로 감소했다.<br><br>
				은행권 관계자는 "정부 부동산대책이 은행 대출에 영향을 미치는 것은 이제 시작"이라며 "다음 달 가계부채 대책까지 나오면 주택담보대출 증가세는 꺾일 것이란 전망이 많다"고 말했다.<br><br><br>
				<div><div class="articleMedia mediaImageZoom"><span class="imageZoom"><img id="mainimg1" style="cursor: pointer;" alt="기사 이미지" src="http://thumbnews.nateimg.co.kr/view610/http://news.nateimg.co.kr/orgImg/yt/2017/08/29/AKR20170828168300002_02_i.jpg">
				<span class="sub_tit">[연합뉴스 자료사진]</span></span></div></div><br><br>laecorp@yna.co.kr<br>(끝)<p><br></p>
			</div>
			<div>
				<br>
				<h3 class="tit_brunch">무슨 일이 벌어지고 있을까요, 뉴스 스탠드</h3>
				<img src="http://localhost:8888/memory/resources/img/daumlogo.png" height="50">
				<img src="http://localhost:8888/memory/resources/img/naverlogo.png" height="50">
				<p class="desc_brunch">
					<span class="part">드래그만으로 원하는 기사를 담아보세요.<br></span>
				</p>
			</div>
		</div>
		</div>

		<!-- Bootstrap core JavaScript -->
		<script src="/memory/resources/js/popper.min.js"></script>
		<script src="/memory/resources/js/bootstrap.min.js"></script>

		<script>
    
 // 이전 드래그 텍스트
    var prevText;

    // 뉴스뷰에서 드래그 등록
    $("#myDrag").mouseup(function(){
    	//html태그 추출부
    	var range = window.getSelection().getRangeAt(0),
    			  content = range.extractContents(),
    			     span = document.createElement('SPAN');
    	
    			span.appendChild(content);
    			var htmlContent = span.innerHTML;
    	
    			range.insertNode(span);
    	
    	var text = htmlContent; //결과값을 text변수에 삽입

    	//정규표현식을 통한 이미지 태그주소 저장 (미사용 로직, 공부용으로 백업)
//    	var pattern = /(http[^\s]+(?=\.(jpg|gif|png|JPG|GIF|PNG))\.\2)/gm;
//    	var image_tag = text.match(pattern);
//    	var img_Array = new Array(); //Array 배열생성
//    	var img_Obj = new Object(); //image_tag값을 저장 할 Object
    	
//   	if(image_tag != null) {
//	    	for (var i = 0; i < image_tag.length; i++) {
//	    		img_Obj = new Object();
//	    		console.log(image_tag[i]);
//	    		img_Obj.img = image_tag[i];
//	    		img_Array.push(img_Obj);
//			}
//    	}
		
    	// 드래그 텍스트 공백인지 앞의 드래그와 중복되는지 체크!
    	if (text !='' && text.length > 1 && $.trim(text).length != 0 && prevText != text) {
				$.ajax({
			    	url: "/memory/drag/registDrag",
			    	type: "POST",	
			    	data: {"dragContent": text},
			    	success: function (result) {
			    		alert("등록성공");
			    		prevText = text;
			    		makeDragList_mini();
			    	},
			    	error: function (jqXhr, textStatus, errorText) {
			    		alert("오류 : " + errorText);
			    	}
			    });
	    }
	});
    
    // 드래그 리스트 만들기
    function makeDragList_mini() {
    	$.ajax({
    		type: "POST",
    		url : "/memory/drag/dragList",
    		data: {"memberNo" : ${memberNo}},
    		dataType : "json"
    	})
    	.done(function (result) {
    		makeDragListAll(result);
    	})
    	.fail(function(jqXhr, textStatus, errorText){
    		alert("오류: " + errorText + "<br>" + "오류코드: " + status);
    	});
    }

    // 링크열기
    function openUrl(event) {
    	window.open(event.target.id, "_blank");
    }


    // 드래그 드래그로 삭제
    function deleteDrag(dragNo) {
    	var dragNo = dragNo;
    	var memberNo = localStorage.getItem("memberNo");
    	
    	swal({
    		  title: "* :-O",
    		  text: "드래그를 삭제하시겠어요~?",
    		  type: "warning",
    		  showCancelButton: true,
    		  confirmButtonText: "네, 삭제해주세요 :)",
    		  cancelButtonText: "아니요!",
    		  closeOnConfirm: false
    		},
    		function(){
    			$.ajax({
    				url:"/memory/drag/deleteDrag.do",
    				dataType:"json",
    				data: {"dragNo":dragNo},
    				type: "POST"
    				}).done(function (result){
    					swal("₍ᐢ•ﻌ•ᐢ₎*･ﾟ｡", result.msg, 'success');
    					makeDragList_mini();
    			});
    		}
    	);
    	
    }	
    </script>
</body>
</html>

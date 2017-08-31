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
<script
	src="/memory/resources/clipboard.js-master/dist/clipboard.min.js"></script>
</head>

<body>

	<div id="wrapper" class="toggled">

		<!-- 뉴스뷰 -->
		<div id='myDrag' style="z-index: 4; min-height: 100%; width: 1200px;">
			<div>
				5대 은행 주담대 대출 신청 건수·신청액 모두 급증<br><br><br>
				<div><div class="articleMedia mediaImageZoom">
				<span class="imageZoom"><span class="imgad_area">
				<img id="mainimg0" style="cursor: pointer;" alt="기사이미지" src="http://thumbnews.nateimg.co.kr/view610/http://news.nateimg.co.kr/orgImg/yt/2017/08/29/AKR20170828168300002_01_i.jpg">
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
			<div>
				<ul class="nav nav-tabs" id="newsStand">
					<li class="active"><a data-toggle="tab" onclick="getNews(2)">정치</a></li>
					<li class="active"><a data-toggle="tab" onclick="getNews(3)">경제</a></li>
					<li class="active"><a data-toggle="tab" onclick="getNews(4)">사회</a></li>
					<li class="active"><a data-toggle="tab" onclick="getNews(5)">생활/문화</a></li>
					<li class="active"><a data-toggle="tab" onclick="getNews(6)">세계</a></li>
					<li class="active"><a data-toggle="tab" onclick="getNews(7)">IT/과학</a></li>
				</ul>
				<div class="tab-content">
					<br>
					<br>
					<div id="newsSection"
						style='position: relative; width: 100%; height: 800px; overflow: auto;'></div>
					<div id="newsDetailSection"
						style="display: none; position: relative; width: 100%; height: 800px; overflow: auto; background-color: #fbfbfb;">
						<h2 id='newsTitleDiv'></h2>
						<br>
						<div id='newsDateDiv' style="text-align: right; font-size: 15px;"></div>
						<div id='myCarousel' class="carousel" data-ride="carousel"
							style='width: 70%; margin: 5% 15% 5% 15%;'>
							<!-- Indicators -->
							<ol class="carousel-indicators">
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner"></div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev" style='color: gray;'> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								data-slide="next" style='color: gray;'> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<br>
						<div id='newsContentDiv'></div>
					</div>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript -->
		<script src="/memory/resources/js/popper.min.js"></script>
		<script src="/memory/resources/js/bootstrap.min.js"></script>

		<script>
	//뉴스 상세 뿌리기
    function getNewsDetail(url) {
    	var urlToRead = "http://www.mlec.co.kr:10010/naverNewsDetail?url=" + url;
    	var html = "";
    	$.ajax({
    		type: "GET",
    		url : urlToRead,
    		dataType : "json"
    	})
    	.done(function (result) {
    		$.ajax({
    			type: "GET",
    			url : "http://www.mlec.co.kr:10010/naverNewsDetailBack",
    			dataType : "json"
    		})
    		.done(function (result) {
    			$("#newsTitleDiv").html(result[0].title);
    			$("#newsDateDiv").html(result[0].date);
    			var imgs = "";
    			var lis = "";
    			if(result[0].images[0] != null){
    				for(var i = 0; i < result[0].images.length; i++){
    					$("#myCarousel").attr("style", "display:block;width: 70%; margin: 5% 15% 5% 15%;");
    					if (i == 0){
    						imgs += '<div class="item active">';
    						imgs += "<img src='" + result[0].images[i] + "' alt='' style='width:100%;'>";
    						imgs += "</div>";
    						lis += '<li data-target="#myCarousel" data-slide-to="' + i + '" class="active"></li>';
    					}else{
    						imgs += '<div class="item">';
    						imgs += "<img src='" + result[0].images[i] + "' alt='' style='width:100%;'>";
    						imgs += "</div>";
    						lis += '<li data-target="#myCarousel" data-slide-to="' + i + '"></li>';
    					}
    				}				
    				$(".carousel-inner").html(imgs);
    				$(".carousel-indicators").html(lis);
    			}else {
    				$(".carousel-inner").html("");
    				$(".carousel-indicators").html("");
    				$("#myCarousel").attr("style", "display:none;width: 70%; margin: 5% 15% 5% 15%;");
    			}		
//     			if(result[0].images[0].length > 0){
//     				for(var i = 0; i < result[0].images.length; i++){
//     					imgs += "<img src='" + result[0].images[i] + "'>";
//     				}				
//     				$("#newsImgDiv").html(imgs);
//     			}else {
//     				$("#newsImgDiv").html("");
//     			}	

    			if(result[0].content.indexOf("{}") != -1){
    				var beautifulContent = result[0].content.split("{}")[1].trim();
    				$("#newsContentDiv").html(beautifulContent);
    			}else{
    				$("#newsContentDiv").html(result[0].content);
    			}
    			document.getElementById("newsSection").style.display = "none";
    			document.getElementById("newsDetailSection").style.display = "block";
    			return false;
    		})		
    	})
    }

    //뉴스 뿌리기
    function getNews(newsNo) {
    	var urltoread = "";
    	switch(newsNo){
    	case 2: urltoread = "http://www.nate.com/"; break;
    	case 3: urltoread = "http://www.mlec.co.kr:10003/naverNewsEconomy"; break;
    	case 4: urltoread = "http://www.mlec.co.kr:10004/naverNewsSociety"; break;
    	case 5: urltoread = "http://www.mlec.co.kr:10100/naverNewsCulture"; break;
    	case 6: urltoread = "http://www.mlec.co.kr:10006/naverNewsGlobal"; break;
    	case 7: urltoread = "http://www.mlec.co.kr:10007/naverNewsIT"; break;
    	}
    	var newshtml = "";
    	$.ajax({
    		type: "GET",
    		url : urltoread,
    		dataType : "json"
    	})
    	.done(function (result) {
    		for (var i = 0; i < result.length; i++) {
    			newshtml += " <div class='quote-box w3-margin w3-padding' onclick='please(event)' id='"+result[i].url+"'>";
    			newshtml += " 	<p class='quotation-mark' onclick='please(event)' id='"+result[i].url+"' > “ </p><br> ";
    			newshtml += " 	<p class='quote-text' onclick='please(event)' id='"+result[i].url+"'>";
    			if(result[i].img != null){
    				newshtml += "	<img src='" + result[i].img + "' id='"+result[i].url+"'>";
    			}
    			newshtml += result[i].title +" </p>";
    			newshtml += " 	<hr>";
    			newshtml += " 	<div class='blog-post-actions'>";					           
    			newshtml += " 		<p onclick='please(event)' id='"+result[i].url+"'>" + result[i].content.split("…")[0] + "…</p>";
    			newshtml += "	</div>";
    			newshtml += "</div>";
    		
    		}
    		$("#newsSection").html(newshtml);
    		document.getElementById("newsSection").style.display = "block";
    		document.getElementById("newsDetailSection").style.display = "none";
    	})
    	.fail(function(jqXhr, textStatus, errorText){
    		alert("628에러발생: " + errorText + "<br>" + "상태: " + textStatus);
    	});
    }

    function please(event){
    	var url2 = event.target.id;
    	getNewsDetail(url2);
    }
    
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

    	//정규표현식을 통한 이미지 태그주소 저장
    	var pattern = /(http[^\s]+(?=\.(jpg|gif|png|JPG|GIF|PNG))\.\2)/gm;
    	var image_tag = text.match(pattern);

    	// 드래그 텍스트 공백인지 앞의 드래그와 중복되는지 체크!
    	if (text !='' && text.length > 1 && $.trim(text).length != 0 && prevText != text) {
    		//이미지 저장
    		if(image_tag != null) { //텍스트만 드래그 할 경우 null에러 방지
	    	   	for (var i = 0; i < image_tag.length; i++) {
	    	   		setTimeout(function(){
	    	   		 }, 100);
	    	  		$.ajax({
	    	  			url: "/memory/drag/registDragImg",
	    	  			type: "POST",	
	    	  			data: {"imageTag": image_tag[i]},
	    	  			success: function (result) {
	    					console.log(image_tag[i] + "이미지 등록성공");
	    	  			},
	    	   			error: function (jqXhr, textStatus, errorText) {
	    	   				alert("이미지 저장 에러발생 : " + errorText);
	    				}
	    			});
	    		}
    		}
			$.ajax({
		    	url: "/memory/drag/registDrag",
		    	type: "POST",	
		    	data: {"dragContent": text},
		    	success: function (result) {
		    		alert("등록성공");
		    		prevText = text;
		    		makeDragList();
		    	},
		    	error: function (jqXhr, textStatus, errorText) {
		    		alert("에러발생 : " + errorText);
		    	}
		    });
    	}
	});
    
    // 드래그 노트에 추가하기.
    $("div[id^=drag]").click(function(event){
    	var addDragNo = event.target.id.substring(4);
    	if (noteOpenYn) {
    		$.ajax({
    			url : "/memory/drag/selectDrag.do",
    			type: "POST",
    			data: {"dragNo" : addDragNo},
    			dataType: "json"
    		})
    		.done(function (result) {
    			$(".nicEdit-main").append(result.dragContent.replace("amp;", "&") + "<br>");
    		})
    		.fail(function (jqXhr, textStatus, errorText) {
//     			alert("에러발생 : " + errorText);
    		});
    		return false;
    	}
    });

    // 드래그 리스트 만들기
    function makeDragList() {
    	$.ajax({
    		type: "POST",
    		url : "/memory/drag/dragList.do",
    		data: {"memberNo" : ${memberNo}},
    		dataType : "json"
    	})
    	.done(function (result) {
    		makeDragListAll(result);
    	})
    	.fail(function(jqXhr, textStatus, errorText){
    		alert("에러발생: " + errorText + "<br>" + "상태: " + status);
    	});
    }

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
    			html += "<p class='blog-post-bottom pull-left' style='font-style:italic;font-size:12px;'>출처 : 드래그노트 뉴스스탠드</p>";
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
    					makeDragList();
    			});
    		}
    	);
    	
    }	
    </script>
</body>
</html>
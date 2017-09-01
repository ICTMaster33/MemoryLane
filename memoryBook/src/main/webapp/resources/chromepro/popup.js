/*
$("#login").on('click',(function(){
	var text =$("#id").val();  
	var pwd = $("#pw").val();
	 
	sessionStorage.setItem('id',text);
	sessionStorage.setItem('pwd',pwd)
	var myWindow = window.open("",sessionStorage.getItem('id') , "width=500,height=500");
	 myWindow.document.write("<p>" + sessionStorage.getItem('id') + "님 안녕하세요</p><br>" +"<input type='text' id='text' value="+ sessionStorage.getItem('id') + ">");
	 myWindow.document.write("<p>비밀번호는" + sessionStorage.getItem('pwd') + "입니다. </p><br>");
}));

$("#login").on('click',(function(){
	alert('하이하이');
	
}));*/

/*$("#join").on('click',(function(){
	 window.open("http://localhost:8888/memory/");

}));
*/

$("#join").on('click',(function(){
	 window.open("http://localhost:8888/memory/");

}));


$("#login").click(function () {
	
	var text =$("#email").val();  
	var pwd = $("#pw").val();
	
	
	$.ajax ({
		url: "http://localhost:8888/memory/member/login_ex",
		type: "POST",
		data: {
			"email" : text,
			"password" : pwd
			},
		dataType: 'JSON',
		success : function(result) {
			
		  		if(result == true){
		  			document.querySelector("#afterLogin").style.display = "block";
		            document.querySelector("#loginForm").style.display = "none";

		            localStorage.setItem("email", result.email);
		            localStorage.setItem("name", result.name);
		            localStorage.setItem("memberNo", result.memberNo);
		            allowDrag();	
		  		
		  		
		  		}
    	    		else {
    	    			alert("ID/PWD를 확인해 주세요")
    	    		}
	    		},
			error : function(result){
				alert(result+"에러에러");
			}
	}); 
	 

	/*$.ajax ({
		url: "http://localhost:8888/drag-note/member/loginextension.do",
		type: "POST",
		data: {
			"email" : text,
			"password" : pwd
			},
		dataType: 'JSON',
		success : function(result) {
				if(result){
					alert("로그인 되었습니다.")
    	    		window.open("http://localhost:8888/drag-note/html/main/main.html");
    	    		}
    	    		else {
    	    			alert("ID/PWD를 확인해 주세요")
    	    		}
	    		},
			error : function(result){
				alert(result+"에러에러");
			}
	});*/
});


function allowDrag() {
    chrome.tabs.executeScript({
      code: 'var prevText; document.querySelector("body").onmouseup = function(){'
       + 'var selectedText = "";'
       + 'if (typeof window.getSelection != "undefined") {'
       + '  var sel = window.getSelection();'
       + '  if (sel.rangeCount) {'
       + '    var container = document.createElement("div");'
       + '    for (var i = 0, len = sel.rangeCount; i < len; ++i) {'
       + '      container.appendChild(sel.getRangeAt(i).cloneContents());'
       + '    }'
       + '    selectedText = container.innerHTML.replace(/&/g, "amp;");'
       + '    console.log(selectedText);'       
       + '  }'
       + '} else if (typeof document.selection != "undefined") {'
       + '  if (document.selection.type == "Text") {'
       + '    selectedText = document.selection.createRange().htmlText.replace(/&/g, "amp;");'
       + '  }'
       + '}'
       + 'var dragUrl = window.location.href.replace(/&/g, "amp;").replace(/=/g, "nun;");'
       + 'var dragUrlTitle = document.getElementsByTagName("title")[0].innerHTML.replace(/&/g, "amp;");'
       + 'console.log(selectedText + " / " + dragUrl);'
       + 'var datatosend = "drag_content=" + selectedText + "&drag_url=" + dragUrl + "&drag_url_title=" + dragUrlTitle +"&member_no='+localStorage.getItem("memberNo")+'";'
       + 'var xhrr = new XMLHttpRequest();'
       + 'xhrr.onreadystatechange = function () {'
       + 'if (xhrr.readyState == 4) {'
       + 'if (xhrr.status == 200) {'
       + 'alert("드래그 저장 완료 :)");'
       + 'prevText = selectedText;'
       + 'window.getSelection().removeAllRanges();'
       + '}	}	};'
       + 'if(selectedText !="" && selectedText.length > 0 && selectedText.trim().length != 0 && prevText != selectedText){'
       + 'if (confirm("드래그를 저장하시겠어요?")) {'
       + 'xhrr.open("POST", "http://www.mlec.co.kr:10020/drag", true);'
       + 'xhrr.setRequestHeader("Content-type","application/x-www-form-urlencoded");'
       + 'xhrr.send(datatosend);}}'
       + '}'
    }, function (result) {
      // 위의 코드가 실행된 후에 이 함수를 호출해주세요. 그 때 result에 담아주세요.
      //이 문서에서 body  태그 아래에 있는 모든 텍스를 가져온다. 그 결과를 bodyText라는 변수에 담는다.
      console.log("good:)");
    });
 };





 function stopDrag() {
	   chrome.tabs.executeScript({
	     code: 'document.querySelector("body").onmouseup = function(){console.log("end")}'
	   }, function (result) {
	     // 위의 코드가 실행된 후에 이 함수를 호출해주세요. 그 때 result에 담아주세요.
	     //이 문서에서 body  태그 아래에 있는 모든 텍스를 가져온다. 그 결과를 bodyText라는 변수에 담는다.
	     console.log("good:)");
	   });
	}



 document.querySelector("#homeOpenBtn").onclick = function () {
	   window.open("http://localhost:8888/memory/", "_blank");
	 }






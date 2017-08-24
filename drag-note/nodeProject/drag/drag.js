/*
	// 사용할 모듈 정리
	1. http (웹 서버 기능) 
	2. fs (파일 내용 읽기)
	3. mysql (데이터베이스 접근)
	4. querystring (파라미터 처리)
	
	게시판 기능중에서 등록폼, 등록, 목록 
	
	/writeForm.do 일 경우 writeForm.html 파일의 내용을 읽어서 
	사용자에게 전송
	
	/write.do 일 경우 넘어온 파라미터 값을 얻어온 다음 데이터베이스에
	입력
	
	등록된 다음 자동으로 /list.do 경로를 호출
	: response.writeHead(302, {"Location": "list.do"}); 
	
	/list.do 일 경우 데이터베이스의 게시물 내용을 조회한 다음 
	사용자 화면으로 결과를 넘겨준다.
 */
var http = require("http");
var request = require("request");
var express = require('express');
var mysql = require('mysql');
var qs = require("querystring");
var app = express();
var cors = require('cors');
var con = mysql.createConnection({
	host: "localhost",
	port: 1521,
	user: "hr",
	password: "hr",
	database: "drag-note"
});
//app.get('/drag', function(req, res){
//	console.log("들어옴");
//	drag(req, res);
//});
//
//app.listen(10020);

function drag(request, response) {
	var pData = "";
	request.on("data", function (data) {
		pData += data;
	});
	request.on("end", function () {
		var param = qs.parse(pData);
		console.log(param);
		console.log(param.drag_content);
		console.log(param.member_no);
		var sql = "insert into tb_drag (drag_no, drag_content, drag_url, drag_url_title, member_no) values(drag_no.nextval, ?, ?, ?, ?) ";
		con.query(
				sql, 
				[param.drag_content.replace(/amp;/g, "&"), param.drag_url.replace(/amp;/g, "&").replace(/nun;/g, "="), param.drag_url_title.replace(/amp;/g, "&"), param.member_no], 
				function (err, result) {
					if (err) {
						console.log("등록 중 오류 발생");
						console.log(err);
						return;
					}
					response.end();
				}
		);
		
	});
}

app.use(cors());

app.post('/drag', function(req, res){
	console.log("드래그");
	drag(req, res);
});

app.listen(10020);


//
//http.createServer(function(request, response) {
//	console.log(request.url);
//	switch (request.url) {
//	case "/drag":
//		drag(request, response);	
//		break;
//	default:
//		response.end();
//	}
//})
//.listen(10020, function() {
//	console.log("10020 서버 구동중");
//});






/**
 * http://usejsdoc.org/
 */
var http = require("http");
var request = require("request");
var express = require('express');
var mysql = require("mysql");
var qs = require("querystring");
var app = express();
var cors = require('cors');

var loginResult = []; 

var con = mysql.createConnection({
	host: "localhost",
	port: 1521,
	user: "hr",
	password: "hr",
	database: "drag-note"
});

//http.createServer(function(request, response) {
//	console.log(request.url);
//	switch (request.url) {
//	case "/login":
//		login(request, response);	
//		break;
//	default:
//		response.end();
//	}
//})
//.listen(10030, function() {
//	console.log("10030 서버 구동중");
//});

function login(email, password) {
	
	var sql = "select member_no, name, email from tb_member where email = ? and password = ?";
	con.query(
			sql, 
			[email, password], 
			function (err, rows, result) {
				if (err) {
					console.log("등록 중 오류 발생");
					console.log(err);
					return;
				}
				loginResult = [];
				if (rows[0] != null){
					console.log(rows[0].name);
					console.log(rows[0].member_no);
					console.log(rows[0].email);
					loginResult = {"loginChk":"true","name":rows[0].name, "memberNo": rows[0].member_no, "email": rows[0].email};
				}else {
					loginResult = {"loginChk":"false"};
				}
			}
	);
}

app.use(cors());

app.get('/login', function(req, res){
	console.log("로그인");
	var param = req.query;
	var email = param.email;
	var password = param.password;
	login(email, password);
	setTimeout(function() { 
	console.log(loginResult);
	res.send(loginResult);
	}, 1600)
});

app.listen(8888);















/**
 * 
 */
var request = require("request"); 
var cheerio = require('cheerio'); 
var iconv = require('iconv-lite');
var express = require('express');
var app = express();
var cors = require('cors');
app.use(cors());
var result = [];

function getNews(url) {
	var requestOptions = { method: "GET" 
			,uri: url
			,headers: { "User-Agent": "Mozilla/5.0" } 
		    ,encoding: null }; 
	
	request(requestOptions, function(error, response, body) { 
		result = [];
		var strContents = new Buffer(body); 
		strContents = iconv.decode(strContents, 'EUC-KR').toString();
		//console.log(strContents.toString('euckr'));	// 한글로 바디 전체를 출력 
		var $ = cheerio.load(strContents); 
		//console.log($('.list_body.newsflash_body').html());	// 기사 목록을 출력 
		var title = $('#articleTitle').text().trim();
		var content = $('#articleBodyContents').text().trim(); 
		var images = [];
		$('#articleBodyContents').find(".end_photo_org").each(function(index, ele){
			images.push($(this).find('img').attr('src'))
		})
		var date = $('.sponsor').find("span.t11").text().trim();
			// 기사의 정보를 result 에 맵으로 입력 1 
		result.push({'url' : url, 
			'title' : title, 
			'content' : content, 
			'images' : images,
			'date' : date
		});
	});
}
var urlToRead;
app.get('/naverNewsDetail', function(req, res){
	console.log("뉴스상세");
	var params = req.query;
	urlToRead = params.url + "&mid=" + params.mid + "&sid1=" + params.sid1 + "&oid=" + params.oid + "&aid=" + params.aid;
	setTimeout(function() {   
		getNews(urlToRead);
		res.send(result);
		}, 400)
});

app.get('/naverNewsDetailBack', function(req, res){
	console.log("뉴스상세2");
	setTimeout(function() {   
		getNews(urlToRead);
		res.send(result);
		}, 400)
});

app.listen(10010);



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

function getNews() {
	var requestOptions = { method: "GET" 
			,uri: "http://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=105"
			,headers: { "User-Agent": "Mozilla/5.0" } 
		    ,encoding: null }; 
	
	request(requestOptions, function(error, response, body) { 
		
		var strContents = new Buffer(body); 
		strContents = iconv.decode(strContents, 'EUC-KR').toString();
		//console.log(strContents.toString('euckr'));	// 한글로 바디 전체를 출력 
		var $ = cheerio.load(strContents); 
		//console.log($('.list_body.newsflash_body').html());	// 기사 목록을 출력 
		$('.list_body.newsflash_body').find('li').each(function(index, ele) { 
			var dt1 = $(this).find('dt').eq(0); 
			
			// 이미지가 없는 경우도 있기 때문에, 이를 확인하여 처리 
			var dt2; 
			if($(this).find(".photo").length == 1) { 
				dt2 = $(this).find('dt').eq(1); 
			} else { 
				dt2 = dt1; 
			} 
			
			var dd = $(this).find('dd').eq(0); 
			
			// 기사의 정보를 result 에 맵으로 입력 1 
			result.push({'url' : dt1.find('a').attr('href'), 
				'img' : dt1.find('img').attr('src'), 
				'title' : dt2.find('a').text().trim(), 
				'content' : dd.text().trim(), 
				'writing' : dd.find(".writing").text().trim(), 
				'date' : dd.find(".date").text().trim()
			});
		});
	}); 
}

app.get('/naverNewsIT', function(req, res){
	console.log("IT");
	getNews();
	res.send(result);
});

app.listen(10007);


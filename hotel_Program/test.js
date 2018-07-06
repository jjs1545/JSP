/*
 * 몽고 디비에 img 저장을 위한 서버!!!
 * 서버 실행 후 localhost:3000 접속 - > img 삽입 시킨다
 * 
 * 
 * 
 * */

var express = require('express'); // ExpressJS 모듈을 추가
var app = express();

var Client = require('mongodb').MongoClient;
Client.connect('mongodb://localhost:27017/local', function(error, db){
    if(error) {
        console.log(error);
    } else {
        console.log("connected:"+db);
        db.close();
    }
});

var mongojs = require('mongojs'); // MongoDB 연결 해야되니 MongoJS 모듈도 추가
var db = mongojs('local', ['images']); // 여기서 genie는 database 이름이고 images테이블을 사용할꺼라고 선언
var bodyParser = require('body-parser'); // json 형태로 파싱할꺼니까 모듈 추가

app.use(express.static(__dirname + '/public')); //public 폴더 안에 javascript 파일과 css파일을 모아둘 예정
app.use(bodyParser.json()); // body-parser 모듈을 사용해서 파싱 해줌

app.set('views', __dirname + '/views'); // ejs 파일들을 저장하기 위해 경로 추가했음
app.set('view engine', 'ejs'); // ejs를 html로 바꿔주면 html로 파일 실행됩니다.

app.get('/',function(req, res) {
	 res.render('addImg');
});

app.get('/file',function(req,res){ //몽고디비에서 filePath 와 name을 불러옴
	db.images.find({"name":"일본"},function(err,doc){
		res.json(doc);
	});
});

app.listen(3000); //server 구동 포트 localhost:3000 여기에 쓰입니다.
console.log("Server running on port 3000");

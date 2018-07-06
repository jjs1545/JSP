/**
 * 
 * 호텔 예약
 * 
 */


var database;
var ReserveSchema;
var ReserveModel;

var init = function(db, schema, model) {
	console.log('init 호출됨.');
	
	database = db;
	ReserveSchema=schema;
	ReserveModel=model;
}

var addReserve = function(req, res) {
	console.log('addReserve 함수 호출됨');
	
	/var paramId = req.body.id || req.query.id;/
	var paramId = req.session.passport.user.id;
	var paramCountry = req.body.name || req.query.name;
	var paramCity = req.body.city || req.query.city;
	var paramHname = req.body.hname || req.query.hname;
	
	console.log('파라미터 : ' + paramId + ', ' + paramCountry + ', ' + paramCity
				 + ', ' + paramHname);
	
	var database = req.app.get('database');
	
	addreserve(database, paramId, paramCountry, paramCity, paramHname, function(err, result) {
		if (err) {
			res.writeHead(200, {'Content-Type' : 'text/html;charset=utf8'});
			res.write('<h2>호텔 예약 추가 중 에러 발생</h2>');
			res.end();
			
			return;
		}
		
		if(result) {
			//res.render('');
			/*res.writeHead(200, {'Content-Type' : 'text/html;charset=utf8'});
			res.write('<h2>호텔 예약 추가 성공</h2>');
			res.end();*/
		} else {
			res.writeHead(200, {'Content-Type' : 'text/html;charset=utf8'});
			res.write('<h2>호텔 예약 추가 실패</h2>');
			res.end();
		}
	});
	
};

var addreserve = function(database, id, country, city, hname, callback) {
	console.log('addreserve 호출됨.');
	
	var reserve = new database.ReserveModel({"id":id,"country":country,"city":city,"hname":hname});
	
	console.dir('reserve:'+reserve);
	
	database.ReserveModel.insertMany(reserve, function(err) {
		if (err) {
			console.log('에러 발생');
			callback(err, null);
			return;
		}else {
		    console.log("호텔 예약 데이터 추가함.");
		    callback(null, reserve);
		}
	});
	/*reserve.save(function(err) {
		if (err) {
			console.log('에러 발생');
			callback(err, null);
			return;
		}
	    console.log("호텔 예약 데이터 추가함.");
	    callback(null, reserve);
	    return res.redirect('/mypage'); 
	});*/
}

var showreserve = function(req, res) {
	console.log('reserve 모듈 안에 있는 showreserve 호출됨.');
    // URL 파라미터로 전달됨
    var paramId = req.session.passport.user.id;
    console.log('요청 파라미터 : ' + paramId);
	var database = req.app.get('database');
    // 데이터베이스 객체가 초기화된 경우
	if (database.db) {
		// 1. 글 리스트
		database.ReserveModel.find({id:paramId}, function(err, results) {
			if (err) {
                console.error('예약 조회 중 에러 발생 : ' + err.stack);
                res.writeHead('200', {'Content-Type':'text/html;charset=utf8'});
				res.write('<h2>예약 조회 중 에러 발생</h2>');
                res.write('<p>' + err.stack + '</p>');
				res.end();
                return;
            }
			if (results) {
				console.dir(results);
				console.log('showReserve Result:'+results);
				
				res.render('profile.ejs',{result:results});

			} else {
				res.writeHead('200', {'Content-Type':'text/html;charset=utf8'});
				res.write('<h2>글 조회  실패</h2>');
				res.end();
			}
		});
	} else {
		res.writeHead('200', {'Content-Type':'text/html;charset=utf8'});
		res.write('<h2>데이터베이스 연결 실패</h2>');
		res.end();
	}
	
};


module.exports.init = init;
module.exports.addReserve = addReserve;
module.exports.showreserve = showreserve;
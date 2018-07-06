/**
 * 
 * 호텔 위치를 찾기위한 map 데이터 추가
 * 
 */
var add = function(req, res) {
	console.log('add 함수 호출됨');
	
	var paramName = req.body.name || req.query.name;
	var paramAddress = req.body.address || req.query.address;
	var paramTel = req.body.tel || req.query.tel;
	var paramLongitude = req.body.longitude || req.query.longitude;
	var paramLatitude = req.body.latitude || req.query.latitude;
	
	console.log('파라미터 : ' + paramName + ', ' + paramAddress + ', ' + paramTel
				 + ', ' + paramLongitude + ', ' + paramLatitude);
	
	var database = req.app.get('database');
	
	addHotel(database, paramName, paramAddress, paramTel, paramLongitude, paramLatitude, function(err, result) {
		if (err) {
			res.writeHead(200, {'Content-Type' : 'text/html;charset=utf8'});
			res.write('<h2>호텔 추가 중 에러 발생</h2>');
			res.end();
			
			return;
		}
		
		if(result) {
			res.writeHead(200, {'Content-Type' : 'text/html;charset=utf8'});
			res.write('<h2>호텔 추가 성공</h2>');
			res.end();
		} else {
			res.writeHead(200, {'Content-Type' : 'text/html;charset=utf8'});
			res.write('<h2>호텔 추가 실패</h2>');
			res.end();
		}
	});
	
};

var addHotel = function(database, name, address, tel, longitude, latitude, callback) {
	console.log('addHotel 호출됨.');
	
	var hotel = new database.HotelModel({
		name : name,
		address : address,
		tel : tel,
		geometry : {
			type : 'Point',
			coordinates : [longitude,latitude]
		}
	});
	
	hotel.save(function(err) {
		if(err) {
			console.log('에러 발생');
			callback(err, null);
			return;
		}
		
		console.log('커피숍 데이터 추가됨.');
		callback(null, hotel);
	});
};

var searchmap = function(req, res) {
	console.log('searchmap 함수 호출됨');
	
	var paramName = req.body.name || req.query.name;
	var paramLongitude = req.body.longitude || req.query.longitude;
	var paramLatitude = req.body.latitude || req.query.latitude;
	
	console.log('파라미터 : ' + paramName + ', ' + paramLongitude + ', ' + paramLatitude);
	
	var database = req.app.get('database');
	
	if(database.db) {
		database.HotelModel.searchHotelmap(paramName, function(err, results) {
			if (err) {
				console.error('호텔맵 조회 중 에러 발생 : ' + err.stack);
				
				res.writeHead(200, {'Content-Type' : 'text/html;charset=utf8'});
				res.write('<h2>호텔맵 조회 중 에러 발생</h2>');
				res.end();
				
				return;
			}
			
				if(results) {
					if(results.length > 0) {
						console.log('제발.. 잘왓나요??');
						res.render('search_hotelmap.ejs',{result:results[0]._doc,
														  paramLatitude : results[0]._doc.geometry.coordinates[0],
														  paramLongitude : results[0]._doc.geometry.coordinates[1]});
					} else {
						res.writeHead(200, {'Content-Type' : 'text/html;charset=utf8'});
						res.write('<h2>호텔맵 데이터가 없습니다.</h2>');
						res.end();
					}
			} else {
				res.writeHead(200, {'Content-Type' : 'text/html;charset=utf8'});
				res.write('<h2>호텔맵 조회 실패</h2>');
				res.end();
			}
		});
	} else {
		res.writeHead(200, {'Content-Type' : 'text/html;charset=utf8'});
		res.write('<h2>데이터 베이스 연결 실패</h2>');
		res.end();
	}
};


module.exports.add = add;
module.exports.searchmap = searchmap;
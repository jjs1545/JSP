/**
 * Map에서 호텔 위치 정보를 위한 스키마
 */
var Schema = {};

Schema.createSchema = function(mongoose) {
	
	// 스키마 정의
	var HotelSchema = mongoose.Schema({
	    name: {type: String, index: 'hashed', 'default':''},
	    address: {type: String, 'default':''},
	    tel: {type: String, 'default':''},
	    geometry: {	//위치정보
	    	'type': {type: String, 'default': "Point"},	//점좌표
	    	coordinates: [{type: "Number"}]		//여러개의 좌표를 넣어주겠다. ( 배열 )
	    },
	    created_at: {type: Date, index: {unique: false}, 'default': Date.now},
	    updated_at: {type: Date, index: {unique: false}, 'default': Date.now}
	});
	
	HotelSchema.index({geometry:'2dsphere'});	

	// 스키마에 static 메소드 추가
	// 모든 커피숍 조회
	HotelSchema.static('findAll', function(callback) {
		return this.find({}, callback);
	});
	
	HotelSchema.static('searchHotelmap', function(name, callback) {
		console.log('HotelSchema searchHotelmap 호출됨.');
		
		return this.find({name:name}, callback);
	});
	
	// 가장 가까운 커피숍 조회
	HotelSchema.static('findNear', function(longitude, latitude, maxDistance, callback) {
		console.log('HotelSchema findNear 호출됨.');

		this.find().where('geometry').near({center:{type:'Point', coordinates:[parseFloat(longitude), parseFloat(latitude)]}, maxDistance:maxDistance}).limit(1).exec(callback);
	});
	
	// 일정 범위 내의 커피숍 조회
	HotelSchema.static('findWithin', function(topleft_longitude, topleft_latitude, bottomright_longitude, bottomright_latitude, callback) {
		console.log('HotelSchema findWithin 호출됨.');

		this.find().where('geometry').within({box:[[parseFloat(topleft_longitude), parseFloat(topleft_latitude)], [parseFloat(bottomright_longitude), parseFloat(bottomright_latitude)]]}).exec(callback);
	});
	
	// 일정 반경 내의 커피숍 조회
	HotelSchema.static('findCircle', function(center_longitude, center_latitude, radius, callback) {
		console.log('HotelSchema의 findCircle 호출됨.');
		
		// change radian : 1/6371 -> 1km
		this.find().where('geometry').within({center:[parseFloat(center_longitude), parseFloat(center_latitude)], radius: parseFloat(radius/6371000), unique: true, spherical: true}).exec(callback);
	});
	
	console.log('HotelSchema 정의함.');

	return HotelSchema;
};

// module.exports에 UserSchema 객체 직접 할당
module.exports = Schema;
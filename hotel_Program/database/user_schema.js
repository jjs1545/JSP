/**
 * users2 콜렉션의 데이터베이스 스키마를 정의하는 모듈
 *
 */

var crypto = require('crypto');

var Schema = {};

Schema.createSchema = function(mongoose) {
	console.log('user_Schema 호출됨.');
	
	var UserSchema = mongoose.Schema({
		// email: {type: String, 'default':''},
	    id: {type: String, required: true, unique: true, 'default':''},
	    /*hashed_password: {type: String, required: true, 'default':''},
	    salt: {type:String, required:true},*/
	    hashed_password: {type: String, 'default':''},
	    salt: {type:String},
	    name: {type: String, index: 'hashed', 'default':''},
	    created_at: {type: Date, index: {unique: false}, 'default': Date.now},
	    updated_at: {type: Date, index: {unique: false}, 'default': Date.now},
	    provider : {type: String, 'default': ''},	//facebook, google와 같은 사용자 인증 서비스를 제공하는 서비스 제공자 이름 저장
	    authToken : {type: String, 'default': ''},	//인증 서비스를 제공하는 서버에서 응답받은 access token 값 저장
	    facebook : {}	//facebook응답받은 사용자 정보 객체 저장
	});
	
	UserSchema
	  .virtual('password')
	  .set(function(password) {
	    this._password = password;
	    this.salt = this.makeSalt();
	    this.hashed_password = this.encryptPassword(password);
	    console.log('virtual password 호출됨 : ' + this.hashed_password);
	  })
	  .get(function() { return this._password });
	
	UserSchema.method('encryptPassword', function(plainText, inSalt) {
		if (inSalt) {
			return crypto.createHmac('sha1', inSalt).update(plainText).digest('hex');
		} else {
			return crypto.createHmac('sha1', this.salt).update(plainText).digest('hex');
		}
	});
	
	UserSchema.method('makeSalt', function() {
		return Math.round((new Date().valueOf() * Math.random())) + '';
	});
	
	UserSchema.method('authenticate', function(plainText, inSalt, hashed_password) {
		if (inSalt) {
			console.log('authenticate 호출됨 : %s -> %s : %s', plainText, this.encryptPassword(plainText, inSalt), hashed_password);
			return this.encryptPassword(plainText, inSalt) === hashed_password;
		} else {
			console.log('authenticate 호출됨 : %s -> %s : %s', plainText, this.encryptPassword(plainText), this.hashed_password);
			return this.encryptPassword(plainText) === this.hashed_password;
		}
	});
	
	var validatePresenceOf = function(value) {
		return value && value.length;
	};
		
	UserSchema.pre('save', function(next) {
		if (!this.isNew) return next();
	
		/*if (!validatePresenceOf(this.password)) {
		next(new Error('유효하지 않은 password 필드입니다.'));
		} else {*/
			next();
		//}
	})
	
	UserSchema.path('id').validate(function (id) {
		return id.length;
	}, 'id 칼럼의 값이 없습니다.');
	
	UserSchema.path('name').validate(function (name) {
		return name.length;
	}, 'name 칼럼의 값이 없습니다.');
	
/*	UserSchema.path('hashed_password').validate(function (hashed_password) {
		return hashed_password.length;
	}, 'hashed_password 칼럼의 값이 없습니다.');*/
	
	UserSchema.static('findById', function(id, callback) {
		return this.find({id:id}, callback);
	});
	
	UserSchema.static('findAll', function(callback) {
		return this.find({}, callback);
	});
	
	console.log('UserSchema 정의함.');

	return UserSchema;
};

module.exports = Schema;


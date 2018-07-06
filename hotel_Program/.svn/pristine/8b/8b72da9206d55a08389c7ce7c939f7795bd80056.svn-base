/**
 * Map에서 호텔 위치 정보를 위한 스키마
 */
var Schema = {};

Schema.createSchema = function(mongoose) {
	
	// 스키마 정의
	var ReserveSchema = mongoose.Schema({
		id: {type: String, index: 'hashed', 'default':''},
		country: {type: String, 'default':''},
	    city: {type: String, 'default':''},
	    hname: {type: String, 'default':''}
	});
	

	ReserveSchema.static('reserve', function(callback) {
		return this.find({id:id}, callback);
	});
	
	ReserveSchema.static('show', function(callback) {
		return this.find({id:paramId}, callback);
	});

	
	ReserveSchema.pre('save', function(next) {
		if (!this.isNew) return next();
	
	})
	
	return ReserveSchema;
};

module.exports = Schema;
module.exports = {
		server_port:3000,
		db_url: 'mongodb://localhost:27017/local',
		db_schemas: [
			{file:'./user_schema',collection:'users2',schemaName:'UserSchema',modelName:'UserModel'},
			{file:'./post_schema',collection:'posts',schemaName:'PostSchema',modelName:'PostModel'},
			{file:'./hotel_schema',collection:'hotels',schemaName:'HotelSchema',modelName:'HotelModel'},
			{file:'./reserve_schema',collection:'reserve',schemaName:'ReserveSchema',modelName:'ReserveModel'}
		],
		route_info : [
			/*회원가입, 로그인*/
			{file:'./user', path:'/process/login', method:'login', type:'post'},
			{file:'./user', path:'/process/adduser', method:'adduser', type:'post'},
			{file:'./user', path:'/process/listuser', method:'listuser', type:'post'},
			/*게시판*/
			{file:'./post', path:'/process/addpost', method:'addpost', type:'post'},
			{file:'./post', path:'/process/showpost/:id', method:'showpost', type:'get'},
			{file:'./post', path:'/process/listpost', method:'listpost', type:'post'},
			{file:'./post', path:'/process/listpost', method:'listpost', type:'get'},
			/*호텔*/
			{file:'./hotel', path:'/process/addhotel', method:'add', type:'post'},
			{file:'./hotel', path:'/process/searchhotelmap', method:'searchmap', type:'post'},
			/*예약*/
			{file:'./reserve', path:'/process/reserve/', method:'addReserve', type:'get'},
			{file:'./reserve', path:'/process/showreserve/', method:'showreserve', type:'get'}
		],
		facebook : {
			clientID : '474479603010216',
			clientSecret : 'fbe9f815cd5530def87d9d31663f00d0',
			callbackURL : '/auth/facebook/callback'
		}
};

/*module.exports = {
		server_port:3000,
		db_url: 'mongodb://localhost:27017/local',
		db_schemas: [
			{file:'./user_schema',collection:'users2',schemaName:'UserSchema',modelName:'UserModel'},
			{file:'./post_schema',collection:'posts',schemaName:'PostSchema',modelName:'PostModel'}
		],
		route_info : [
			회원가입, 로그인
			{file:'./user', path:'/process/login', method:'login', type:'post'},
			{file:'./user', path:'/process/adduser', method:'adduser', type:'post'},
			{file:'./user', path:'/process/listuser', method:'listuser', type:'post'},
			게시판
			{file:'./post', path:'/process/addpost', method:'addpost', type:'post'},
			{file:'./post', path:'/process/showpost/:id', method:'showpost', type:'get'},
			{file:'./post', path:'/process/listpost', method:'listpost', type:'post'},
			{file:'./post', path:'/process/listpost', method:'listpost', type:'get'}
		],
};
*/

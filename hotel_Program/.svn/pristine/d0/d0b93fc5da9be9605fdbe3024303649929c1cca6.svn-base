
var Genie = angular.module('nada', []); //index.ejs에서 ng-app="nada"로 썼으니까

Genie.controller('helloants', ['$http','$scope', function($http,$scope){ //ng-controller="helloants"로 썼으니까

var refresh = function() { 
	$http.get("/file").success(function(response){ // server.js에 접근
	console.log("server 접근");
	$scope.imageList = response;
		});
	}
	refresh(); // ng-controller 가 시작될때 함수 실행
}]);
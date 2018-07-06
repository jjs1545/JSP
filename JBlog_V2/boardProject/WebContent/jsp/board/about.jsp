<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>더존비즈온 소개</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37d6741efe790fe45cdd8978c386f4ec"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c4f9878863e159c15d229439e8259867&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c4f9878863e159c15d229439e8259867&libraries=services,clusterer,drawing"></script> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/lib/w3.css">
<script>
	function fnMove(seq){
	        var offset = $("#div" + seq).offset();
	        $('html, body').animate({scrollTop : offset.top}, 400);
	}
</script>
<style>
.mySlides {display:none;}

p{
  font-family: Fantasy;
  font-size:20px;
}
</style>
<jsp:include page="/jsp/include/header.jsp"></jsp:include>
</head>
<body>
	<div class="jumbotron" style="background-image: url(images/img_3.jpg); background-size:cover;">	
			<div class="content">
				<P></P>
				<h1>DOUZONE</h1>
				<p></p>
				<p class="tlt">Admin Board Page</p>
				<p></p>
				<p> - 더존 비즈온 소개 - </p>
				<p></p>
			</div>
			<div>
				<br/>
				<br/>
				<br/>
				<p>click</p>
	        	<a href="#"> 
	    	      <span class="glyphicon glyphicon-arrow-down" onclick="fnMove('1')"></span>
		        </a>
	        </div>
	</div>
	
	<div id="div1" class="profile_container" align="center">
		
		<div id="content" align="center">
			<hr width="80%">
			<a href="http://www.douzone.com/"><img src="/boardProject/images/douzone.png"></a>
			<hr width="80%">
			<br/><br/>
			<p>
				기업을 위한 모든 ICT Solution과 Service를 제공하는
				대한민국 대표 ICT 기업 더존
			</p>
			<p>	
				기업정보화 선도기업인 더존은 정보화에 필요한 각종 Solution과 Service를 제공하는
				대한민국 대표 ICT기업으로 고객의 경쟁력 강화에 기여해 왔습니다.
			</p>	
			<p>
				더존은 회계프로그램 뿐만 아니라 ERP, IFRS솔루션, 그룹웨어, 정보보호, 전자세금계산서 등
				기업 정보화 소프트웨어 분야에서 시장 점유율 1위 기업입니다.
			</p>
			<p>
				2011년 더존ICT그룹 강촌캠퍼스로 본사를 이전하며 클라우드 사업을 위한 핵심 거점 'D-클라우드 센터'를 구축,
			</p>
			<p>
				클라우드와 연계된 클라우드 플랫폼, 모바일 오피스, 전자금융, 전자문서(공인전자문서센터, 공인전자문서중계자),
			</p>
			<p>
				IDC(인터넷 데이터센터) 등 첨단기술이 융합된 다양한 미래형 서비스 모델을 선보이고 있습니다.
			</p>
			<p>
				ERP전문 ICT기업으로 시장을 개척한 더존은 클라우드, 모바일 등 최첨단 기술을 통해 기업이 나아갈 바를 정확히 알고
				기업의 탄생과 성장에 반드시 필요한 심장과 같은 역할을 수행하며 그 비전을 만들어 가고 있습니다.
			</p>
			<p>
				더존의 미래를 향한 새로운 도약은 오늘도 계속되고 있습니다.
			</p>
		<br/>
		<br/>
		</div>
			<div class="w3-content w3-section" style="max-width:500px;" >
				<img class="mySlides" src="images/douzone1.jpg" style="width:100%" />
				<img class="mySlides" src="images/douzone2.jpg" style="width:100%" /> 
				<img class="mySlides" src="images/douzone3.jpg" style="width:100%" /> 
				<img class="mySlides" src="images/douzone4.jpg" style="width:100%" /> 
			</div>
		</div>
		<div id="basic_introduce" class="profile_container" align="center">
			<p><strong>강촌캠퍼스 본사</strong></p>
			<p>자가용 이용시</p>
			<p>서울 춘천고속도로 ▶ 강촌IC 팔봉산,광판리 방면 ▶ 약 800m 직진 ▶ 버들길 방향으로 좌회전 버들교 ▶ 약 2Km 직진 ▶ 더존ICT그룹 강촌캠퍼스</p>
			<div id="map" style="width:70%;height:70%;">
			</div>
		</div>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.756419, 127.638046),
			level: 2
		};
		
		var map = new daum.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(37.756419, 127.638046); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		
		var iwContent = '<div style="padding:5px;">Hello Douzone! <br><a href="http://map.daum.net/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
	  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
		
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	</script>
	<script>
		var myIndex = 0;
		carousel();
		
		function carousel() {
		    var i;
		    var x = document.getElementsByClassName("mySlides");
		    for (i = 0; i < x.length; i++) {
		       x[i].style.display = "none";  
		    }
		    myIndex++;
		    if (myIndex > x.length) {myIndex = 1}    
		    x[myIndex-1].style.display = "block";  
		    setTimeout(carousel, 2000); // Change image every 2 seconds
		}
	</script>
</body>
</html>
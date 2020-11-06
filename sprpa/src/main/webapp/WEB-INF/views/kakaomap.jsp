<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>실시간 거래가(지도)</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/kakaomap.css">
	<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/kakaomap.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db6006bd9e6b048639ff98fcda6209da"></script>
	<style>
		#dialog {position: fixed; left: 0; top: 71px; width: 400px; height: 100%; z-index: 1000; background: white;}
		#head {display: flex; align-items: center; justify-content: space-between; margin: 20px;}
		#apart-name {color: rgba(0,0,0,0.8); font-size: 20px; font-weight: bold;}
		#dialog-close {border: none; background: none; color: rgba(0,0,0,0.3); font-size: 30px;}
		#dialog-close:hover {cursor: pointer;}
		#hr {background: LightSeaGreen; width: 100%;}
		#hr > h1 {color: white; font-size: 20px; font-weight: bold; letter-spacing: 0.2em; padding: 5px 0;}
		.customoverlay:hover {cursor: pointer;}
	</style>
</head>
<body>
	<div id="dialog" style="display: none;">
		<div id="head">
			<span id="apart-name">아파트</span>
			<button id="dialog-close">X</button>
		</div>
		<div id="hr">
			<h1>부동산 정보</h1>
		</div>
  		<div id="contents">
  			<h1>하하하하</h1>
  		</div>
	</div>
	<header>
		<div id="logo">
			<img
				src="${pageContext.request.contextPath}/resources/images/logo.png"
				alt="로고"> <a href="${pageContext.request.contextPath}/">부동산
				플랜</a>
		</div>
		<nav id="main-nav">
			<ul>
				<li><a href="#">실시간 거래</a></li>
				<li><a href="#">메뉴</a></li>
				<li><a href="#">메뉴</a></li>
				<li><a
					href="${pageContext.request.contextPath}/board/boardList">문의하기</a></li>
			</ul>
		</nav>
		<nav id="member">
			<ul>
				<c:if test="${empty loginEmail}">
					<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/signup">회원가입</a></li>
				</c:if>
				<c:if test="${not empty loginEmail}">
					<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
					<li><a href="${pageContext.request.contextPath}/member/mypage">마이페이지</a></li>
				</c:if>
			</ul>
		</nav>
	</header>
	
	<div id="map" style="width:100%;height:100%;"></div>
	<script>
		var longitude = <%= request.getAttribute("longitude") %>;
		var latitude = <%= request.getAttribute("latitude") %>;	
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
			level: 4 //지도의 레벨(확대, 축소 정도)
		};	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		var address = "<%= request.getAttribute("address") %>";
		
		$.ajax({
			type:"get",
			url:"http://localhost:8080/sprpa/rest/map",
			data:{addr:address},
			dataType:"json",
			success:function(result){
				var positions = new Array();
				$.each(result, function(index, value){
					var data = new Object();
					data.title = value.name;
					data.price = value.price;
					data.area = value.area;
					data.latlng = new kakao.maps.LatLng(value.latitude, value.longitude);
					positions.push(data);
				});
				
				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "${pageContext.request.contextPath}/resources/images/marker.png"; 
				    
				for (var i = 0; i < positions.length; i ++) {
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(34, 45); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지 
				    });
				    
				 	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    var name = positions[i].title;
				 	var area = positions[i].area + '/3.306';
				 	area = eval(area);
				 	area = parseInt(area) + '평';
				 	var price = positions[i].price + '/10000';
				 	price = eval(price) + '억';
				 	
				 	var content = '<div class="customoverlay" style="padding: 5px 10px; background-color: LightSeaGreen; margin-bottom: 45px; border-radius: 7px;">' +
				        '    <div class="overlay" style="padding: 5px 10px; background: white;">' +
				        '      <div class="name" style="font-size: 12px; font-weight: bold; color: rgba(0,0,0,0.8); background: white;">' + name + '</div>' +	
				        '      <div class="price" style="font-size: 18px; font-weight: bold; color: rgba(0,0,0,0.8); background: white;">' + price + '</div>' +
				        '      <div class="area" style="font-size: 12px; font-weight: bold; color: white; background: LightSeaGreen; margin: 3px 0 0 0; border-radius: 7px; padding: 1px;">' + area + '</div>' +	
				        '    </div>' +
				        '</div>';
				        
				 	// 커스텀 오버레이를 생성합니다
				    var customOverlay = new kakao.maps.CustomOverlay({
				        map: map,
				        position: positions[i].latlng,
				        content: content,
				        yAnchor: 1 
				    });
				}
			},
			error:function(xhr, status, error){
				alert(error);
			}
		});
		
		window.onload  = function(){
			$('.customoverlay').click(function(){
				$('#dialog').show();
			});
			$('#dialog-close').click(function(){
				$('#dialog').hide();
			});
		}
	</script>
</body>
</html>
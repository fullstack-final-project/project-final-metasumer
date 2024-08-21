/**
 * locationTraffic.js
 */
 $(document).ready(function() {
 
 	 /* 1. (시작) 상단 위치 카테고리 클릭 시 해당 카테고리에 강조 표시 */
 	document.querySelector('.locCtg.active').classList.remove('active');
 	document.querySelector('locCtg6').classList.add('active');

 	/* 1. 상단 위치 카테고리 클릭 시 해당 카테고리에 강조 표시 (끝) */
 
 	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.3595704, 127.105399),
	    mapTypeControl: true,
	    mapTypeControlOptions: {
	        style: naver.maps.MapTypeControlStyle.DROPDOWN
	    }
	});
 	var trafficLayer = new naver.maps.TrafficLayer({
    	interval: 300000 // 5분마다 새로고침 (최소값 5분)
	});
	
	var btn = $('#traffic');
	
	naver.maps.Event.addListener(map, 'trafficLayer_changed', function(trafficLayer) {
	    if (trafficLayer) {
	        btn.addClass('control-on');
	        $("#autorefresh").parent().show();
	        $("#autorefresh")[0].checked = true;
	    } else {
	        btn.removeClass('control-on');
	        $("#autorefresh").parent().hide();
	    }
	});
	
	btn.on("click", function(e) {
	    e.preventDefault();
	
	    if (trafficLayer.getMap()) {
	        trafficLayer.setMap(null);
	    } else {
	        trafficLayer.setMap(map);
	    }
	});
	
	$("#autorefresh").on("click", function(e) {
	    var btn = $(this),
	        checked = btn.is(":checked");
	
	    if (checked) {
	        trafficLayer.startAutoRefresh();
	    } else {
	        trafficLayer.endAutoRefresh();
	    }
	});
	
	naver.maps.Event.once(map, 'init', function() {
	    trafficLayer.setMap(map);
	});
	
});
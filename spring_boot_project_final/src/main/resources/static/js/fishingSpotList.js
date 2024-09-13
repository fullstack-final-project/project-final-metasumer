/**
 * fishigSpotList.js
 */
 
$(document).ready(function() {
    var map, marker, geocoder, infoWindow, userLocation = null;

    // 페이지 로딩 시 현재 위치 설정 및 필터 적용
    initializePage();

    // 필터 변경 시 필터 적용
    $("#filter-options").on('change', function() {
        applyFilters();
    });

    // 모달 열기
    $("#open-map-modal").on('click', function() {
        $("#locationModal").show();
        initializeMap();
        if (userLocation) {
            var savedLocation = new google.maps.LatLng(userLocation.lat, userLocation.lng);
            map.setCenter(savedLocation);
            marker.setPosition(savedLocation);
            marker.setTitle(userLocation.address || "저장된 위치");
        }
    });

    // 모달 닫기
    $(".close").on('click', function() {
        $("#locationModal").hide();
    });

	// 모달 바깥 클릭 시 모달 닫기
    $(window).on('click', function(event) {
        if ($(event.target).is('#locationModal')) {
            $("#locationModal").hide();
        }
    });
    
    // 현재 위치로 설정 버튼 클릭 시
    $("#set-current-location").on('click', function() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var lat = position.coords.latitude;
                var lng = position.coords.longitude;
                var latLng = new google.maps.LatLng(lat, lng);
                placeMarkerAndPanTo(latLng);
                reverseGeocode(latLng);
                userLocation = { lat: lat, lng: lng, address: null };
            }, function() {
                alert("현재 위치를 가져올 수 없습니다.");
            });
        } else {
            alert("이 브라우저는 Geolocation을 지원하지 않습니다.");
        }
    });

    // 위치 검색 및 지도의 위치 이동
    $("#modal-searchButton").on('click', function() {
        var address = $("#modal-searchBox").val();
        geocodeAddress(address);
    });

    // 저장 버튼 클릭 시 위치 저장 및 필터 적용
    $("#saveLocation").on('click', function() {
        if (userLocation) {
            sessionStorage.setItem('userLocation', JSON.stringify(userLocation));
            var savedAddress = marker.getTitle();
            alert(`"${savedAddress}"\n해당 위치로 설정되었습니다.`);
            $("#locationModal").hide();
            applyFilters(); // 위치 변경 후 필터 재적용
        } else {
            alert("위치를 설정해 주세요.");
        }
    });

    // 페이지 로딩 시 위치 초기화 및 필터 적용
    function initializePage() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var lat = position.coords.latitude;
                var lng = position.coords.longitude;
                userLocation = { lat: lat, lng: lng, address: null };
                initializeMap();
                applyFilters(); // 필터 적용
            }, function() {
                alert("현재 위치를 가져올 수 없습니다.");
                initializeMap(); // 위치를 가져올 수 없는 경우에도 지도 초기화
                applyFilters(); // 필터 적용
            });
        } else {
            alert("이 브라우저는 Geolocation을 지원하지 않습니다.");
            initializeMap(); // Geolocation 지원하지 않을 경우 지도 초기화
            applyFilters(); // 필터 적용
        }
    }

    // 지도 및 마커 초기화
    function initializeMap() {
        geocoder = new google.maps.Geocoder();
        infoWindow = new google.maps.InfoWindow();
        map = new google.maps.Map(document.getElementById('map'), {
            center: userLocation ? { lat: userLocation.lat, lng: userLocation.lng } : { lat: 37.5665, lng: 126.978 },
            zoom: 12
        });

        marker = new google.maps.Marker({
            map: map,
            draggable: true
        });

        // 지도 클릭 이벤트 핸들러
        map.addListener('click', function(event) {
            var latLng = event.latLng;
            placeMarkerAndPanTo(latLng);
            reverseGeocode(latLng);
        });

        if (userLocation) {
            var savedLocation = new google.maps.LatLng(userLocation.lat, userLocation.lng);
            map.setCenter(savedLocation);
            marker.setPosition(savedLocation);
            marker.setTitle(userLocation.address || "저장된 위치");
        }
    }

    // 마커를 찍고 지도 중심을 해당 위치로 이동
    function placeMarkerAndPanTo(latLng) {
        marker.setPosition(latLng);
        map.panTo(latLng);
        userLocation = { lat: latLng.lat(), lng: latLng.lng() };
    }

    // 주소를 위도/경도로 변환하는 함수
    function geocodeAddress(address) {
        geocoder.geocode({ 'address': address }, function(results, status) {
            if (status === 'OK') {
                var location = results[0].geometry.location;
                map.setCenter(location);
                marker.setPosition(location);
                marker.setTitle(address); // 마커에 주소를 표시
                userLocation = { lat: location.lat(), lng: location.lng(), address: address };
            } else {
                alert('검색어를 입력하세요.');
            }
        });
    }

    // 클릭한 위치의 주소를 찾는 함수
    function reverseGeocode(latLng) {
        geocoder.geocode({ 'location': latLng }, function(results, status) {
            if (status === 'OK') {
                if (results[0]) {
                    var address = results[0].formatted_address;
                    marker.setTitle(address); // 마커에 주소를 표시
                    infoWindow.setContent(address);
                    infoWindow.open(map, marker); // 마커 위에 InfoWindow 표시
                    userLocation.address = address;
                } else {
                    alert('주소를 찾을 수 없습니다.');
                }
            } else {
                alert('Geocoder 서비스 실패: ' + status);
            }
        });
    }

    // 필터를 적용하는 함수
    function applyFilters() {
        var filterOption = $("#filter-options").val();
        switch (filterOption) {
            case 'default':
                applyDefaultFilter();
                break;
            case 'distance':
                applyDistanceFilter();
                break;
            case 'price-desc':
                applyPriceFilter('desc');
                break;
            case 'price-asc':
                applyPriceFilter('asc');
                break;
        }
    }

    // 기본순 필터를 적용하는 함수
    function applyDefaultFilter() {
    var spots = $(".spot-container").toArray();
    spots.sort(function(a, b) {
        var idA = parseInt($(a).attr('data-spotId'), 10); 
        var idB = parseInt($(b).attr('data-spotId'), 10);
        return idA - idB;
    });

    $(".spots-list").empty();
    $.each(spots, function(index, spot) {
        $(".spots-list").append(spot);
    });
}

    // 거리순 필터를 적용하는 함수
    function applyDistanceFilter() {
        var userLoc = JSON.parse(sessionStorage.getItem('userLocation'));

        if (userLoc) {
            var userLat = userLoc.lat;
            var userLng = userLoc.lng;

            $(".spot-container").each(function() {
                var address = $(this).find(".spot-location").text();
                // 주소를 위도/경도로 변환
                geocodeAddressForDistance(address, function(lat, lng) {
                    var distance = calculateDistance(userLat, userLng, lat, lng);
                    $(this).attr("data-distance", distance);
                }.bind(this));
            });

            // 거리 기준으로 정렬
            setTimeout(function() {
                var spots = $(".spot-container").toArray();
                spots.sort(function(a, b) {
                    var distanceA = parseFloat($(a).attr("data-distance"));
                    var distanceB = parseFloat($(b).attr("data-distance"));
                    return distanceA - distanceB;
                });

                $(".spots-list").empty();
                $.each(spots, function(index, spot) {
                    $(".spots-list").append(spot);
                });
            }, 1000); // 주소 변환 시간 대기
        } else {
            alert("현재 위치를 설정해 주세요.");
        }
    }

    // 가격순 필터를 적용하는 함수
    function applyPriceFilter(order) {
        var spots = $(".spot-container").toArray();
        spots.sort(function(a, b) {
            var priceA = parseFloat($(a).find(".spot-price").text().replace(/[^\d]/g, '')); // 가격에서 숫자만 추출
            var priceB = parseFloat($(b).find(".spot-price").text().replace(/[^\d]/g, ''));
            if (order === 'desc') {
                return priceB - priceA;
            } else {
                return priceA - priceB;
            }
        });

        $(".spots-list").empty();
        $.each(spots, function(index, spot) {
            $(".spots-list").append(spot);
        });
    }

    // 주소를 위도/경도로 변환하는 함수 (거리 계산용)
    function geocodeAddressForDistance(address, callback) {
        geocoder.geocode({ 'address': address }, function(results, status) {
            if (status === 'OK') {
                var location = results[0].geometry.location;
                callback(location.lat(), location.lng());
            } else {
                alert('Geocoding 실패: ' + status);
            }
        });
    }

    // 두 위치 간의 거리를 계산하는 함수
    function calculateDistance(lat1, lng1, lat2, lng2) {
        var R = 6371; // 지구 반경 (킬로미터)
        var dLat = toRad(lat2 - lat1);
        var dLng = toRad(lng2 - lng1);
        var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) *
                Math.sin(dLng / 2) * Math.sin(dLng / 2);
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return R * c; // 거리 (킬로미터)
    }

    // 라디안 변환 함수
    function toRad(degrees) {
        return degrees * Math.PI / 180;
    }
});

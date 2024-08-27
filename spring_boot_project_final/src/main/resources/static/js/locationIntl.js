/**
 * locationIntl.js
 */
/* Google Maps 불러오기 : 기초 */
window.initMap = function () {
	const map = new google.maps.Map(document.getElementById("map"), {
		center: { lat: 37.5400456, lng: 126.9921017 },
		zoom: 10,
	});

	/* searchList 검색 결과 구현 예정*/
	const bounds = new google.maps.LatLngBounds();
	const infoWindow = new google.maps.InfoWindow();

	searchList.forEach(({ label, name, lat, lng }) => {
		const marker = new google.maps.Marker({
		position: { lat, lng },
		label,
		map,
	});
    bounds.extend(marker.position);

	marker.addListener("click", () => {
		map.panTo(marker.position);
		infoWindow.setContent(name);
		infoWindow.open({
			anchor: marker,
			map,
		});
	});
	});

	map.fitBounds(bounds);
};

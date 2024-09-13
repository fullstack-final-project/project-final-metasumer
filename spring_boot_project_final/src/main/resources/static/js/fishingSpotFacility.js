/**
 * fishingSpotFacility.js
 */
 $(document).ready(function() {
	var facilities = window.fishingSpotFacilities || [];
	
	// 시설 이미지 매핑을 위한 객체
	const facilityImages = {
	    '주차장': '/images/parking.png',
	    '화장실': '/images/toilet.png',
	    '쉼터': '/images/shelter.png',
	    '기본': '/images/default.png' // 기본 이미지
	};
	
	 // 시설 목록을 순회하며 HTML에 추가
    facilities.forEach(facility => {
        let trimmedFacility = facility.trim();
        let imgSrc = facilityImages[trimmedFacility] || facilityImages['기본'];

        // 시설 정보와 이미지 HTML을 동적으로 추가
        $('#facilityList').append(`
            <li class="facility-item">
                <img src="${imgSrc}" alt="${facility}" class="facility-image">
                <span class="facility-name">${facility}</span>
            </li>
        `);
    });
});
	
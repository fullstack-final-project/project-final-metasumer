package com.spring_boot_final.metasumer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LocationController {

	// 위치 정보 기본 페이지 : 현재 위치 정보 제공
	@RequestMapping("/location/overview") 
	public String locationInfo() {
		return "locInfo/locationView";
	}
	
	// 근처 낚시터
	@RequestMapping("/location/nearFish")
	public String nearFishingLocation() {
		return "locInfo/nearFishView";
	}
	
	// 주변 먹거리
	@RequestMapping("/location/nearFood")
	public String nearFoodLocation() {
		return "locInfo/nearFoodView";
	}
	
	// 주변 놀거리
	@RequestMapping("/location/nearPlay")
	public String nearPlayLocation() {
		return "locInfo/nearPlayView";
	}
	
	// 주변 숙박시설
	@RequestMapping("/location/nearHotel")
	public String nearHotelLocation() {
		return "locInfo/nearHotelView";
	}
	
	// 교통 상황
	@RequestMapping("/location/traffic")
	public String trafficLocation() {
		return "locInfo/trafficLocationView";
	}
	
	// 전국 낚시터
	@RequestMapping("/location/nationwide")
	public String nationwideLocation() {
		return "locInfo/nationwideLocationView";
	} 
	
	// 해외 낚시터
	@RequestMapping("/location/intl")
	public String internationalLocation() {
		return "locInfo/intlLocationView";
	}
}

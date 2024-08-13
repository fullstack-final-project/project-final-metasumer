package com.spring_boot_final.metasumer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LocationController {

	// 위치 정보 기본 페이지 : 현재 위치 정보 제공
	@RequestMapping("/location")
	public String locationInfo() {
		return "locInfo/locationView";
	}
	
	// 근처 낚시터
	
	// 주변 정보
	
	// 교통 상황
	
	// 전국 낚시터 
	
	// 해외 낚시터
	@RequestMapping("/location/intl")
	public String internationalLocation() {
		return "locInfo/intlLocationView";
	}
}

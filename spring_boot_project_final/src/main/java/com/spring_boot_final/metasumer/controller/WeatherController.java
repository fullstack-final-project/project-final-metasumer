package com.spring_boot_final.metasumer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_final.metasumer.service.WebSrcapingService;

@Controller
public class WeatherController {
	
	private WebSrcapingService scrapingService;
	
	public WeatherController(WebSrcapingService scrapingService) {
		this.scrapingService = scrapingService;
	}
	
	@RequestMapping("/weather/current") 
	public String currentWeatherView() {
		scrapingService.jsoupText();
		return "weather/weatherCurrent";
	}
}

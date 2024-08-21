package com.spring_boot_final.metasumer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WeatherController {
	@RequestMapping("/weather/current") 
	public String currentWeatherView() {
		return "weather/weatherCurrent";
	}
}

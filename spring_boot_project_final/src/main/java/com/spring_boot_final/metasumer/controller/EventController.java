package com.spring_boot_final.metasumer.controller;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_final.metasumer.model.EventVO;
import com.spring_boot_final.metasumer.model.MyFishRecordsVO;
import com.spring_boot_final.metasumer.service.EventService;

@Controller
public class EventController {
	
	@Autowired
	EventService eventService;
	
	// 현재 날짜
	LocalDate now = LocalDate.now();
	int year = now.getYear();
	int month = now.getMonthValue();
	
	@RequestMapping("/event/myFish")
	public String myFishEventView(Model model) {
		ArrayList<EventVO> monthEvent = eventService.getMyFishEventMonth(month, year);
		ArrayList<EventVO> yearEvent = eventService.getMyFishEventYear(year);
		ArrayList<MyFishRecordsVO> monthMyFish = eventService.getMonthMyFishRecord(month, year);
		ArrayList<MyFishRecordsVO> yearMyFish = eventService.getYearMyFishRecord(year);
		
		model.addAttribute("monthEvent", monthEvent);
		model.addAttribute("yearEvent", yearEvent);
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		model.addAttribute("yearMyFish", yearMyFish);
		model.addAttribute("monthMyFish", monthMyFish); 
		
		return "event/eventMyFish";
	}
	
	@RequestMapping("/event/business")
	public String businessEventView(Model model) {

		return "event/eventBusiness";
	}
	
	@RequestMapping("/event/site")
	public String siteEventView(Model model) {

		return "event/eventSite";
	}
	
	@RequestMapping("/event/review")
	public String reviewEventView(Model model) {

		return "event/eventReview";
	}
}

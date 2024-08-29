package com.spring_boot_final.metasumer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_final.metasumer.model.SafetyInfoVO;
import com.spring_boot_final.metasumer.model.SafetyTelVO;
import com.spring_boot_final.metasumer.service.SafetyInfoService;

@Controller
public class SafetyController {
	
	@Autowired
	SafetyInfoService safetyService;

	@RequestMapping("/safety/overview")
	public String safetyInfoView(Model model) {
		ArrayList<SafetyInfoVO> safetyList = safetyService.listAllSafetyInfo();
		model.addAttribute("safetyList", safetyList);
		
		return "safety/safetyInfo";
	}
	
	@RequestMapping("/safety/ERinfo")
	public String emergencyTelInfoView(Model model) {
		ArrayList<SafetyTelVO> telList = safetyService.listAllSafetyTel();
		model.addAttribute("telList", telList);
		
		return "safety/emergencyInfo";
	}
}

package com.spring_boot_final.metasumer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_final.metasumer.model.BusinessVO;
import com.spring_boot_final.metasumer.model.MyFishRecordsVO;
import com.spring_boot_final.metasumer.model.ProductVO;
import com.spring_boot_final.metasumer.service.IndexService;
import com.spring_boot_final.metasumer.service.SearchTrendService;

@Controller
public class IndexController {
	private SearchTrendService searchService;
	
	public IndexController(
			SearchTrendService searchService) {
		this.searchService = searchService;
	}
	
	@Autowired
	IndexService iService;
	
	@RequestMapping("/")
	public String tempIndex(Model model) {
		ArrayList<MyFishRecordsVO> mfList = iService.listBestMemFishRecords();
		ArrayList<BusinessVO> bizList = iService.listBestBusinessRank();
		ArrayList<MyFishRecordsVO> newMfList = iService.listNewMemFishRecords();
		ArrayList <ProductVO> newPrdList = iService.listNewProducts();
		ArrayList <ProductVO> recPrdList = iService.listUserRecProducts();
		
		model.addAttribute("mfList", mfList);
		model.addAttribute("bizList", bizList);
		model.addAttribute("newMfList", newMfList);
		model.addAttribute("newPrdList", newPrdList);
		model.addAttribute("recPrdList", recPrdList);
		
		return "index";
	}
	
}

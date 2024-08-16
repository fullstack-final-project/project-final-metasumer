package com.spring_boot_final.metasumer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.spring_boot_final.metasumer.model.BusinessVO;
import com.spring_boot_final.metasumer.model.MyFishRecordsVO;
import com.spring_boot_final.metasumer.service.IndexService;

@Controller
public class IndexController {
	
	@Autowired
	IndexService iService;
	
	// 전체 회원의 기록 중 물고기 크기가 큰 순위 가져옴
	public String listBestMemFishRecords(Model model) {
		ArrayList<MyFishRecordsVO> mfList = iService.listBestMemFishRecords();
		
		model.addAttribute("mfList", mfList);
		return "index";
	}
	
	// 사업체 순위를 임의로 선정해 불러옴
	public String listBestBusinessRank(Model model) {
		ArrayList<BusinessVO> bizList = iService.listBestBusinessRank();
		
		model.addAttribute("bizList", bizList);
		return "index";
	}

}

package com.spring_boot_final.metasumer.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.metasumer.model.FishVO;
import com.spring_boot_final.metasumer.service.FishService;

@Controller
public class FishController {
	@Autowired
	FishService fishService;
	
	@RequestMapping("/fish")
	public String fishInfo(Model model) {
		ArrayList<FishVO> fishList = fishService.listAllFish();
		model.addAttribute("fishList", fishList);
		
		return "fishInfo/fishListView";
	}
	
	// 카테고리 별 어종 출력
	@RequestMapping("/fish/fishCtgList/{fishCtgId}")
	public String fishCtgListView(@PathVariable String fishCtgId, Model model) {
		ArrayList<FishVO> fishList = fishService.fishCtgList(fishCtgId);

		// 뷰 페이지에 출력하기 위해 Model 설정
		model.addAttribute("fishList", fishList);

		return "fishInfo/fishListView";
	}
	
	// 어종 상세 페이지 이동
	@RequestMapping("/fish/detailViewFish/{fishNo}")
	public String detailViewFish(@PathVariable("fishNo") String fishNo, Model model) {
		FishVO fish = fishService.detailViewFish(fishNo);
		
		// 뷰 페이지에 출력하기 위해 Model 설정
		model.addAttribute("fish", fish);

		return "fishInfo/fishDetailView";
	}
	
	// 어종 검색
	@ResponseBody
	@RequestMapping("/fish/fishSearch")
	public ArrayList<FishVO> fishSearch(@RequestParam HashMap<String, Object> param) {
		ArrayList<FishVO> fishList = fishService.fishSearch(param);	
		return fishList;
	}

}

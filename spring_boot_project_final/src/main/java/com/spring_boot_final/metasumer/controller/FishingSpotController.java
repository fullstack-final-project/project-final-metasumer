package com.spring_boot_final.metasumer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_final.metasumer.model.FishingSpotAreaVO;
import com.spring_boot_final.metasumer.model.FishingSpotVO;
import com.spring_boot_final.metasumer.service.FishingSpotService;

@Controller
public class FishingSpotController {

  @Autowired
  private FishingSpotService fishingSpotService;

  // 민물낚시터 조회
  @RequestMapping("/fishingSpot/freshwater")
  public String getFreshwaterSpots(Model model) {
    List<FishingSpotVO> spots = fishingSpotService.getFishingSpotsByType("freshwater");
    model.addAttribute("spots", spots);
    return "/fishingSpot/freshwaterSpotList";
  }

  // 바다낚시터 조회
  @RequestMapping("/fishingSpot/saltwater")
  public String getSaltwaterSpots(Model model) {
    List<FishingSpotVO> spots = fishingSpotService.getFishingSpotsByType("saltwater");
    model.addAttribute("spots", spots);
    return "/fishingSpot/saltwaterSpotList";
  }
  
  @RequestMapping("/detailFishingSpot/{spotId}")
  public String detailFishingSpot(@PathVariable("spotId") int spotId, Model model) {
      FishingSpotVO spot = fishingSpotService.detailFishingSpot(spotId);
      
      // 낚시터 구역 상품 조회
      List<FishingSpotAreaVO> areas = fishingSpotService.getFishingSpotAreasBySpotId(spotId);
      model.addAttribute("areas", areas);
      model.addAttribute("spot", spot);
      return "/fishingSpot/fishingSpotDetailView";
  }
}

package com.spring_boot_final.metasumer.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_final.metasumer.model.FishingSpotAreaVO;
import com.spring_boot_final.metasumer.model.FishingSpotVO;
import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.service.FishingSpotService;
import com.spring_boot_final.metasumer.service.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
public class FishingSpotController {

  @Autowired
  private FishingSpotService fishingSpotService;
  @Autowired
  private OrderService orderService;
  

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
  
  // 낚시터 상세 조회
  @RequestMapping("/detailFishingSpot/{spotId}")
  public String detailFishingSpot(@PathVariable("spotId") int spotId, @RequestParam("bizId") int bizId, Model model) {
      FishingSpotVO spot = fishingSpotService.detailFishingSpot(spotId);
      
      // 낚시터 구역 상품 조회
      List<FishingSpotAreaVO> areas = fishingSpotService.getFishingSpotAreasBySpotId(spotId);
      model.addAttribute("areas", areas);
      model.addAttribute("spot", spot);
      model.addAttribute("bizId", bizId);
      return "fishingSpot/fishingSpotDetailView";
  }
  
  // 예약 확인 및 결제 페이지 이동
  @RequestMapping("/order/reservationOrder")
  public String reservationOrder(
      @RequestParam(value = "spotId", required = false, defaultValue = "0") int spotId,
      @RequestParam(value = "resQuantity", required = false, defaultValue = "1") int resQuantity,
      @RequestParam(value = "resDate", required = true) String resDate,
      @RequestParam(value = "selectedAreas", required = false) String selectedAreas,
      @RequestParam(value = "resNum", required = false, defaultValue = "1") int resNum,
      @RequestParam(value = "bizId", required = false, defaultValue = "0") int bizId,
      HttpSession session,
      Model model
  ) {
      System.out.println("spotId: " + spotId);
      System.out.println("resQuantity: " + resQuantity);
      System.out.println("resDate: " + resDate);
      System.out.println("selectedAreas: " + selectedAreas);
      System.out.println("resNum: " + resNum);
      System.out.println("bizId: " + bizId);
      
      List<FishingSpotAreaVO> areas = new ArrayList<>();
      Set<Integer> areaIdSet = new HashSet<>();
      String[] areaIds = selectedAreas.split(","); // 쉼표로 구분된 문자열을 배열로 변환

      int productTotal = 0; // 총 상품금액을 계산하기 위한 변수

      for (String id : areaIds) {
          id = id.trim(); // 공백 제거
          if (!id.isEmpty()) { // 빈 문자열 필터링
              try {
                  int areaId = Integer.parseInt(id); // 정수로 변환
                  // 중복된 areaId는 처리하지 않도록 Set을 사용하여 체크
                  if (areaIdSet.add(areaId)) {
                      FishingSpotAreaVO area = fishingSpotService.getFishingSpotAreaById(areaId);
                      if (area != null) {
                          areas.add(area);
                          productTotal += area.getAreaPrice(); // 각 영역의 가격을 총 상품금액에 추가
                      }
                  }
              } catch (NumberFormatException e) {
                  // 로그를 남기거나 사용자에게 오류 메시지를 표시할 수 있습니다.
                  e.printStackTrace();
              }
          }
      }

      FishingSpotVO spot = fishingSpotService.detailFishingSpot(spotId);

      // 총 결제 금액 계산 
      int finalTotalPrice = productTotal * resQuantity; 

      String memId = (String) session.getAttribute("memId"); 
      if (memId == null) {
          return "redirect:/member/loginForm"; // 로그인 페이지로 리다이렉션
      }

      MemberVO member = orderService.getMemberById(memId); // 회원 정보를 조회

      model.addAttribute("spot", spot);
      model.addAttribute("areas", areas);
      model.addAttribute("resQuantity", resQuantity);
      model.addAttribute("resDate", resDate);
      model.addAttribute("resNum", resNum);
      model.addAttribute("bizId", bizId); 
      model.addAttribute("member", member); 
      model.addAttribute("productTotal", productTotal); 
      model.addAttribute("finalTotalPrice", finalTotalPrice); 

      return "order/reservationOrder";
  }


}

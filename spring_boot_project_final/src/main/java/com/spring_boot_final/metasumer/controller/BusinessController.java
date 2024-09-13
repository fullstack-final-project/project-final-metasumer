package com.spring_boot_final.metasumer.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_final.metasumer.model.BusinessVO;
import com.spring_boot_final.metasumer.model.FishingSpotAreaVO;
import com.spring_boot_final.metasumer.model.FishingSpotVO;
import com.spring_boot_final.metasumer.service.BusinessService;
import com.spring_boot_final.metasumer.service.FishingSpotService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BusinessController {

  @Autowired
  private BusinessService businessService;
  @Autowired
  private FishingSpotService fishingSpotService;
  
  //사업자 메인 페이지
  @RequestMapping("/business/businessMain")
  public String businessMain(HttpSession session, Model model) {
    
    return "business/businessMain";
  }
  
  // 사업체 등록 폼 열기
  @RequestMapping("/business/registerBusinessForm")
  public String registerBusinessForm() {
      return "business/registerBusiness";
  }
  

  @RequestMapping("/business/getAllBusiness")
  public String getAllBusiness(Model model) {
      ArrayList<BusinessVO> businesses = businessService.getAllBusiness();
      model.addAttribute("businesses", businesses);
      return "business/getAllBusiness";
  }

  @RequestMapping("/business/register")
  @ResponseBody
  public Map<String, Object> registerBusiness(@RequestParam("memId") String memId,
                                              @RequestParam("bizRegImg") MultipartFile file,
                                              @RequestParam("businessName") String businessName,
                                              @RequestParam(value = "authStatus", defaultValue = "pending") String authStatus,
                                              @RequestParam("bizRegNumber") String bizRegNumber,
                                              @RequestParam("businessType") String businessType,
                                              @RequestParam("delegate") String delegate,
                                              @RequestParam("businessAddress") String businessAddress,
                                              @RequestParam("businessCategory") String businessCategory,
                                              @RequestParam("issueDate") String issueDate) {
   
      Map<String, Object> response = new HashMap<>();
      try {
          // 파일 저장
          String fileName = saveFile(file);
          System.out.println("파일 등록 성공: " + fileName);

          // BusinessVO 객체 생성
          BusinessVO business = new BusinessVO();
          business.setMemId(memId);
          business.setBusinessName(businessName);
          business.setAuthStatus(authStatus); // String 값 사용
          business.setBizRegNumber(bizRegNumber);
          business.setBusinessType(businessType); // String 값 사용
          business.setBizRegImg(fileName);
          business.setDelegate(delegate); // 대표자 설정
          business.setBusinessAddress(businessAddress); // 사업장 소재지 설정
          business.setBusinessCategory(businessCategory); // 업태 설정
          business.setIssueDate(issueDate); // 발행일 설정

          // 비즈니스 등록
          businessService.registerBusiness(business);

          response.put("status", "success");
          response.put("redirectUrl", "/business/businessMain");
      } catch (IOException e) {
          e.printStackTrace();
          response.put("status", "fail");
          response.put("error", "파일 저장 중 오류 발생: " + e.getMessage());
      } catch (Exception e) {
          e.printStackTrace();
          response.put("status", "fail");
          response.put("error", "비즈니스 등록 중 오류 발생: " + e.getMessage());
      }
      return response;
  }
  

  @RequestMapping("/business/update")
  public String updateBusiness(BusinessVO business) {
      businessService.updateBusiness(business);
      return "redirect:/business/detail?bizId=" + business.getBizId();
  }

  @RequestMapping("/business/delete")
  public String deleteBusiness(@RequestParam("bizId") int bizId) {
      businessService.deleteBusiness(bizId);
      return "redirect:/business/list";
  }
  
  // ////////////////////////////////////////////////////////////////////////////////////////
  
  // 낚시터 관리 페이지
  @RequestMapping("/business/fishingSpotManagement")
  public String fishingSpotManagement(HttpSession session, Model model) {
      // 세션에서 로그인한 사업자 정보 가져오기
      String memId = (String) session.getAttribute("memId");
      
      // 사업자 정보를 통해 사업자 ID 가져오기
      BusinessVO loggedInBusiness = businessService.getBusinessByMemId(memId);
      int bizId = loggedInBusiness.getBizId();
      
      // 사업자 ID를 통해 낚시터 목록 조회
      List<FishingSpotVO> fishingSpots = fishingSpotService.getFishingSpotsByBizId(bizId);

      // 모델에 낚시터 목록을 추가
      model.addAttribute("fishingSpots", fishingSpots);
      model.addAttribute("bizId", bizId);

      // 낚시터 관리 페이지를 반환
      return "business/fishingSpotManagement";
  }
  
  //낚시터 등록 폼 페이지
  @RequestMapping("/business/fishingSpotRegister")
  public String showFishingSpotRegisterForm(Model model, HttpSession session) {
      return "business/fishingSpotRegister";
  }
  
  //낚시터 등록 처리
  @RequestMapping("business/registerFishingSpot")
  public String registerFishingSpot(
          @RequestParam("spotName") String spotName,
          @RequestParam("spotType") String spotType,
          @RequestParam("spotDescription") String spotDescription,
          @RequestParam("spotPrice") int spotPrice,
          @RequestParam("spotImage") MultipartFile spotImage,
          @RequestParam("openingTime") String openingTimeStr,
          @RequestParam("closingTime") String closingTimeStr,
          @RequestParam("spotZipcode") String spotZipcode,
          @RequestParam("spotAddress1") String spotAddress1,
          @RequestParam("spotAddress2") String spotAddress2,
          @RequestParam("spotHP1") String spotHP1,
          @RequestParam("spotHP2") String spotHP2,
          @RequestParam("spotHP3") String spotHP3,
          @RequestParam("spotFacility") String spotFacility,
          HttpSession session) throws ParseException, IOException {

      // 세션에서 사업자 ID 가져오기
      String memId = (String) session.getAttribute("memId");
      BusinessVO loggedInBusiness = businessService.getBusinessByMemId(memId);
      int bizId = loggedInBusiness.getBizId();
      
      // 문자열을 Time 객체로 변환
      SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
      Time openingTime = new Time(sdf.parse(openingTimeStr).getTime());
      Time closingTime = new Time(sdf.parse(closingTimeStr).getTime());
      
      // 파일 업로드 처리
      String savedFileName = "";
      if (!spotImage.isEmpty()) {  // 파일이 있을 경우 처리
          savedFileName = saveFile(spotImage);  // saveFile 메소드 호출
      }

      // 낚시터 등록 정보 설정
      FishingSpotVO fishingSpot = new FishingSpotVO();
      fishingSpot.setSpotName(spotName);
      fishingSpot.setSpotType(spotType);
      fishingSpot.setSpotDescription(spotDescription);
      fishingSpot.setSpotPrice(spotPrice);
      fishingSpot.setSpotImage(savedFileName);
      fishingSpot.setOpeningTime(openingTime);
      fishingSpot.setClosingTime(closingTime);
      fishingSpot.setSpotZipcode(spotZipcode);
      fishingSpot.setSpotAddress1(spotAddress1);
      fishingSpot.setSpotAddress2(spotAddress2);
      fishingSpot.setSpotHP1(spotHP1);
      fishingSpot.setSpotHP2(spotHP2);
      fishingSpot.setSpotHP3(spotHP3);
      fishingSpot.setSpotFacility(spotFacility);
      fishingSpot.setBizId(bizId);

      // 낚시터 등록 서비스 호출
      fishingSpotService.insertFishingSpot(fishingSpot);

      // 낚시터 관리 페이지로 리다이렉트
      return "redirect:/business/fishingSpotManagement";
  }
  
  // 낚시터 상품 관리 페이지
  @RequestMapping("/business/fishingSpotAreaManagement")
  public String showFishingSpotAreaManagement(@RequestParam("spotId") int spotId, Model model) {
     List<FishingSpotAreaVO> areas = fishingSpotService.getFishingSpotAreasBySpotId(spotId);
     FishingSpotVO spot = fishingSpotService.detailFishingSpot(spotId);
     model.addAttribute("spotName", spot.getSpotName());
     model.addAttribute("spotId", spotId);
     model.addAttribute("areas", areas);
     return "business/fishingSpotAreaManagement";
  }
  
  // 낚시터 상품 등록 폼 열기
  @RequestMapping("/business/fishingSpotAreaRegister")
  public String showFishingSpotAreaRegisterForm(@RequestParam("spotId") int spotId, Model model) {
      model.addAttribute("spotId", spotId);
      return "business/fishingSpotAreaRegister";
  }
  
  // 낚시터 상품 등록 처리
  @RequestMapping("/business/registerFishingSpotArea")
  public String registerFishingSpotArea(
      @RequestParam("spotId") int spotId,
      @RequestParam("areaName") String areaName,
      @RequestParam("areaPrice") int areaPrice,
      @RequestParam("minCapacity") int minCapacity,
      @RequestParam("maxCapacity") int maxCapacity,
      @RequestParam("startTime") String startTimeStr,
      @RequestParam("endTime") String endTimeStr,
      @RequestParam("fishType") String fishType) throws ParseException {

    // 문자열을 Time 객체로 변환
    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
    Time startTime = new Time(sdf.parse(startTimeStr).getTime());
    Time endTime = new Time(sdf.parse(endTimeStr).getTime());
    
  
    // FishingSpotAreaVO 객체 생성 및 설정
    FishingSpotAreaVO fishingSpotArea = new FishingSpotAreaVO();
    fishingSpotArea.setSpotId(spotId);
    fishingSpotArea.setAreaName(areaName);
    fishingSpotArea.setAreaPrice(areaPrice);
    fishingSpotArea.setMinCapacity(minCapacity);
    fishingSpotArea.setMaxCapacity(maxCapacity);
    fishingSpotArea.setStartTime(startTime);
    fishingSpotArea.setEndTime(endTime);
    fishingSpotArea.setFishType(fishType);
  
    // 낚시터 구역 등록 처리
    fishingSpotService.insertFishingSpotArea(fishingSpotArea);
    
    return "redirect:/business/fishingSpotAreaManagement?spotId=" + spotId;
}

  // /////////////////////////////////////////////////////////////////////
  private String saveFile(MultipartFile file) throws IOException {
    String uploadPath = "C:/springWorkspace/metasumer_images/";

    String originalFileName = file.getOriginalFilename();
    originalFileName = originalFileName.replace("[", "_").replace("]", "_");

    UUID uuid = UUID.randomUUID();
    String savedFileName = uuid.toString() + "_" + originalFileName;
    File uploadFile = new File(uploadPath + savedFileName);

    file.transferTo(uploadFile);

    return savedFileName;
  }
}

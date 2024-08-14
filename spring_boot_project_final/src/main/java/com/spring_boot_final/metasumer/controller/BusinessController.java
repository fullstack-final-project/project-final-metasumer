package com.spring_boot_final.metasumer.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.spring_boot_final.metasumer.service.BusinessService;

@Controller
@RequestMapping("/business")
public class BusinessController {

  @Autowired
  private BusinessService businessService;
  
  //사업자 메인 페이지
  @RequestMapping("/businessMain")
  public String businessMain() {
    return "business/businessMain";
  }
  
  // 사업체 등록 폼 열기
  @RequestMapping("/registerBusinessForm")
  public String registerBusinessForm(Model model) {
    ArrayList<BusinessVO> bizCategories = businessService.getBusinessCategory();
    model.addAttribute("bizCategories", bizCategories);
    return "business/registerBusiness";
}
  
  @RequestMapping("/detail")
  public String getBusinessWithCategory(@RequestParam("bizId") int bizId, Model model) {
      BusinessVO business = businessService.getBusinessWithCategory(bizId);
      model.addAttribute("business", business);
      return "business/detail";
  }

  @RequestMapping("/getAllBusiness")
  public String getAllBusiness(Model model) {
      ArrayList<BusinessVO> businesses = businessService.getAllBusiness();
      model.addAttribute("businesses", businesses);
      return "business/getAllBusiness";
  }

  @RequestMapping("/register")
  @ResponseBody
  public Map<String, Object> registerBusiness(@RequestParam("memId") String memId,
                                              @RequestParam("bizRegImg") MultipartFile file,
                                              @RequestParam("bizName") String bizName,
                                              @RequestParam("bizRegNum") String bizRegNum,
                                              @RequestParam("bizZipcode") String bizZipcode,
                                              @RequestParam("bizAddress1") String bizAddress1,
                                              @RequestParam("bizAddress2") String bizAddress2,
                                              @RequestParam("bizHP1") String bizHP1,
                                              @RequestParam("bizHP2") String bizHP2,
                                              @RequestParam("bizHP3") String bizHP3,
                                              @RequestParam("bizCtgId") Integer bizCtgId) {
      Map<String, Object> response = new HashMap<>();
      try {
          // 파일 저장
          String fileName = saveFile(file);
          System.out.println("파일 저장 성공: " + fileName);

          // BusinessVO 객체 생성
          BusinessVO business = new BusinessVO();
          business.setMemId(memId);
          business.setBizName(bizName);
          business.setBizRegNum(bizRegNum);
          business.setBizZipcode(bizZipcode);
          business.setBizAddress1(bizAddress1);
          business.setBizAddress2(bizAddress2);
          business.setBizHP1(bizHP1);
          business.setBizHP2(bizHP2);
          business.setBizHP3(bizHP3);
          business.setBizCtgId(bizCtgId);
          business.setBizRegImg(fileName);

          // 비즈니스 등록
          businessService.registerBusiness(business);

          response.put("status", "success");
          response.put("redirectUrl", "/business/businessMain");
      } catch (IOException e) {
          e.printStackTrace();
      }
      return response;
  }
  

  @RequestMapping("/update")
  public String updateBusiness(BusinessVO business) {
      businessService.updateBusiness(business);
      return "redirect:/business/detail?bizId=" + business.getBizId();
  }

  @RequestMapping("/delete")
  public String deleteBusiness(@RequestParam("bizId") int bizId) {
      businessService.deleteBusiness(bizId);
      return "redirect:/business/list";
  }
  
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

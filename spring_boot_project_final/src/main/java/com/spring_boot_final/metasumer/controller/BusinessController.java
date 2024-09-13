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

	// 사업자 메인 페이지
	@RequestMapping("/businessMain")
	public String businessMain() {
		return "business/businessMain";
	}

	// 사업체 등록 폼 열기
	@RequestMapping("/registerBusinessForm")
	public String registerBusinessForm() {
		return "business/registerBusiness";
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
			@RequestParam("bizRegImg") MultipartFile file, @RequestParam("businessName") String businessName,
			@RequestParam(value = "authStatus", defaultValue = "pending") String authStatus,
			@RequestParam("bizRegNumber") String bizRegNumber, @RequestParam("businessType") String businessType,
			@RequestParam("delegate") String delegate, @RequestParam("businessAddress") String businessAddress,
			@RequestParam("businessCategory") String businessCategory, @RequestParam("issueDate") String issueDate) {

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
//    String uploadPath = "C:/springWorkspace/metasumer_images_upload/";
		String uploadPath = "/usr/local/project/upload/";
		String originalFileName = file.getOriginalFilename();
		originalFileName = originalFileName.replace("[", "_").replace("]", "_");

		UUID uuid = UUID.randomUUID();
		String savedFileName = uuid.toString() + "_" + originalFileName;
		File uploadFile = new File(uploadPath + savedFileName);

		file.transferTo(uploadFile);

		return savedFileName;
	}
}

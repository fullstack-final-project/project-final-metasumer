package com.spring_boot_final.metasumer.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.metasumer.model.MyPageVO;
import com.spring_boot_final.metasumer.service.MyPageService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageController {
	@Autowired
	MyPageService myPageService;
	
	@RequestMapping("/member/myPage")	
	public String fishInfo(HttpServletRequest request, 
			               @RequestParam(defaultValue = "1") int page,
			               Model model) {	
		// 나의 물고기 기록 list 가져오기
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");				

		int recordsPerPage = 4;
		int totalRecords = myPageService.getRecordsCount(memId); // 총 기록 수
        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage); // 총 페이지 수

        // 페이지 범위 초과 방지
        if (page > totalPages) {
            page = totalPages;
        } else if (page < 1) {
            page = 1;
        }

        int offset = (page - 1) * recordsPerPage;
        
        ArrayList<MyPageVO> mfList = myPageService.MyFishRecordsPerPage(memId, offset, recordsPerPage);
        
        model.addAttribute("mfList", mfList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages); 	
		
		return "myPage/myPageListView";
	}
	
	@RequestMapping("/member/myPageCountData")
	@ResponseBody
	public Map<String, Object> getPageData(HttpServletRequest request,
			                               @RequestParam(defaultValue = "1") int page) {
	    HttpSession session = request.getSession();
	    String memId = (String) session.getAttribute("memId");

	    int recordsPerPage = 4;
	    int totalRecords = myPageService.getRecordsCount(memId); // 총 기록 수
	    int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage); // 총 페이지 수

	    // 페이지 범위 초과 방지
	    if (page > totalPages) {
	        page = totalPages;
	    } else if (page < 1) {
	        page = 1;
	    }

	    int offset = (page - 1) * recordsPerPage;
	    ArrayList<MyPageVO> mfList = myPageService.MyFishRecordsPerPage(memId, offset, recordsPerPage);

	    Map<String, Object> data = new HashMap<>();
	    
	    data.put("mfList", mfList);
	    data.put("currentPage", page);
	    data.put("totalPages", totalPages);

	    return data;
	}

	@RequestMapping("/member/myPageData")
	@ResponseBody
	public Map<String, Object> getFishData(HttpServletRequest request) {    
	    // 물고기 기록 list 가져오기
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		
		ArrayList<MyPageVO> mfList = myPageService.MyFishRecordsList(memId);
	    
	    // 물고기 이름, 크기 배열 생성
	    ArrayList<String> fishNames = new ArrayList<>();
	    ArrayList<Double> fishSizes = new ArrayList<>();	    
	    
	    //월별 count 배열 생성
	    int[] monthFishCnt = new int[12];
	    // 월 추출
	    SimpleDateFormat monthFormat = new SimpleDateFormat("MM");
	    
	    for (MyPageVO record : mfList) {	       	        	    	
	    	// 월 추출 후 물고기 count
	        Date createdDate = record.getCreatedDate();
	        String monthStr = monthFormat.format(createdDate);
	        // 배열 인덱스 넣기 위해 -1
	        int month = Integer.parseInt(monthStr) - 1;
	        
	        monthFishCnt[month]++;	  	        	        
	    }
	    
	    // 최근 10개의 기록만 추출
	    int maxRecords = 10;
	    
	    if (mfList.size() > maxRecords) {
	        mfList = new ArrayList<>(mfList.subList(0, maxRecords)); 
	    }
	    
	    for(MyPageVO record : mfList) {	  
	    	// 물고기 이름 가져오기
	    	fishNames.add(record.getFishName());
	    	
	        // cm -> "" 변환 후 Double로 변환
	        String sizeStr = record.getFishSize().replace("cm", "").trim();
	        Double size = Double.parseDouble(sizeStr);
	        
	        // 물고기 크기 가져오기
	        fishSizes.add(size);	
	    }

	    // 데이터를 JSON 형식으로 변환
	    Map<String, Object> data = new HashMap<>();
	    
	    data.put("fishNames", fishNames);
	    data.put("fishSizes", fishSizes);
	    data.put("monthFishCnt", monthFishCnt);

	    return data;
	}
	
	@RequestMapping("/myPage/myFishingSuccess")
	public String fishingSuccess() {
		return "myPage/myFishingSuccess";
	}
	
	@RequestMapping("/myPage/successCalc")
    @ResponseBody
    public double calculateSuccessRate(@RequestParam("fishName") String fishName,
                                       @RequestParam("tide") String tide,
                                       @RequestParam("location") String location,
                                       @RequestParam("weather") String weather,
                                       @RequestParam("skill") String skill,
                                       @RequestParam("fortune") String fortune) {

        // fishName을 통해 fishNo 가져오기
        String fishNo = myPageService.getFishNoByName(fishName);

        // 각 요소별 점수 계산
        int tideScore = myPageService.getTideScore(fishNo, tide);
        int locationScore = myPageService.getLocationScore(fishNo, location);
        int weatherScore = myPageService.getWeatherScore(fishNo, weather);
        int skillScore = myPageService.getSkillScore(skill);
        int fortuneScore = myPageService.getFortuneScore(fortune);

        // 총 점수 계산(퍼센티지)
        int totalScore = tideScore + locationScore + weatherScore + skillScore + fortuneScore;
        int successRate = (int) ((totalScore / 25.0) * 100);

        return successRate;
    }

}

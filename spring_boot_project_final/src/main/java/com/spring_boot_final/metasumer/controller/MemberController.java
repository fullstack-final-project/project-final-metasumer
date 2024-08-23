package com.spring_boot_final.metasumer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	MemberService mbService;
	

	@RequestMapping("/member/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping("/member/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@RequestMapping("/member/businessAuth")
	public String businessAuth() {
		return "member/businessAuth";
	}
	
	@RequestMapping("/member/adminPage")
	public String adminPage() {
		return "member/adminPage";
	}
	
	@RequestMapping("/member/selectedTagsView/{memId}")
	public String selectedTagsView(Model model, @PathVariable("memId") String memId) 
	{
		ArrayList<MemberVO> usList = mbService.userTagList(memId);
		
		model.addAttribute("usList",usList); 
		
		return "member/selectedTagsView";
	}
	
	// 사용자 관심사 태그 저장된 부분 가져오기
	@RequestMapping("/member/userInterestTag")
	public String userInterestTag(Model model, HttpSession session) {
		 
		String memId = (String) session.getAttribute("sid");
		 
		 if (memId == null) {
		    return "redirect:/member/loginForm";
		 }
		 
		ArrayList<MemberVO> usList = mbService.userTagList(memId);
		
		model.addAttribute("usList",usList); 
		
		if (usList.isEmpty()) {
	        return "redirect:/member/userTagSelection";
	    } else {
	        return "redirect:/member/selectedTagsView/"+ memId;
	    }
	}
	
	// 관심사 태그 가져오기
	@RequestMapping("/member/userTagSelection")
	public String userTagSelection(Model model) {
		
		ArrayList<MemberVO> caList = mbService.categoryList();
		ArrayList<MemberVO> tagList = mbService.tagList();
		
		model.addAttribute("caList",caList); 
		model.addAttribute("tagList",tagList);
		
		
		return "member/userTagSelection";
	}
	
	// 관심사 태그 등록
	@RequestMapping(value = "/member/submitInterest", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> submitInterest(@RequestBody TagRequest request) {
	    Map<String, String> response = new HashMap<>();
	    
	    try {
	        String memId = request.getMemId();
	        List<String> tagIds = request.getTags();
	        
	        mbService.saveInterests(memId, tagIds);
	        response.put("redirectUrl", "/");
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("error", "저장 실패");
	    }
	    
	    return response;
	}
	
    public static class TagRequest {
    	
        private String memId;
        private List<String> tags;

        public String getMemId() { return memId; }
        public void setMemId(String memId) { this.memId = memId; }

        public List<String> getTags() { return tags; }
        public void setTags(List<String> tags) { this.tags = tags; }
    }
    
    // 관심사 추가 창
    @RequestMapping("/member/newSelectedTags/{memId}")
	public String newSelectedTags(@PathVariable("memId") String memId, Model model) {
    	
    	ArrayList<MemberVO> caList = mbService.categoryList();
		ArrayList<MemberVO> tagList = mbService.tagList();
		
		model.addAttribute("caList",caList); 
		model.addAttribute("tagList",tagList);
		
    	ArrayList<MemberVO> newList = mbService.newtagList(memId);
		model.addAttribute("newList",newList); 
    	
    	
		return "member/newSelectedTags";
	}

	
	@RequestMapping("/member/joinComplete")
	public String joinComplete() {
		return "member/joinComplete";
	}

	@ResponseBody
	@RequestMapping("/member/login")
	public String loginCheck(@RequestParam HashMap<String, Object> param, HttpSession session) {
		
		String result = mbService.loginCheck(param);
		
		if (result.equals("success")) {
			
			String memId = (String) param.get("id");
			
			Map<String, Object> userDetails = mbService.getUsermemNickname(memId);
	        String memNickname = (String) userDetails.get("memNickname");
	        String memType = (String) userDetails.get("memType");
	        
	        session.setAttribute("sid", memId);
	        session.setAttribute("memId", memId);
	        session.setAttribute("memNickname", memNickname);
	        session.setAttribute("memType", memType);
		}
		
		return result;

	}

	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {

		SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
		logoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication());

		request.getSession().invalidate();

		return "redirect:/";
	}

	// 회원가입
	// 전화번호 처리
	@RequestMapping("/member/join")
	public String join(MemberVO vo, @RequestParam("memHp1") String memHp1, @RequestParam("memHp2") String memHp2,
			@RequestParam("memHp3") String memHp3) {
		vo.setMemHP(memHp1 + "-" + memHp2 + "-" + memHp3);
		mbService.insertMember(vo);
		return "redirect:/member/joinComplete";
	}
	
	@RequestMapping(value = "/member/checkId", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam("memId") String memId) {
			
	        int count = mbService.memIdCheck(memId);
	        
	        String result = "true";
	        
	        if (count != 0) {
	        	result = "false";
	        }
	        
		return result;
	}
	
	@RequestMapping(value = "member/checknicknamCheck", method = RequestMethod.POST)
	@ResponseBody
	public String checknicknamCheck(@RequestParam("memNickname") String memNickname) {
		
		int count = mbService.memNicknameCheck(memNickname);
		
		String result = "true";
		
		if (count != 0) {
			result = "false";
		}
		
		return result;
	}
	
	
	
	

}

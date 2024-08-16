package com.spring_boot_final.metasumer;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.metasumer.service.TestService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class TestController {
	
	@Autowired
	TestService lgService;
	
	@RequestMapping("/")
	public String index() {
		return "test";
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public String loginCheck(@RequestParam HashMap<String, Object> param, HttpSession session) {

		String memId = lgService.loginCheck(param);
		
		Map<String, Object> userDetails = lgService.getUsermemNickname(memId);
		String memNickname = (String) userDetails.get("memNickname");
	    String memType = (String) userDetails.get("memType");
        
		String result = "fail";

		// id와 pwd 일치하면
		if (memId != null) {
			// 로그인 성공하면 세션 변수 설정
			session.setAttribute("sid", memId);
			session.setAttribute("memId", memId);
			session.setAttribute("memNickname", memNickname);
			session.setAttribute("memType", memType);
			
			result = "success";
		}

		return result;

	}
	
	@RequestMapping("/test/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		
		SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
        logoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication());

        request.getSession().invalidate();

        return "redirect:/"; 
	}

}
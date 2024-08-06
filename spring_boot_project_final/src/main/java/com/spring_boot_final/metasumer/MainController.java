package com.spring_boot_final.metasumer;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.metasumer.service.LoginService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@Autowired
	LoginService lgService;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public String loginCheck(@RequestParam HashMap<String, Object> param, HttpSession session) {

		String memId = lgService.loginCheck(param);
		String memNickname = lgService.getUsermemNickname(memId);
		String result = "fail";

		// id와 pwd 일치하면
		if (memId != null) {
			// 로그인 성공하면 세션 변수 설정
			session.setAttribute("sid", memId);
			session.setAttribute("memId", memId);
			session.setAttribute("memNickname", memNickname);
			
			result = "success";
		}

		return result;

	}

}

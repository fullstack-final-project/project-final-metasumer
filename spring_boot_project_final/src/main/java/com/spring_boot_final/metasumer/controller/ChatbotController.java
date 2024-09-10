package com.spring_boot_final.metasumer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.metasumer.service.ChatbotService;

@Controller
public class ChatbotController {
	
	@RequestMapping("/chatbotPage")
	public String chatbotForm() {
		return "layout/chatbot";
	}
	
	@RequestMapping("/chatbot")
	@ResponseBody
	public String chatbot(@RequestParam(value="message",  required=false) String message) {
		String result = ChatbotService.main(message); // 완료 : ajax에서 데이터 잘 넘어옴
		System.out.println("질문 : " + message);
		return result;
	}
	
	@RequestMapping("/csr")
	public String csrTestView() {
		return "layout/aiAPITest";
	}
	
}

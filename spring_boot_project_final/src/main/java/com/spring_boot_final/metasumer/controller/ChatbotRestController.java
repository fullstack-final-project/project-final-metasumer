package com.spring_boot_final.metasumer.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_final.metasumer.service.STTService;

@RestController
public class ChatbotRestController {
	
	private STTService sttService;
	
	@Autowired
	public ChatbotRestController (STTService sttService) {
		this.sttService = sttService;
	}
	
	@RequestMapping("/stt")
	public String speechToText(@RequestParam("uploadFile") MultipartFile file) {
		String result = "";
		
		try {
			//String uploadPath = "D:/springWorkspace/upload/";
			String uploadPath = "/usr/local/project/upload/"; 
			String originalFileName = file.getOriginalFilename();
			String filePathName = uploadPath + originalFileName;
			
			File newFile = new File(filePathName);
			file.transferTo(newFile); // 서버에 파일 전송
			
			result = sttService.stt(filePathName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}

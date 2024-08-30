package com.spring_boot_final.metasumer.service;

import java.io.IOException;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

@Service
public class WebScrapingService {
	public HashMap<String, String> jsoupText() {
		String URL = "https://www.badatime.com/ws_report.jsp";
		Document doc;
		HashMap<String, String> warningList = new HashMap<String, String>();
		
		try {
			doc = Jsoup.connect(URL).get();
			//System.out.println(doc); 
			
			warningList.put("img", doc.select("img[width=360]").first().attr("src")); // 기상 특보 이미지
			
			warningList.put("title", doc.select("td[bgcolor=#E3EFF6]").first().select("b").text()); // 기상 특보 제목
			
			warningList.put("content", doc.select("td[align=left]").first().text()); // 기상 특보 내용
			
			// System.out.println(warningList); 
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return warningList;
	}
}

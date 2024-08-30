package com.spring_boot_final.metasumer.service;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Service;

@Service
public class WebSrcapingService {
	public void jsoupText() {
		String URL = "https://www.badatime.com/ws_report.jsp";
		Document doc;
		try {
			doc = Jsoup.connect(URL).get();
			//System.out.println(doc); 
			Element imgSrc = doc.select("img[width=360]").first();
			System.out.println(imgSrc.attr("src"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
}

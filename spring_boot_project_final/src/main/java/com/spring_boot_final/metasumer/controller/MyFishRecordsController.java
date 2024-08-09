package com.spring_boot_final.metasumer.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_final.metasumer.model.MyFishRecordsVO;
import com.spring_boot_final.metasumer.service.MyFishRecordsService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyFishRecordsController {

	@Autowired
	MyFishRecordsService mfService;

	@RequestMapping("/myFishRecords/myFishRecordsListView")
	public String selectMyFishRecords(Model model) {

		ArrayList<MyFishRecordsVO> mfList = mfService.listAllMyFishRecords();

		model.addAttribute("mfList", mfList);

		return "myFishRecords/myFishRecordsListView";
	}

	@RequestMapping("/myFishRecords/newMyFishRecordsForm/{boardCtgId}")
	public String newMyFishRecordsForm(@PathVariable String boardCtgId, HttpServletRequest request) {

		request.setAttribute("boardCtgId", boardCtgId);

		return "myFishRecords/newMyFishRecordsForm";
	}

	@RequestMapping(value = "/myFishRecords/insertMyFishRecords", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> insertMyFishRecords(@RequestParam("memId") String memId,
			@RequestParam("title") String title, @RequestParam("content") String content,
			@RequestParam("boardCtgId") int boardCtgId, @RequestParam("uploadImage") MultipartFile image,
			@RequestParam("fishName") String fishName, @RequestParam("fishSize") String fishSize,
			@RequestParam("equipment") String equipment, @RequestParam("location") String location,
			@RequestParam("weather") String weather, @RequestParam("createdDate") String createdDate) {

		Map<String, String> response = new HashMap<>();
		try {
			MyFishRecordsVO vo = new MyFishRecordsVO();
			vo.setTitle(title);
			vo.setContent(content);
			vo.setBoardCtgId(boardCtgId);
			vo.setMemId(memId);
			vo.setFishName(fishName);
			vo.setFishSize(fishSize);
			vo.setEquipment(equipment);
			vo.setLocation(location);
			vo.setWeather(weather);

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date createdDateStr = dateFormat.parse(createdDate);
			vo.setCreatedDate(createdDateStr);

			if (image != null && !image.isEmpty()) {
				String savedImageName = saveFile(image);
				vo.setUploadImage(savedImageName);
			}

			mfService.insertMyFishRecords(vo);

			response.put("status", "success");
			response.put("redirectUrl", "/myFishRecords/myFishRecordsListView");

		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "fail");
		}

		return response;
	}

	@RequestMapping("/myFishRecords/detailViewmyFishRecords/{recordNo}")
	public String detailViewmyFishRecords(@PathVariable String recordNo, Model model) {

		MyFishRecordsVO mf = mfService.detailViewMyFishRecords(recordNo);

		model.addAttribute("mf", mf);

		return "myFishRecords/detailViewMyFishRecords";
	}

	// 수정
	@RequestMapping("/freeboard/updatemyFishRecordsForm/{recordNo}")
	public String updateMyFishRecordsForm(@PathVariable String recordNo, Model model) {

		MyFishRecordsVO mf = mfService.detailViewMyFishRecords(recordNo);
		model.addAttribute("mf", mf);
		return "myFishRecords/updateMyFishRecordsForm";
	}

	@RequestMapping("myFishRecords/updatemyFishRecords")
	public String updateFreeBoard(@RequestParam("title") String title, @RequestParam("content") String content,
			@RequestParam("recordNo") int recordNo, @RequestParam("uploadFile") MultipartFile image,
			@RequestParam("fishName") String fishName, @RequestParam("fishSize") String fishSize,
			@RequestParam("equipment") String equipment, @RequestParam("location") String location,
			@RequestParam("weather") String weather,
			@RequestParam("createdDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date createdDate) {

		MyFishRecordsVO vo = new MyFishRecordsVO();

		vo.setTitle(title);
		vo.setContent(content);
		vo.setFishName(fishName);
		vo.setCreatedDate(createdDate);
		vo.setFishSize(fishSize);
		vo.setEquipment(equipment);
		vo.setLocation(location);
		vo.setWeather(weather);
		vo.setRecordNo(recordNo);

		try {
			if (image != null && !image.isEmpty()) {
				String savedImageName = saveFile(image);
				vo.setUploadImage(savedImageName);
			}

			mfService.updateMyFishRecords(vo);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/myFishRecords/myFishRecordsListView";
	}

	@RequestMapping("/myFishRecords/MyFishRecordsList")
	public String MyFishRecordsList(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
        String memId = (String) session.getAttribute("memId");
        
		ArrayList<MyFishRecordsVO> mfList = mfService.MyFishRecordsList(memId);

		model.addAttribute("mfList", mfList);
		
		return "myFishRecords/MyFishRecordsList";
	}

	private String saveFile(MultipartFile file) throws IOException {
		String uploadPath = "D:/springWorkspace/metasumer_images/";

		String originalFileName = file.getOriginalFilename();
		originalFileName = originalFileName.replace("[", "_").replace("]", "_");

		UUID uuid = UUID.randomUUID();
		String savedFileName = uuid.toString() + "_" + originalFileName;
		File uploadFile = new File(uploadPath + savedFileName);

		file.transferTo(uploadFile);

		return savedFileName;
	}

}

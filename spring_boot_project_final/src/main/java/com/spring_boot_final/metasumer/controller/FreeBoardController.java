package com.spring_boot_final.metasumer.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_final.metasumer.model.FreeBoardVO;
import com.spring_boot_final.metasumer.service.FreeBoardService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class FreeBoardController {

	@Autowired
	FreeBoardService fbService;

	// 자유게시판 글 목록 전체 보기
	@RequestMapping("/freeboard/freeboardView")
    public String freeboardView(
            @RequestParam(value = "page", defaultValue = "1") int page,
            Model model) {

        int pageSize = 10; // 한 페이지에 표시할 항목 수

        if (page < 1) {
            page = 1;
        }

        // 총 항목 수
        int totalItems = fbService.countTotalItems();

        // 총 페이지 수를 계산
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);

        if (page > totalPages) {
            page = totalPages;
        }

        int offset = (page - 1) * pageSize;
        List<FreeBoardVO> fbList = fbService.selectItemsForPage(offset, pageSize);

        model.addAttribute("fbList", fbList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "freeboard/freeboardView";
    }
	
	@RequestMapping("/freeboard/newfreeboardForm")
	public String newfreeboradForm(HttpServletRequest request, HttpServletResponse response) {
	    
	    HttpSession session = request.getSession();
	    
	    String memNickname = (String) session.getAttribute("memNickname");
	    String memId = (String) session.getAttribute("memId");
	    
	    request.setAttribute("memNickname", memNickname);
	    request.setAttribute("memId", memId);
	    
	    return "freeboard/newfreeboardForm";
	}

	// 자유게시판 글 등록
	@RequestMapping(value = "/freeboard/insertFreeBoard", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> insertFreeBoard(@RequestParam("title") String title, @RequestParam("content") String content, @RequestParam("memId") String memId, @RequestParam("boardCtgId") int boardCtgId, @RequestParam("uploadFile") MultipartFile file, Model model) {
		
		Map<String, String> response = new HashMap<>();

        try {
            String uploadPath = "D:/springWorkspace/upload/";

            String originalFileName = file.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String savedFileName = uuid.toString() + "_" + originalFileName;
            File uploadFile = new File(uploadPath + savedFileName);

            file.transferTo(uploadFile);

            FreeBoardVO vo = new FreeBoardVO();
            vo.setTitle(title);
            vo.setContent(content);
            vo.setBoardCtgId(boardCtgId);
            vo.setMemId(memId);
            vo.setUploadFile(savedFileName); 

            fbService.insertFreeBoard(vo);

            response.put("status", "success");
            response.put("redirectUrl", "/freeboard/freeboardView");

        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "fail");
        }

        return response;
    }
	
	
	
	
}

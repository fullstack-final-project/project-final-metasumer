package com.spring_boot_final.metasumer.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
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

	// 자유게시판, 공지사항, 자주묻는 질문, 고객센터 전체 보기
	@RequestMapping("/freeboard/freeboardView/{boardCtgId}")
	public String freeboardView(@PathVariable String boardCtgId,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		try {
			
			if ("3".equals(boardCtgId)) {
				ArrayList<FreeBoardVO> qnaList = fbService.qnaList(boardCtgId);
				model.addAttribute("qnaList", qnaList);
	            return "freeboard/qnaView";
	        }
			
			
			int pageSize = 10; // 한 페이지에 표시할 항목 수

			if (page < 1) {
				page = 1;
			}

			// 총 항목 수
			int totalItems = fbService.countTotalItems(boardCtgId);

			// 총 페이지 수를 계산
			int totalPages = (int) Math.ceil((double) totalItems / pageSize);

			if (page > totalPages) {
				page = totalPages;
			}

			int offset = (page - 1) * pageSize;

			ArrayList<FreeBoardVO> fbList = fbService.selectItemsForPage(offset, pageSize, boardCtgId);

			model.addAttribute("fbList", fbList);
			model.addAttribute("currentPage", page);
			model.addAttribute("totalPages", totalPages);

			return "freeboard/freeboardView";

		} catch (Exception e) {
			System.out.println(boardCtgId);
			return "freeboard/freeboardView";
		}

	}

	// 벼룩시장
	@RequestMapping("/freeboard/fleamarketList/{completed}")
	public String fleamarketList(@PathVariable int completed, Model model) {
		
		String boardCtgId = "5";
		
		ArrayList<FreeBoardVO> fbList;
		
		if(completed == 1) {
			fbList = fbService.fleamarketList(boardCtgId, completed);
		} else {
			fbList = fbService.fleamarketList(boardCtgId, completed);
		}
		
		model.addAttribute("fbList", fbList);
		
		
		return "freeboard/fleamarketList";
	}
	
	// 벼룩시장
	@RequestMapping("/freeboard/fleamarketListcompleted/{completed}")
	public String fleamarketcompleted(@PathVariable int completed, @RequestParam String boardPostNo) {
		
		if(completed == 1) {
			completed = 0;
		} else {
			completed = 1;
		}
		
		fbService.fleamarketcompleted(boardPostNo, completed);
		
		return "redirect:/freeboard/fleamarketList/" + completed;
	}
	
	
	
	
	@RequestMapping("/freeboard/newfreeboardForm/{boardCtgId}")
	public String newfreeboradForm(@PathVariable String boardCtgId, HttpServletRequest request) {

		HttpSession session = request.getSession();

		String memNickname = (String) session.getAttribute("memNickname");
		String memId = (String) session.getAttribute("memId");

		request.setAttribute("memNickname", memNickname);
		request.setAttribute("memId", memId);
		request.setAttribute("boardCtgId", boardCtgId);

		return "freeboard/newfreeboardForm";
	}

	// 자유게시판 글 등록
	@RequestMapping(value = "/freeboard/insertFreeBoard", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> insertFreeBoard(@RequestParam("title") String title, @RequestParam("completed") String completed,
			@RequestParam("content") String content, @RequestParam("memId") String memId, @RequestParam(value = "price", required = false) String price,
			@RequestParam("boardCtgId") int boardCtgId, @RequestParam("uploadFile") MultipartFile file, Model model) {

		Map<String, String> response = new HashMap<>();

		try {
			FreeBoardVO vo = new FreeBoardVO();
			vo.setTitle(title);
			vo.setContent(content);
			vo.setBoardCtgId(boardCtgId);
			vo.setMemId(memId);
			
			if (price != null && !price.isEmpty()) {
	            vo.setPrice(price);
	        }
			
			if (file != null && !file.isEmpty()) {
				String savedFileName = saveFile(file);
				vo.setUploadFile(savedFileName);
			}

			fbService.insertFreeBoard(vo);
			
			String redirectUrl;
	        if (boardCtgId == 5) {
	            redirectUrl = "/freeboard/fleamarketList/" + completed; 
	        } else {
	            redirectUrl = "/freeboard/freeboardView/" + boardCtgId; 
	        }

	        response.put("status", "success");
	        response.put("redirectUrl", redirectUrl);

		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "fail");
		}

		return response;
	}

	@RequestMapping("/freeboard/detailViewFreeBoard/{boardPostNo}")
	public String detailViewFreeBoard(@PathVariable String boardPostNo, Model model) {

		FreeBoardVO fb = fbService.detailViewFreeBoard(boardPostNo);

		model.addAttribute("fb", fb);

		return "freeboard/detailViewFreeBoard";
	}

	// 다운로드
	@RequestMapping("/downloadFile/{uploadFile}")
	public void FileDownload(@PathVariable String uploadFile, HttpServletResponse response) throws IOException {

		File f = new File("D:/springWorkspace/metasumer_images", uploadFile);

		String encodedFileName = new String(uploadFile.getBytes("UTF-8"), "ISO-8859-1");

		response.setContentType("application/download");
		response.setContentLength((int) f.length());
		response.setHeader("Content-Disposition", "attatchment;filename=\"" + encodedFileName + "\"");

		FileInputStream fis = new FileInputStream(f);

		OutputStream os = response.getOutputStream();

		FileCopyUtils.copy(fis, os);

	}

	// 수정
	@RequestMapping("/freeboard/updateBoardForm/{boardPostNo}")
	public String updateFreeBoardForm(@PathVariable String boardPostNo, Model model) {
		FreeBoardVO fb = fbService.detailViewFreeBoard(boardPostNo);
		model.addAttribute("fb", fb);
		return "freeboard/updateFreeBoardForm";
	}

	@RequestMapping("freeboard/updateFreeBoard")
	public String updateFreeBoard(@RequestParam("boardPostNo") String boardPostNo, @RequestParam("title") String title,
			@RequestParam("boardCtgId") int boardCtgId, @RequestParam("content") String content, @RequestParam(value = "price", required = false) String price,
			@RequestParam("uploadFile") MultipartFile file) {

		FreeBoardVO fb = fbService.detailViewFreeBoard(boardPostNo);

		FreeBoardVO vo = new FreeBoardVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setBoardPostNo(boardPostNo);
		
		if (price != null && !price.isEmpty()) {
            vo.setPrice(price);
        }

		try {
			if (file != null && !file.isEmpty()) {
				String savedFileName = saveFile(file);
				vo.setUploadFile(savedFileName);
			} else {
				vo.setUploadFile(fb.getUploadFile());
			}

			fbService.updateFreeBoard(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (boardCtgId == 5) {
	        return "redirect:/freeboard/fleamarketList/" + boardCtgId;
	    } else {
	        return "redirect:/freeboard/freeboardView/" + boardCtgId;
	    }
	}

	// 삭제
	@RequestMapping("/freeboard/deleteBoard")
	public String deleteFreeBoard(@RequestParam("boardPostNo") String boardPostNo,
			@RequestParam("boardCtgId") int boardCtgId) {
		
		fbService.deleteFreeBoardComment(boardPostNo);
		fbService.deleteFreeBoard(boardPostNo);
		
		
		if (boardCtgId == 5) {
	        return "redirect:/freeboard/fleamarketList/" + boardCtgId;
	    } else {
	        return "redirect:/freeboard/freeboardView/" + boardCtgId;
	    }
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

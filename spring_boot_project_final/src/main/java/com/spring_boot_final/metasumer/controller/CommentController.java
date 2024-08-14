package com.spring_boot_final.metasumer.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.metasumer.model.CommentVO;
import com.spring_boot_final.metasumer.service.CommentService;


@Controller
public class CommentController {
	
	@Autowired
	CommentService cmService;
	
	@PostMapping("/board/addComment")
    @ResponseBody
	public Map<String, String> selectMyFishRecords(@RequestParam(value = "secret", defaultValue = "false") boolean secret, @RequestParam String memId, @RequestParam String recordNo, @RequestParam String boardCtgId, @RequestParam String content) {
		
		int secretResult = secret ? 1 : 0;
		
		CommentVO vo = new CommentVO();
		
		vo.setMemId(memId);
		vo.setRecordNo(recordNo);
		vo.setBoardCtgId(boardCtgId);
		vo.setContent(content);
		vo.setSecret(secretResult);
		
		cmService.addComment(vo);
		
		Map<String, String> response = new HashMap<>();
	    response.put("status", "success");

		return response;
	}
	
	@GetMapping("/board/getComments/{recordNo}")
    @ResponseBody
    public ArrayList<CommentVO> getComments(@PathVariable("recordNo") String recordNo) {
        return cmService.listAllComment(recordNo);
    }
	
	@RequestMapping("/board/updateComment")
	@ResponseBody
    public Map<String, String> updateComment(@RequestParam("commentNo") String commentNo, @RequestParam("recordNo") String recordNo, @RequestParam("content") String content) {
        
		CommentVO vo = new CommentVO();
		vo.setCommentNo(commentNo);
		vo.setRecordNo(recordNo);
		vo.setContent(content);
		
		cmService.updateComment(vo);
		Map<String, String> response = new HashMap<>();
	    response.put("status", "success");

		return response;
    }
	
	@RequestMapping("/board/deleteComment")
	@ResponseBody
    public Map<String, String> deleteComment(@RequestParam("commentNo") String commentNo, @RequestParam("recordNo") String recordNo) {
        
		cmService.deleteComment(commentNo, recordNo);
			
		Map<String, String> response = new HashMap<>();
	    response.put("status", "success");

		return response;
    }
	
	/* --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */

	@PostMapping("/board/addCommentBoard")
    @ResponseBody
	public Map<String, String> selectMyFishRecordsBoard(@RequestParam(value = "secret", defaultValue = "false") boolean secret, @RequestParam String memId, @RequestParam String boardPostNo, @RequestParam String boardCtgId, @RequestParam String content) {
		
		int secretResult = secret ? 1 : 0;
		
		CommentVO vo = new CommentVO();
		
		
		vo.setMemId(memId);
		vo.setBoardPostNo(boardPostNo);
		vo.setBoardCtgId(boardCtgId);
		vo.setContent(content);
		vo.setSecret(secretResult);
		
		cmService.addCommentBoard(vo);
		
		Map<String, String> response = new HashMap<>();
	    response.put("status", "success");

		return response;
	}
	
	@GetMapping("/board/getCommentsBoard/{boardPostNo}")
    @ResponseBody
    public ArrayList<CommentVO> getCommentsBoard(@PathVariable("boardPostNo") String boardPostNo) {
        return cmService.listAllCommentBoard(boardPostNo);
    }
	
	@RequestMapping("/board/updateCommentBoard")
	@ResponseBody
    public Map<String, String> updateCommentBoard(@RequestParam("commentNo") String commentNo, @RequestParam("boardPostNo") String boardPostNo, @RequestParam("content") String content) {
        
		CommentVO vo = new CommentVO();
		vo.setCommentNo(commentNo);
		vo.setBoardPostNo(boardPostNo);
		vo.setContent(content);
		
		cmService.updateCommentBoard(vo);
		Map<String, String> response = new HashMap<>();
	    response.put("status", "success");

		return response;
    }
	
	@RequestMapping("/board/deleteCommentBoard")
	@ResponseBody
    public Map<String, String> deleteCommentBoard(@RequestParam("commentNo") String commentNo, @RequestParam("boardPostNo") String boardPostNo) {
		
		cmService.deleteCommentBoard(commentNo, boardPostNo);
			
		Map<String, String> response = new HashMap<>();
	    response.put("status", "success");

		return response;
    }
	
	
}

package com.spring_boot_final.metasumer.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_boot_final.metasumer.model.BusinessAuthVO;
import com.spring_boot_final.metasumer.model.FreeBoardVO;
import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;

	@RequestMapping("/admin/adminPage")
	public String adminPage() {
		return "admin/adminPage";
	}

	@RequestMapping("/admin/newAdminAccount")
	public String newAdminAccount() {

		return "admin/newAdminAccount";
	}

	@RequestMapping("/admin/memberManagement/{memType}")
	public String memberManagement(Model model, @PathVariable("memType") String memType,
			@RequestParam(value = "page", defaultValue = "1") int page) {

		final int pageSize = 20;

	    int offset = (page - 1) * pageSize;
	    List<MemberVO> memList = adminService.memberList(memType, offset, pageSize);
	    model.addAttribute("memList", memList);

	    int totalCount = adminService.countMembers(memType);
	    int totalPages = (int) Math.ceil((double) totalCount / pageSize);

	    if (page < 1) {
	        page = 1;
	    } else if (page > totalPages) {
	        page = totalPages;
	    }

	    int startPage = ((page - 1) / 10) * 10 + 1;
	    int endPage = Math.min(startPage + 9, totalPages);

	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("memType", memType);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);

	    return "admin/memberManagement";
	}

	@RequestMapping("/admin/businessManagement")
	public String businessManagement(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

	    int pageSize = 20;
	    int offset = (page - 1) * pageSize;

	    ArrayList<BusinessAuthVO> bsList = adminService.businessList(offset, pageSize);
	    model.addAttribute("bsList", bsList);

	    int totalCount = adminService.countbusiness();
	    int totalPages = (int) Math.ceil((double) totalCount / pageSize);

	    int startPage = ((page - 1) / 10) * 10 + 1;
	    int endPage = Math.min(startPage + 9, totalPages);

	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);

	    int count = adminService.countBusinessAuth();
	    model.addAttribute("count", count);

	    return "admin/businessManagementList";
	}

	// 회원 계정 활성/비활성
	@RequestMapping("/admin/updateMemberStatus")
	public String updateMemberStatus(RedirectAttributes redirectAttributes, @RequestParam("memberId") String memberId,
			@RequestParam("status") String status, @RequestParam("memType") String memType) {

		adminService.updateMemberStatus(memberId, status);

		String statusMessage = status.equals("active") ? "활성으로 변경되었습니다." : "비활성으로 변경되었습니다.";
		redirectAttributes.addFlashAttribute("statusMessage", statusMessage);

		if (memType.equals("business")) {
			return "redirect:/admin/businessManagement";
		} else {
			return "redirect:/admin/memberManagement/" + memType;
		}
	}

	// 사업자 신청 리스트 보기
	@RequestMapping("/admin/businessAuthList")
	public String businessAuthList(@RequestParam(value = "authStatus", required = false) String authStatus,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		int pageSize = 20;
	    int offset = (page - 1) * pageSize;

	    ArrayList<BusinessAuthVO> authList = adminService.getPendingBusinessAuth(offset, pageSize, authStatus);

	    int totalItems = adminService.getTotalBusinessAuthCount();

	    int totalPages = (int) Math.ceil((double) totalItems / pageSize);

	    int startPage = ((page - 1) / 10) * 10 + 1;
	    int endPage = Math.min(startPage + 9, totalPages);

	    model.addAttribute("authList", authList);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("authStatus", authStatus);

		return "admin/businessAuthList";
	}

	// 사업자 계정 검토 / 승인 / 거절
	@RequestMapping("/admin/updateAuthStatus")
	public String updateAuthStatus(RedirectAttributes redirectAttributes, @RequestParam("bizId") int bizId,
			@RequestParam("authStatus") String authStatus, @RequestParam("memId") String memId) {

		adminService.updateAuthStatus(bizId, authStatus);
		String memType = "general";
		String statusMessage;
		switch (authStatus) {
		case "pending":
			statusMessage = "검토 중으로 변경되었습니다.";
			adminService.updateMemberType(memId, memType);
			break;
		case "approved":
			memType = "business";
			statusMessage = "승인되었습니다.";
			adminService.updateMemberType(memId, memType);
			break;
		case "rejected":
			memType = "general";
			statusMessage = "거절되었습니다.";
			adminService.updateMemberType(memId, memType);
			break;
		default:
			statusMessage = "상태가 변경되었습니다.";
			break;
		}

		redirectAttributes.addFlashAttribute("statusMessage", statusMessage);

		return "redirect:/admin/businessAuthList";
	}

	// 회원 상세 페이지
	@RequestMapping("/admin/memberDetail/{memId}")
	public String memberDetail(@PathVariable("memId") String memId, Model model) {
		ArrayList<MemberVO> memList = adminService.memberDetail(memId);
		model.addAttribute("memList", memList);

		return "admin/memberDetail";
	}

	// 사업자 상세 페이지
	@RequestMapping("/admin/businessDetail/{memId}/{bizId}")
	public String businessDetail(@PathVariable("memId") String memId, @PathVariable("bizId") String bizId,
			Model model) {

		ArrayList<BusinessAuthVO> bsList = adminService.businessDetail(memId, bizId);
		model.addAttribute("bsList", bsList);

		return "admin/businessDetail";
	}

	// 게시물 관리
	@RequestMapping("/admin/postOps")
	public String postOps(@RequestParam(value = "boardCategory", required = false) Integer boardCategory,
			@RequestParam(value = "startDate", required = false) LocalDate startDate,
			@RequestParam(value = "endDate", required = false) LocalDate endDate,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "20") int size, Model model) {

		if (startDate == null) {
			startDate = LocalDate.now();
		}
		if (endDate == null) {
			endDate = LocalDate.now();
		}
		if (boardCategory == null) {
			boardCategory = 0;
		}
		page = Math.max(page, 1);
		int offset = (page - 1) * size;

		ArrayList<FreeBoardVO> poList = adminService.getPostsList(boardCategory, startDate, endDate, size, offset);

		int totalCount = adminService.getPostsCount(boardCategory, startDate, endDate);
		int totalPages = (int) Math.ceil((double) totalCount / size);
		
		int startPage = ((page - 1) / 10) * 10 + 1;
	    int endPage = Math.min(startPage + 9, totalPages);

	    model.addAttribute("poList", poList);
	    model.addAttribute("startDate", startDate);
	    model.addAttribute("endDate", endDate);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("size", size);
	    model.addAttribute("boardCategory", boardCategory);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);

		return "admin/postOps";
	}

	// 게시판 글 활성/비활성
	@RequestMapping("/admin/updatePostStatus")
	public String updatePostStatus(RedirectAttributes redirectAttributes, @RequestParam("boardCtgId") int boardCtgId,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate, @RequestParam("status") String status,
			@RequestParam("postId") int postId) {

		if (boardCtgId == 6) {
			int recordNo = postId;
			adminService.updateMyFishRecordsPostStatus(recordNo, status);
		} else {
			int boardPostNo = postId;
			adminService.updatePostStatus(boardPostNo, status);
		}

		return "redirect:/admin/postOps?startDate=" + URLEncoder.encode(startDate, StandardCharsets.UTF_8) + "&endDate="
				+ URLEncoder.encode(endDate, StandardCharsets.UTF_8);
	}

	// 통계
	@RequestMapping("/admin/showStatistics")
	@ResponseBody
	public Map<String, Object> showTopMembers() {
	    List<Map<String, Object>> topList = adminService.getTopMembersByLoginCount();
	    List<Map<String, Object>> postList = adminService.getPostCount();
	    List<Map<String, Object>> topPostList = adminService.getTopPostsCount();
	    
	    Map<String, Object> response = new HashMap<>();
	    response.put("topList", topList);
	    response.put("postList", postList);
	    response.put("topPostList", topPostList);

	    return response;
	}

}

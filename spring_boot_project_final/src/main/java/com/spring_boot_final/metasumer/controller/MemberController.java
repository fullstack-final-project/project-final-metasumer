package com.spring_boot_final.metasumer.controller;

import java.io.UnsupportedEncodingException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.model.TagRequestVO;
import com.spring_boot_final.metasumer.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	MemberService mbService;

	@RequestMapping("/member/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping("/member/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}

	@RequestMapping("/member/businessAuth")
	public String businessAuth() {
		return "member/businessAuth";
	}

	@RequestMapping("/member/adminPage")
	public String adminPage() {
		return "member/adminPage";
	}

	@RequestMapping("/member/accountRecoveryForm")
	public String accountRecoveryForm() {
		return "member/accountRecoveryForm";
	}

	@RequestMapping("/member/selectedTagsView/{memId}")
	public String selectedTagsView(Model model, @PathVariable("memId") String memId) {
		ArrayList<MemberVO> usList = mbService.userTagList(memId);

		model.addAttribute("usList", usList);

		return "member/selectedTagsView";
	}

	// 사용자 관심사 태그 저장된 부분 가져오기
	@RequestMapping("/member/userInterestTag")
	public String userInterestTag(Model model, HttpSession session) {

		String memId = (String) session.getAttribute("sid");

		if (memId == null) {
			return "redirect:/member/loginForm";
		}

		ArrayList<MemberVO> usList = mbService.userTagList(memId);

		model.addAttribute("usList", usList);

		if (usList.isEmpty()) {
			return "redirect:/member/userTagSelection";
		} else {
			return "redirect:/member/selectedTagsView/" + memId;
		}
	}

	// 관심사 태그 가져오기
	@RequestMapping("/member/userTagSelection")
	public String userTagSelection(Model model) {

		ArrayList<MemberVO> caList = mbService.categoryList();
		ArrayList<MemberVO> tagList = mbService.tagList();

		model.addAttribute("caList", caList);
		model.addAttribute("tagList", tagList);

		return "member/userTagSelection";
	}

	// 관심사 태그 등록
	@RequestMapping(value = "/member/submitInterest", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> submitInterest(@RequestBody TagRequestVO request) {

		Map<String, String> response = new HashMap<>();

		try {
			String memId = request.getMemId();
			List<String> tags = request.getTags();

			mbService.saveInterests(memId, tags);
			response.put("redirectUrl", "/");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("error", "저장 실패");
		}

		return response;
	}

	// 관심사 태그 수정
	@RequestMapping(value = "/member/tagsEdit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> tagsEdit(@RequestBody TagRequestVO request) {

		String memId = request.getMemId();
		List<String> tags = request.getTags();
		List<String> newTags = request.getNewTags();
		mbService.deleteInterests(memId);

		Map<String, String> response = new HashMap<>();

		try {
			List<String> allTags = new ArrayList<>();

			if (tags != null) {
				allTags.addAll(tags);
			}

			if (newTags != null) {
				allTags.addAll(newTags);
			}

			mbService.saveInterests(memId, allTags);
			response.put("redirectUrl", "/member/selectedTagsView/" + memId);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("error", "저장 실패");
		}

		return response;

	}

	// 관심사 추가 창
	@RequestMapping("/member/newSelectedTags/{memId}")
	public String newSelectedTags(@PathVariable("memId") String memId, Model model) {

		ArrayList<MemberVO> caList = mbService.categoryList();
		ArrayList<MemberVO> tagList = mbService.tagList();

		model.addAttribute("caList", caList);
		model.addAttribute("tagList", tagList);

		ArrayList<MemberVO> newList = mbService.newtagList(memId);
		model.addAttribute("newList", newList);

		return "member/newSelectedTags";
	}

	@RequestMapping("/member/joinComplete")
	public String joinComplete() {
		return "member/joinComplete";
	}

	// 로그인
	@ResponseBody
	@RequestMapping("/member/login")
	public String loginCheck(@RequestParam HashMap<String, Object> param, HttpSession session) {

		String memId = (String) param.get("id");
		String result = "fail";

		try {
			result = mbService.loginCheck(param);

			if (result.equals("success")) {
				Map<String, Object> userDetails = mbService.getUsermemNickname(memId);
				String memNickname = (String) userDetails.get("memNickname");
				String memType = (String) userDetails.get("memType");
				String status = (String) userDetails.get("status");

				if (status.equals("inactive")) {
					return "inactive";
				}

				session.setAttribute("sid", memId);
				session.setAttribute("memId", memId);
				session.setAttribute("memNickname", memNickname);
				session.setAttribute("memType", memType);

				mbService.loginCount(memId);
				mbService.lossCountReset(memId);
			} else {
				mbService.loginLoss(memId);
				int lossCount = mbService.getLossCount(memId);

				if (lossCount >= 5) {
					mbService.updateLossStatus(memId);
					result = "inactive";
				} else {
					result = "fail";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "error";
		}

		return result;
	}

	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {

		SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
		logoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication());

		request.getSession().invalidate();

		return "redirect:/";
	}

	// 회원가입
	@RequestMapping("/member/join")
	public String join(MemberVO vo, @RequestParam("sessionMemType") String sessionMemType,
			@RequestParam("memHp1") String memHp1, @RequestParam("memHp2") String memHp2,
			@RequestParam("memHp3") String memHp3, @RequestParam("birthYear") String birthYear,
			@RequestParam("birthMonth") String birthMonth, @RequestParam("birthDay") String birthDay) {
		vo.setMemHP(memHp1 + "-" + memHp2 + "-" + memHp3);

		String BirthDate = String.format("%s-%s-%s", birthYear, birthMonth, birthDay);
		vo.setBirthDate(BirthDate);

		mbService.insertMember(vo);

		if (sessionMemType.equals("admin")) {
			return "redirect:/admin/memberManagement/" + sessionMemType;
		} else {
			return "redirect:/member/joinComplete";
		}
	}

	@RequestMapping(value = "/member/checkId", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam("memId") String memId) {

		int count = mbService.memIdCheck(memId);

		String result = "true";

		if (count != 0) {
			result = "false";
		}

		return result;
	}

	@RequestMapping(value = "member/checknicknamCheck", method = RequestMethod.POST)
	@ResponseBody
	public String checknicknamCheck(@RequestParam("memNickname") String memNickname) {

		int count = mbService.memNicknameCheck(memNickname);

		String result = "true";

		if (count != 0) {
			result = "false";
		}

		return result;
	}

	// 아이디 찾기
	@RequestMapping("member/forgotId")
	public String forgotId(HttpSession session, @RequestParam String memName, @RequestParam String birthDate,
			@RequestParam String hp1, @RequestParam String hp2, @RequestParam String hp3, @RequestParam String memEmail)
			throws UnsupportedEncodingException {

		String memHP = hp1 + "-" + hp2 + "-" + hp3;
		String memId = mbService.findId(memName, birthDate, memHP, memEmail);

		if (memId != null) {
			session.setAttribute("message", "찾으신 아이디는 " + memId + "입니다.");
		} else {
			session.setAttribute("message", "입력하신 정보로는 아이디를 찾을 수 없습니다.");
		}
		
		session.setAttribute("formState", "id");
		

		return "redirect:/member/accountRecoveryForm";
	}
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@*";
    private static final int PASSWORD_LENGTH = 8;
	
	// 비밀번호 찾기
	@RequestMapping("member/forgotPassword")
	public String forgotPassword(HttpSession session, @RequestParam String memId, @RequestParam String birthDate,
			@RequestParam String memName, @RequestParam String memEmail) {

		int userCount = mbService.findPasswordCount(memId, birthDate, memName, memEmail);
	    
		if (userCount == 1) {
			
			SecureRandom random = new SecureRandom();
	        StringBuilder password = new StringBuilder(PASSWORD_LENGTH);
	        for (int i = 0; i < PASSWORD_LENGTH; i++) {
	            int index = random.nextInt(CHARACTERS.length());
	            password.append(CHARACTERS.charAt(index));
	        }
	        
	        try {
	        	String encodePassword = passwordEncoder.encode(password.toString());
	        	
	        	mbService.findUpdatePassword(memId, encodePassword);
	            
	            String subject = "임시 비밀번호 안내";
	            String body = "<html><body>"
	                + "<h2>안녕하세요, " + memName + "님</h2>"
	                + "<p>비밀번호 찾기 요청을 받았습니다.</p>"
	                + "<p>임시 비밀번호는 아래와 같습니다:</p>"
	                + "<p><strong>" + password.toString() + "</strong></p>"
	                + "<p>임시 비밀번호를 사용하여 로그인 후, 반드시 새로운 비밀번호로 변경해 주세요.</p>"
	                + "<p>문제가 발생하거나 추가 지원이 필요하시면, 언제든지 고객센터로 문의해 주세요.</p>"
	                + "<p>감사합니다.</p>"
	                + "</body></html>";

	            mbService.sendMail(memEmail, subject, body);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
			
			
			session.setAttribute("message", "임시 비밀번호를 회원님의 이메일로 보내드렸습니다.");
		} else {
			session.setAttribute("message", "입력하신 정보가 올바르지 않습니다.<br> 정확한 정보를 입력 후 다시 시도해 주세요.<br> 문제가 지속되면 고객센터로 문의해 주세요.");
		}
		
		session.setAttribute("formState", "pwd");

		return "redirect:/member/accountRecoveryForm";
	}

	@RequestMapping(value = "member/clearMessage", method = RequestMethod.POST)
	@ResponseBody
	public String clearMessage(HttpSession session) {
	    session.removeAttribute("message");
	    session.removeAttribute("formState");
	    return "OK";
	}
	
	
	
	
	
	


}

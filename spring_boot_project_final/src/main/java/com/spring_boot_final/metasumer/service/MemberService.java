package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IMemberDAO;
import com.spring_boot_final.metasumer.model.BusinessAuthVO;
import com.spring_boot_final.metasumer.model.MemberVO;

import jakarta.mail.internet.MimeMessage;

@Service
public class MemberService implements IMemberService {

	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO dao;
	
	@Autowired
	PasswordEncoder pwdEncoder;

	@Override
	public String loginCheck(HashMap<String, Object> map) {
		
	    String encodedPwd = dao.loginCheck(map);
	    
	    String result = "fail";
	    
	    if (encodedPwd != null && pwdEncoder.matches((String)map.get("pwd"), encodedPwd)) {
	        result = "success";
	    }
	    
	    return result;
	}
	
	@Override
  public Map<String, Object> getUsermemNickname(String memId) {
		return dao.getUsermemNickname(memId);
	}

	@Override
	public int memIdCheck(String memId) {
		return dao.memIdCheck(memId);
	}

	@Override
	public void insertMember(MemberVO vo) {
		String encodedPwd = pwdEncoder.encode(vo.getMemPwd());
		vo.setMemPwd(encodedPwd);
		dao.insertMember(vo);
	}

	@Override
	public int memNicknameCheck(String memNickname) {
		return dao.memNicknameCheck(memNickname);
	}

	@Override
	public ArrayList<MemberVO> tagList() {
		return dao.tagList();
	}
	@Override
	public ArrayList<MemberVO> categoryList() {
		return dao.categoryList();
	}

	@Override
	public void saveInterests(String memId, List<String> tagIds) {
        dao.saveInterests(memId, tagIds);
	}

	@Override
	public ArrayList<MemberVO> userTagList(String memId) {
		return dao.userTagList(memId);
	}

	@Override
	public ArrayList<MemberVO> newtagList(String memId) {
		return dao.newtagList(memId);
	}
	

	@Override
	public void deleteInterests(String memId) {
		dao.deleteInterests(memId);
	}

	@Override
	public void insertBusinessAuth(BusinessAuthVO vo) {
		dao.insertBusinessAuth(vo);
	}

	@Override
	public void loginCount(String memId) {
		dao.loginCount(memId);
	}

	@Override
	public int checkMemId(String memId) {
		return dao.checkMemId(memId);
		
	}

	@Override
	public void loginLoss(String memId) {
		dao.loginLoss(memId);
	}

	@Override
	public int getLossCount(String memId) {
		return dao.getLossCount(memId);
	}

	@Override
	public void updateLossStatus(String memId) {
		dao.updateLossStatus(memId);
	}

	@Override
	public String findId(String memName, String birthDate, String memHP, String memEmail) {
		return dao.findId(memName, birthDate, memHP, memEmail);
	}

	@Override
	public int findPasswordCount(String memId, String birthDate, String memName, String memEmail) {
		return dao.findPasswordCount(memId, birthDate, memName, memEmail);
	}

	@Override
	public void findUpdatePassword(String memId, String newPassword) {
		dao.findUpdatePassword(memId, newPassword);
	}

	@Autowired
    private JavaMailSender mailSender;
    
    public void sendMail(String to, String subject, String body) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(body, true);
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	@Override
	public void lossCountReset(String memId) {
		dao.lossCountReset(memId);
	}

}

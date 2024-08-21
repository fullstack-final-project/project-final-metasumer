package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IMemberDAO;
import com.spring_boot_final.metasumer.model.MemberVO;

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

}

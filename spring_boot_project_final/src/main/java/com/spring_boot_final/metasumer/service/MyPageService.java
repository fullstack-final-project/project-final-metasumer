package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IMyPageDAO;
import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.model.MyPageVO;
import com.spring_boot_final.metasumer.model.ReservationListVO;

@Service
public class MyPageService implements IMyPageService {
	@Autowired
	@Qualifier("IMyPageDAO")
    IMyPageDAO dao;
	
	@Autowired
	PasswordEncoder pwdEncoder;

	@Override
	public ArrayList<MyPageVO> MyFishRecordsList(String memId) {
		return dao.MyFishRecordsList(memId);
	}

	@Override
	public ArrayList<MyPageVO> MyFishRecordsPerPage(String memId, int offset, int limit) {
		return dao.MyFishRecordsPerPage(memId, offset, limit);
	}
	
	@Override
	public int getRecordsCount(String memId) {
		return dao.getRecordsCount(memId);
	}

	@Override
	public String getFishNoByName(String fishName) {
		return dao.getFishNoByName(fishName);
	}

	@Override
	public Integer getTideScore(String fishNo, String tide) {
		return dao.getTideScore(fishNo, tide);
	}

	@Override
	public Integer getLocationScore(String fishNo, String location) {
		return dao.getLocationScore(fishNo, location);
	}

	@Override
	public Integer getWeatherScore(String fishNo, String weather) {
		return dao.getWeatherScore(fishNo, weather);
	}

	@Override
	public Integer getSkillScore(String skill) {
		return dao.getCommonScore("4", skill);
	}

	@Override
	public Integer getFortuneScore(String fortune) {
		return dao.getCommonScore("5", fortune);
	}

	@Override
	public Integer getCommonScore(String importanceCtgId, String commonValue) {
		return dao.getCommonScore(importanceCtgId, commonValue);
	}

	@Override
	public MemberVO getMemberInfo(String memId) {
		return dao.getMemberInfo(memId);
	}

	@Override
	public String passwordCheck(HashMap<String, Object> map) {
        String encodedPwd = dao.passwordCheck(map);
              
	    String result = "fail";
	    
	    if (encodedPwd != null && pwdEncoder.matches((String)map.get("pwd"), encodedPwd)) {
	        result = "success";
	    }
	    
	    return result;
	}

	@Override
	public boolean updateMemberInfo(HashMap<String, Object> map) {
		boolean result = dao.updateMemberInfo(map);
	    
	    return result;
	}

	@Override
	public ArrayList<ReservationListVO> reservationList(String memId, String startDate, String endDate) {
		return dao.reservationList(memId, startDate, endDate);
	}

}

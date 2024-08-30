package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.ISafetyInfoDAO;
import com.spring_boot_final.metasumer.model.SafetyInfoVO;
import com.spring_boot_final.metasumer.model.SafetyTelVO;

@Service
public class SafetyInfoService implements ISafetyInfoService {
	
	@Autowired
	@Qualifier("ISafetyInfoDAO")
	ISafetyInfoDAO dao;

	@Override
	public ArrayList<SafetyInfoVO> listAllSafetyInfo() {
		// 안전정보 리스트 조회
		return dao.listAllSafetyInfo();
	}

	@Override
	public ArrayList<SafetyTelVO> listAllSafetyTel() {
		// 비상연락처 리스트 조회
		return dao.listAllSafetyTel();
	}

}

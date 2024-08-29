package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.SafetyInfoVO;
import com.spring_boot_final.metasumer.model.SafetyTelVO;

public interface ISafetyInfoService {
	// 안전정보 리스트 조회
	public ArrayList<SafetyInfoVO> listAllSafetyInfo();
	
	// 비상연락처 리스트 조회
	public ArrayList<SafetyTelVO> listAllSafetyTel();

}

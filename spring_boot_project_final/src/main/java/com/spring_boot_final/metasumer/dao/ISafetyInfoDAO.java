package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.SafetyInfoVO;
import com.spring_boot_final.metasumer.model.SafetyTelVO;

public interface ISafetyInfoDAO {
	// 안전정보 리스트 조회
	public ArrayList<SafetyInfoVO> listAllSafetyInfo();
	
	// 비상연락처 리스트 조회
	public ArrayList<SafetyTelVO> listAllSafetyTel();
}

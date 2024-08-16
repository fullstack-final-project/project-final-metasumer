package com.spring_boot_final.metasumer.dao;

import java.util.HashMap;
import java.util.Map;

public interface ITestDAO {
	
	// 로그인 체크
	public String loginCheck(HashMap<String, Object> map);

	// 사용자 이름을 반환
	public Map<String, Object> getUsermemNickname(String memId);


}

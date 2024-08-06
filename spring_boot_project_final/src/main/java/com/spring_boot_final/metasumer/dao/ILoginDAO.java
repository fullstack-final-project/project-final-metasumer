package com.spring_boot_final.metasumer.dao;

import java.util.HashMap;

public interface ILoginDAO {
	
	// 로그인 체크
	public String loginCheck(HashMap<String, Object> map);

	// 사용자 이름을 반환
	public String getUsermemNickname(String memId);


}

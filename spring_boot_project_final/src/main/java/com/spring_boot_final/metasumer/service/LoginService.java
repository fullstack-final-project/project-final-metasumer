package com.spring_boot_final.metasumer.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.ILoginDAO;

@Service
public class LoginService implements ILoginService {

	@Autowired
	@Qualifier("ILoginDAO")
	ILoginDAO dao;

	@Override
	public String loginCheck(HashMap<String, Object> map) {
		return dao.loginCheck(map);
	}

	public String getUsermemNickname(String memId) {
		return dao.getUsermemNickname(memId);
	}

}

package com.spring_boot_final.metasumer.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.ITestDAO;

@Service
public class TestService implements ITestService {

	@Autowired
	@Qualifier("ITestDAO")
	ITestDAO dao;

	@Override
	public String loginCheck(HashMap<String, Object> map) {
		return dao.loginCheck(map);
	}

	public String getUsermemNickname(String memId) {
		return dao.getUsermemNickname(memId);
	}

}

package com.spring_boot_final.metasumer.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IAdminDAO;
import com.spring_boot_final.metasumer.model.BusinessAuthVO;
import com.spring_boot_final.metasumer.model.FreeBoardVO;
import com.spring_boot_final.metasumer.model.MemberVO;

@Service
public class AdminService implements IAdminService {

	@Autowired
	@Qualifier("IAdminDAO")
	IAdminDAO dao;

	@Override
	public void updateMemberStatus(String memId, String status) {
		dao.updateMemberStatus(memId, status);

	}

	@Override
	public int countBusinessAuth() {
		return dao.countBusinessAuth();
	}

	@Override
	public ArrayList<BusinessAuthVO> getPendingBusinessAuth(int start, int pageSize, String authStatus) {
		return dao.getPendingBusinessAuth(start, pageSize, authStatus);
	}

	@Override
	public void updateAuthStatus(int bizId, String authStatus) {
		dao.updateAuthStatus(bizId, authStatus);
		
	}

	@Override
	public void updateMemberType(String memId, String memType) {
		dao.updateMemberType(memId, memType);
	}

	@Override
	public ArrayList<MemberVO> memberList(String memType, int offset, int limit) {
		return dao.memberList(memType, offset, limit);
	}

	@Override
	public int countMembers(String memType) {
		return dao.countMembers(memType);
	}

	@Override
	public int getTotalBusinessAuthCount() {
		return dao.getTotalBusinessAuthCount();
	}

	@Override
	public ArrayList<BusinessAuthVO> businessList(int offset, int limit) {
		return dao.businessList(offset, limit);
	}

	@Override
	public int countbusiness() {
		return dao.countbusiness();
	}

	@Override
	public ArrayList<MemberVO> memberDetail(String memId) {
		return dao.memberDetail(memId);
	}

	@Override
	public ArrayList<BusinessAuthVO> businessDetail(String memId, String bizId) {
		return dao.businessDetail(memId, bizId);
	}

	@Override
	public ArrayList<FreeBoardVO> getPostsList(Integer boardCategory, LocalDate startDate,LocalDate endDate, int size, int offset) {
		return dao.getPostsList(boardCategory, startDate, endDate, size, offset);
	}

	@Override
	public int getPostsCount(Integer boardCategory, LocalDate startDate, LocalDate endDate) {
		return dao.getPostsCount(boardCategory, startDate, endDate);
	}

	@Override
	public void updatePostStatus(int boardPostNo, String status) {
		dao.updatePostStatus(boardPostNo, status);
	}

	@Override
	public void updateMyFishRecordsPostStatus(int recordNo, String status) {
		dao.updateMyFishRecordsPostStatus(recordNo, status);
	}

	@Override
	public List<Map<String, Object>> getTopMembersByLoginCount() {
		return dao.getTopMembersByLoginCount();
	}

	@Override
	public List<Map<String, Object>> getPostCount() {
		return dao.getPostCount();
	}

	@Override
	public List<Map<String, Object>> getTopPostsCount() {
		return dao.getTopPostsCount();
	}

	
	

}

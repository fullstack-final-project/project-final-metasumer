package com.spring_boot_final.metasumer.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_final.metasumer.model.BusinessAuthVO;
import com.spring_boot_final.metasumer.model.FreeBoardVO;
import com.spring_boot_final.metasumer.model.MemberVO;

public interface IAdminDAO {
	
	// memType으로 회원 조회해서 가져오기
	public ArrayList<MemberVO> memberList(String memType, int offset, int limit);
	public int countMembers(String memType);

	// 사업자 리스트 조회
	public ArrayList<BusinessAuthVO> businessList(int offset, int limit);
	public int countbusiness();
	
	// 회원 비활성화 하기
	public void updateMemberStatus(String memId, String status);
	
	// 사업자 회원 신청 카운트
	public int countBusinessAuth();
	
	// 사업자 신청 조회
	public ArrayList<HashMap<String, Object>> getPendingBusinessAuth(int start, int pageSize, String authStatus);
	public int getTotalBusinessAuthCount();
	
	// authStatus 상태 바꾸기
	public void updateAuthStatus(int bizId, String authStatus);
	
	// member 테이블에서 memType 업데이트
    public void updateMemberType(String memId, String memType);
    
    // 일반, 관리자 상세 페이지 정보
    public ArrayList<MemberVO> memberDetail(String memId);
    
    // 사업자 상세 페이지 정보
    public ArrayList<BusinessAuthVO> businessDetail(String memId, String bizId);
    
    // 게시물 관리
    public ArrayList<FreeBoardVO> getPostsList(LocalDate startDate, LocalDate endDate, int size, int offset);
    public int getPostsCount(LocalDate startDate, LocalDate endDate);

}

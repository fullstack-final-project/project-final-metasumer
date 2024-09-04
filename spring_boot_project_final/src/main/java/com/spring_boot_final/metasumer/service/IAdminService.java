package com.spring_boot_final.metasumer.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring_boot_final.metasumer.model.BusinessAuthVO;
import com.spring_boot_final.metasumer.model.FreeBoardVO;
import com.spring_boot_final.metasumer.model.MemberVO;

public interface IAdminService {

	// memType으로 회원 조회해서 가져오기
	public ArrayList<MemberVO> memberList(String memType, int offset, int limit);

	public int countMembers(String memType);

	// 사업자 리스트 조회
	public ArrayList<BusinessAuthVO> businessList(int offset, int limit);

	public int countbusiness();

	// 회원 활성화/비활성화 하기
	public void updateMemberStatus(String memId, String status);

	// 사업자 회원 신청 카운트
	public int countBusinessAuth();

	// 사업자 신청 조회
	public ArrayList<BusinessAuthVO> getPendingBusinessAuth(int start, int pageSize, String authStatus);

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
	public ArrayList<FreeBoardVO> getPostsList(Integer boardCategory, LocalDate startDate, LocalDate endDate, int size,
			int offset);

	public int getPostsCount(Integer boardCategory, LocalDate startDate, LocalDate endDate);

	// 게시판 글 비활성화 하기
	public void updatePostStatus(int boardPostNo, String status);

	public void updateMyFishRecordsPostStatus(int recordNo, String status);

	// 회원 활동량 TOP10
	public List<Map<String, Object>> getTopMembersByLoginCount();

	// 2주간 게시판 게시물, 댓글 통계
	public List<Map<String, Object>> getPostCount();

	// 2주간 게시물 중에 조회수/댓글 수 통계 TOP10
	public List<Map<String, Object>> getTopPostsCount();
}

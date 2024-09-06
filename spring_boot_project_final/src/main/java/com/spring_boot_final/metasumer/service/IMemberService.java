package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring_boot_final.metasumer.model.BusinessAuthVO;
import com.spring_boot_final.metasumer.model.MemberVO;

public interface IMemberService {

	// 로그인 체크
	public String loginCheck(HashMap<String, Object> map);

	// 로그인 카운트
	public void loginCount(String memId);

	// 사용자 이름을 반환
	public Map<String, Object> getUsermemNickname(String memId);

	// id 중복확인
	public int memIdCheck(String memId);

	// 로그인 실패 시
	public void loginLoss(String memId);

	// 로그인 실패 횟수 조회
	public int getLossCount(String memId);

	// 로그인 시 실패 횟수 리셋
	public void lossCountReset(String memId);

	// 로그인 5회 실패시
	public void updateLossStatus(String memId);

	// 회원가입
	public void insertMember(MemberVO vo);

	// email 중복확인
	public int memNicknameCheck(String memNickname);

	// 관심사 태그 목록 가져오기
	public ArrayList<MemberVO> tagList();

	public ArrayList<MemberVO> categoryList();

	// 관심사 태그 저장
	public void saveInterests(String memId, List<String> tagIds);

	// 사용자 관심사 태그 조회
	public ArrayList<MemberVO> userTagList(String memId);

	// 사용자 관심사 있는거 빼고 태그 가져오기
	public ArrayList<MemberVO> newtagList(String memId);

	
	// 관심사 태그 삭제
	public void deleteInterests(String memId);

	// 사업자 신청 등록
	public void insertBusinessAuth(BusinessAuthVO vo);

	// 사업자 신청 시 아이디/검토중 확인
	public int checkMemId(String memId);

	// 아이디 찾기
	public String findId(String memName, String birthDate, String memHP, String memEmail);

	// 비밀번호 찾기
	public int findPasswordCount(String memId, String birthDate, String memName, String memEmail);

	public void findUpdatePassword(String memId, String newPassword);
}

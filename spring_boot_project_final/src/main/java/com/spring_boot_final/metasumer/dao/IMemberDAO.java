package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring_boot_final.metasumer.model.MemberVO;

public interface IMemberDAO {
	
	// 로그인 체크
	public String loginCheck(HashMap<String, Object> map);

	// 사용자 닉네임을 반환
	public Map<String, Object> getUsermemNickname(String memId);
	
	// id 중복확인
	public int memIdCheck(String memId);
	
	//회원가입
	public void insertMember(MemberVO vo);
	
	// Nickname 중복확인
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
	
	// 회원정보 조회
	public MemberVO getMemberById(String memId);
	
}

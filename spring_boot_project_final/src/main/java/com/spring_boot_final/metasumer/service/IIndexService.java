package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.BusinessVO;
import com.spring_boot_final.metasumer.model.MyFishRecordsVO;

public interface IIndexService {
	
	// 전체 회원 기록 불러오기 (index 페이지에서 이용) : 크기순으로 나열
	public ArrayList<MyFishRecordsVO> listBestMemFishRecords();
	
	// 베스트 업체 리스크 불러오기 : 임의로 선정
	public ArrayList<BusinessVO> listBestBusinessRank();
	
	
}

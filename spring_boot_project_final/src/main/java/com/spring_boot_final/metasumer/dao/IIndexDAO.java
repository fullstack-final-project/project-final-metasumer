package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.BusinessVO;
import com.spring_boot_final.metasumer.model.MyFishRecordsVO;

public interface IIndexDAO {

	// 전체 회원 기록 불러오기 : 크기순으로 나열
	public ArrayList<MyFishRecordsVO> listBestMemFishRecords();
	
	// 베스트 업체 리스크 불러오기 : 임의로 선정
	public ArrayList<BusinessVO> listBestBusinessRank();
}

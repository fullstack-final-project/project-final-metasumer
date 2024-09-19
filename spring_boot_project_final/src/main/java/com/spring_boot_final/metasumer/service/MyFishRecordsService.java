package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IMyFishRecordsDAO;
import com.spring_boot_final.metasumer.model.MyFishRecordsVO;

@Service
public class MyFishRecordsService implements IMyFishRecordsService {

	@Autowired
	@Qualifier("IMyFishRecordsDAO")
	IMyFishRecordsDAO dao;

	@Override
	public ArrayList<MyFishRecordsVO> listAllMyFishRecords() {
		return dao.listAllMyFishRecords();
	}

	@Override
	public int insertMyFishRecords(MyFishRecordsVO vo) {
		dao.insertMyFishRecords(vo);
		int recordNo = Integer.parseInt(vo.getRecordNo());
		return recordNo;
	}

	@Override
	public void updateMyFishRecords(MyFishRecordsVO vo) {
		dao.updateMyFishRecords(vo);

	}

	@Override
	public void deleteMyFishRecords(String recordNo) {
		dao.deleteMyFishRecords(recordNo);

	}

	@Override
	public MyFishRecordsVO detailViewMyFishRecords(String recordNo) {
		return dao.detailViewMyFishRecords(recordNo);
	}

	@Override
	public ArrayList<MyFishRecordsVO> MyFishRecordsSearch(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<MyFishRecordsVO> MyFishRecordsList(String memId) {
		return dao.MyFishRecordsList(memId);
	}

	@Override
	public void deleteMyFishRecordsComment(String recordNo) {
		dao.deleteMyFishRecordsComment(recordNo);
	}

	@Override
	public void countViews(String recordNo, String sidmemId) {
		dao.countViews(recordNo, sidmemId);
		
	}

	@Override
	public ArrayList<MyFishRecordsVO> detailViewTagList(String recordNo, int boardCtgId) {
		return dao.detailViewTagList(recordNo, boardCtgId);
	}

	@Override
	public void myFishRecordsDeleteTags(String recordNo, String typeNo) {
		dao.myFishRecordsDeleteTags(recordNo, typeNo);
	}

	@Override
	public void myFishRecordsUpdateTags(String recordNo, String typeNo, List<String> tagId, String memId) {
		dao.myFishRecordsUpdateTags(recordNo, typeNo, tagId, memId);
	}

}

package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IIndexDAO;
import com.spring_boot_final.metasumer.model.BusinessVO;
import com.spring_boot_final.metasumer.model.MyFishRecordsVO;

@Service
public class IndexService implements IIndexService {
	
	@Autowired
	@Qualifier("IIndexDAO")
	IIndexDAO dao;
	
	@Override
	public ArrayList<MyFishRecordsVO> listBestMemFishRecords() {
		return dao.listBestMemFishRecords();
	}

	@Override
	public ArrayList<BusinessVO> listBestBusinessRank() {
		return dao.listBestBusinessRank();
	}

}

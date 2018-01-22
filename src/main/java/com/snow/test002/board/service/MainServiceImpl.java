package com.snow.test002.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.snow.test002.board.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Resource(name="mainDAO")
	private MainDAO mainDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return mainDAO.selectBoardList(map);
	}

	@Override
	public int insertBoard(Map<String, Object> map) throws Exception {
		return mainDAO.insertBoard(map);
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
		mainDAO.updateHitCnt(map);
	    Map<String, Object> resultMap = mainDAO.selectBoardDetail(map);
	    return resultMap;
	}

	@Override
	public int updateBoard(Map<String, Object> map) {
		return mainDAO.updateBoard(map);
	}

}

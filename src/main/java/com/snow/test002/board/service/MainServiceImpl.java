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

}

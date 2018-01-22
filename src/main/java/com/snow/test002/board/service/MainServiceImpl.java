package com.snow.test002.board.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.snow.test002.board.controller.MainController;
import com.snow.test002.board.dao.MainDAO;
import com.snow.test002.common.FileUtils;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Resource(name="mainDAO")
	private MainDAO mainDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return mainDAO.selectBoardList(map);
	}

	@Override
	public int insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		int nRet = mainDAO.insertBoard(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
        for(int i=0, size=list.size(); i<size; i++){
        	mainDAO.insertFile(list.get(i));
        }


출처: http://addio3305.tistory.com/83?category=772645 [흔한 개발자의 개발 노트]

		return nRet;
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

	@Override
	public int deleteBoard(Map<String, Object> map) {
		return mainDAO.deleteBoard(map);
	}

}

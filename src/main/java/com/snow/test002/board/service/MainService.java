package com.snow.test002.board.service;

import java.util.List;
import java.util.Map;

public interface MainService {
	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
	int insertBoard(Map<String, Object> map) throws Exception;
}

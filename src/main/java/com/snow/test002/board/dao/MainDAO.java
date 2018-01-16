package com.snow.test002.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.snow.test002.common.dao.AbstractDAO;

@Repository("mainDAO")
public class MainDAO  extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("myDb.selectBoardList", map);
	}
}

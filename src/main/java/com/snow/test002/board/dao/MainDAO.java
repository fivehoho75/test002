package com.snow.test002.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.snow.test002.common.dao.AbstractDAO;

@Repository("mainDAO")
public class MainDAO  extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("main.selectBoardList", map);
	}

	public int insertBoard(Map<String, Object> map) {
		return insert("main.insertBoard", map);
	}

	public int updateHitCnt(Map<String, Object> map) {
		return update("main.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("main.selectBoardDetail", map);
	}

	public int updateBoard(Map<String, Object> map) {
		return update("main.updateBoard", map);
	}

	public int deleteBoard(Map<String, Object> map) {
		return update("main.deleteBoard", map);
	}

	public void insertFile(Map<String, Object> map) {
		insert("main.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("main.selectFileList", map);
	}
}

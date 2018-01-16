package com.snow.test002.common.dao;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class AbstractDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insert(String queryId, Object params){
        return sqlSession.insert(queryId, params);
    }
     
    public int update(String queryId, Object params){
        return sqlSession.update(queryId, params);
    }
     
    public int delete(String queryId, Object params){
        return sqlSession.delete(queryId, params);
    }

	public Object selectOne(String queryId){
		return sqlSession.selectOne(queryId);
	}
	
	public Object selectOne(String queryId, Object params){
		return sqlSession.selectOne(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String str){
		return sqlSession.selectList(str);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String str, Object params){
		return sqlSession.selectList(str,params);
	}
}

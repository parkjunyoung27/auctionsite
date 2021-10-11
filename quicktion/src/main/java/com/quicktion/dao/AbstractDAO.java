package com.quicktion.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.quicktion.dto.BoardDTO;


public class AbstractDAO	{
	protected Log log = LogFactory.getLog(AbstractDAO.class);

	@Autowired
	private	SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String queryId){
		if(log.isDebugEnabled()){
			log.debug("\t QueryId \t: " + queryId);
		}
	}
	
	public List<HashMap<String, Object>> selectList(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
	
	public List<Map<String, Object>> selectList(String queryId, Map<String, Object> map){
		return sqlSession.selectList(queryId, map);
	}
	
	public Map<String, Object> selectOne(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		return sqlSession.selectOne(queryID, map);
	}
	
}
package com.quicktion.dao;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


public class AbstractDAO	{
	protected Log log = LogFactory.getLog(AbstractDAO.class);

	@Autowired
	private	SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String queryId){
		if(log.isDebugEnabled()){
			log.debug("\t	QueryId	\t:	" + queryId);
		}
	}
	
	@SuppressWarnings("rawtypes")
	public List	selectList(String queryId) {
		printQueryId(queryId);
		return	sqlSession.selectList(queryId);
	}
}
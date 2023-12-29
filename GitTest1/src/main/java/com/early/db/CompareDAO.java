package com.early.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.early.model.CompareVO;

public class CompareDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<CompareVO> getCompare(String income){
		
		SqlSession sqlSession = factory.openSession(true);
		
		List<CompareVO> list = sqlSession.selectList("com.early.db.mapMapper.getCompare", income);
		
		sqlSession.close();
		return list;
	}
}

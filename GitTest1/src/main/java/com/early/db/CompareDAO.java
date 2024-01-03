package com.early.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.early.model.CompareVO;

public class CompareDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<CompareVO> getCompareincome(String total){
		
		SqlSession sqlSession = factory.openSession(true);
		
		List<CompareVO> list = sqlSession.selectList("com.early.db.mapMapper.getCompare", total);
		
		sqlSession.close();
		return list;
	}
	public List<CompareVO> getCompareincome(int total_money){
		System.out.println("여기?#33");
		SqlSession sqlSession = factory.openSession(true);
		
		List<CompareVO> list = sqlSession.selectList("getCompare2", total_money);
		System.out.println("여기가?"+list);
		sqlSession.close();
		return list;
	}

}

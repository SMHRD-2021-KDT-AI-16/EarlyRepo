package com.early.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.early.model.ApartVO;
import com.early.model.SearchApartVO;



public class ApartDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<ApartVO> getApart(String name) {
		
		SqlSession sqlSession = factory.openSession(true);
		
		List<ApartVO> list = sqlSession.selectList("com.early.db.mapMapper.getApart", name);
		
		sqlSession.close();
		return list;
	}
	
	public List<SearchApartVO> getApartSearch(String name){
		SqlSession sqlSession = factory.openSession(true);
		
		List<SearchApartVO> list = sqlSession.selectList("com.early.db.mapMapper.getApartSearch", name);
		
		sqlSession.close();
		
		return list;
	}
}

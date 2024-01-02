package com.early.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.early.model.ApartVO;
import com.early.model.LoanNameVO;
import com.early.model.LoanVO;
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
	
	public List<LoanNameVO> SelectLoans(LoanVO vo) {
		SqlSession sqlSession = factory.openSession();
		System.out.println("test222 : "+vo);
		List<LoanNameVO> loans = sqlSession.selectList("com.early.db.mapMapper.SelectLoans", vo);
		System.out.println("test333 : "+loans.get(0).getLOAN_NAME());
		
		sqlSession.close();
		
		return loans;
	}

	public List<ApartVO> SelectPrice() {
		SqlSession sqlSession = factory.openSession();
		List<ApartVO> avos = sqlSession.selectList("com.early.db.mapMapper.SelectPrice"); 
		sqlSession.close();
		
		return avos;
		
	}
	
	


}

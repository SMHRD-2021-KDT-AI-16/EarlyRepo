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
		//System.out.println("이름 들어옴?"+name);
		
		List<ApartVO> list = sqlSession.selectList("com.early.db.mapMapper.getApart", name);
		//ApartVO test = sqlSession.selectOne("com.early.db.mapMapper.getApart2", name);
		//System.out.println("여기까지 들어옴22?");
		//System.out.println("list : "+list.get(0).getApt_loc());
		//System.out.println("test : "+test);
		
		sqlSession.close();
		return list;
	}
	
	public List<SearchApartVO> getApartSearch(String name){
		SqlSession sqlSession = factory.openSession(true);
		List<SearchApartVO> list = sqlSession.selectList("com.early.db.mapMapper.getApartSearch", name);
		
			System.out.println("주소값 : "+list.get(0).getApt_name());
		
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


}

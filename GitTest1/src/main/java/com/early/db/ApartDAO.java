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
		
		//sqlSession --> DB와 연결 되는 통로를 만들 것이다!
		SqlSession sqlSession = factory.openSession(true);
		//통로를통해  "com.early.db.mapMapper.getApart"에 있는 쿼리문을  실행 시키겠다!
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
		
		sqlSession.close();
		
		return loans;
	}

	public List<ApartVO> SelectPrice() {
		SqlSession sqlSession = factory.openSession();
		List<ApartVO> avos = sqlSession.selectList("com.early.db.mapMapper.SelectPrice"); 
		sqlSession.close();
		
		return avos;
		
	}

	public int deletereview(String user_id) {
		SqlSession session = factory.openSession(true);
		System.out.println("test2 : "+user_id);
		
		int cnt = session.delete("deletereview", user_id);
		System.out.println("암ㄴ어ㅏㅁㄴㅇ");
		System.out.println("cnt출력:" + cnt);

		session.close();

		return cnt;
		
	}
	
	


}

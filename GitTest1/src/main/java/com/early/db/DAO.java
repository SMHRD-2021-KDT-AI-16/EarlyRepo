package com.early.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.early.db.SqlSessionManager;
import com.early.model.MemberVO;

public class DAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public int join(MemberVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int row = sqlSession.insert("join", vo);
		sqlSession.close();
		return row;
	}

	public MemberVO login(MemberVO vo) {
		SqlSession sqlsession = factory.openSession();
		
		MemberVO result =sqlsession.selectOne("login", vo);
		
		sqlsession.close();
		
		return result;
	}

	public boolean idCheck(String inputE) {
		boolean checkE = false;
		SqlSession sqlSession = factory.openSession(true);
		
		try {
		checkE = sqlSession.selectOne("idCheck", inputE);
		}catch(Exception e) {
			
		}finally {
			sqlSession.close();
		}
		
		return checkE;
	}
}

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

		MemberVO result = sqlsession.selectOne("login", vo);

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

	public int update(MemberVO vo) {
		// 1. 연결객체 빌려오기
		SqlSession sqlSession = factory.openSession(true);

		// 2. 연결객체 사용하기
		int row = sqlSession.update("update", vo);

		// 3. 연결객체 반납하기
		sqlSession.close();

		// 4. 결과 반환하기
		return row;

	}

	public int deleteMember(String id) {
		// 메세지 전체 삭제

		SqlSession session = factory.openSession(true);

		int cnt = session.delete("deleteMember", id);
		session.close();

		return cnt;
	}


}

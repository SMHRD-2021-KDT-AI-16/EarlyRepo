package com.early.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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
		} catch (Exception e) {
		} finally {
			sqlSession.close();
		}
		return checkE;
	}

	public int update(MemberVO vo) {
		SqlSession sqlSession = factory.openSession(true);

		int row = sqlSession.update("update", vo);

		sqlSession.close();

		return row;
	}

	public int deleteMember(String user_id) {
		
		SqlSession session = factory.openSession(true);
		
		int cnt = session.delete("deleteMember", user_id);
		
		session.close();

		return cnt;
	}

	public List<MemberVO> selectAll() {
		SqlSession sqlSession = factory.openSession();

		List<MemberVO> resultlist = sqlSession.selectList("selectAll");

		sqlSession.close();

		return resultlist;
	}

	

}

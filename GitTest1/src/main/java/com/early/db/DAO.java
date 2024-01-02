package com.early.db;

import java.util.List;

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
		
		System.out.println("id는 :" + vo.getUser_id());
		System.out.println("pw는 :" + vo.getUser_pw());

		MemberVO result = sqlsession.selectOne("login", vo);

		System.out.println("결과 : " + result);
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
		// 1. 연결객체 빌려오기
		SqlSession sqlSession = factory.openSession(true);

		// 2. 연결객체 사용하기
		int row = sqlSession.update("update", vo);

		// 3. 연결객체 반납하기
		sqlSession.close();

		// 4. 결과 반환하기
		return row;
	}

	public int deleteMember(String user_id) {
		
		SqlSession session = factory.openSession(true);
		System.out.println("test2 : "+user_id);
		
		int cnt = session.delete("deleteMember", user_id);
		System.out.println("암ㄴ어ㅏㅁㄴㅇ");
		System.out.println("cnt출력:" + cnt);

		session.close();

		return cnt;
	}

	public List<MemberVO> selectAll() {
		// 1. 연결객체 빌려오기
		SqlSession sqlSession = factory.openSession();

		// 2. 연결객체 사용하기
		List<MemberVO> resultlist = sqlSession.selectList("selectAll");

		// 3. 연결객체 반납하기
		sqlSession.close();

		// 4. 결과값 반환
		return resultlist;
	}

	

}

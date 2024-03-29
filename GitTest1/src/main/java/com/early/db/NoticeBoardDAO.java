package com.early.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.early.model.NoticeBoardVO;

public class NoticeBoardDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public List<NoticeBoardVO> getContents(String loc) { // 조회
		SqlSession session = factory.openSession();

		List<NoticeBoardVO> list = session.selectList("getAllBoard", loc);

		session.close();

		return list;
	}

	public int insertContent(NoticeBoardVO nvo) { // 작성
		SqlSession session = factory.openSession(true);

		int cnt = session.insert("writeBoard", nvo);

		session.close();

		return cnt;
	}

	public List<NoticeBoardVO> getIdContents(String user_id) { // ID에 맞는 조회
		SqlSession session = factory.openSession();

		List<NoticeBoardVO> list = session.selectList("getIdBoard", user_id);
		session.close();

		return list;
	}

	public int likesUp(NoticeBoardVO nvo) {
		SqlSession session = factory.openSession(true);

		int row = session.insert("likesUp", nvo);
		if (row > 0) {
		}
		session.close();

		return row;
	}

	public List<NoticeBoardVO> getAllBoard() {
		SqlSession session = factory.openSession();

		List<NoticeBoardVO> list = session.selectList("getBoardALL");
		session.close();

		return list;
	}

	public List<NoticeBoardVO> getlikeBoard() {
		SqlSession session = factory.openSession();

		List<NoticeBoardVO> list = session.selectList("getliketop");

		session.close();

		return list;

	}

	public int deleteboard(String user_id) {
		SqlSession session = factory.openSession(true);
		
		int cnt = session.delete("deleteboard", user_id);
		

		session.close();

		return cnt;
		
	}

	public int deletecomment(String user_id) {
		SqlSession session = factory.openSession(true);
		
		int cnt = session.delete("deletecomment", user_id);
		
		session.close();

		return cnt;
		
	}

	public boolean deleteeach(int f_seq) {
		SqlSession session = factory.openSession(true);
		
		session.delete("deleteboard", f_seq);

		session.close();
		return true;
		
	}
}

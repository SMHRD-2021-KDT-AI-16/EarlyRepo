package com.early.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.early.model.NoticeBoardVO;

public class NoticeBoardDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<NoticeBoardVO> getContents(String loc) { // 조회
		SqlSession session = factory.openSession();
		
		List<NoticeBoardVO> list =session.selectList("getAllBoard", loc);
		
		session.close();
		
		return list;
	}
	
	public int insertContent(NoticeBoardVO nvo) { // 작성
		SqlSession session = factory.openSession(true);
		
		int cnt = session.insert("writeBoard", nvo);
		
		session.close();
		
		return cnt;
	}
	
	public void delectContent() { // 삭제
		
	}
	
	public void updateContent() { // 글 수정
		
	}
	
	public int likesUp(NoticeBoardVO nvo) {
		SqlSession session = factory.openSession(true);
		
		int row = session.insert("likesUp", nvo);
		if(row >0) {
			System.out.println("업데이트 성공인데 웨?");
		}
		session.close();
		
		return row;
	}

	public List<NoticeBoardVO> getAllBoard() {
		SqlSession session = factory.openSession();
		
		List<NoticeBoardVO> list =session.selectList("getBoardALL");
		
		session.close();
		
		return list;
	}
	
	public List<NoticeBoardVO> getlikeBoard() {
		SqlSession session = factory.openSession();
		
		List<NoticeBoardVO> list = session.selectList("getliketop");
		// System.out.println(list.get(0).getF_likes());
		session.close();
		
		return list;	
	}
}

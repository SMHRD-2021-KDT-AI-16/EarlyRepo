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
}

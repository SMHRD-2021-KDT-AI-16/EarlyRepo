package com.early.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.early.model.NoticeBoardVO;

public class NoticeBoardDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<NoticeBoardVO> getContents(String loc) { // 조회
		SqlSession session = factory.openSession();
		// 무슨 동인지 받아왔기 때문에 이걸 아파트 코드로 교환하는 부분이 있어야함
		// 생각해보니 지금 지역누르고 게시판 눌러서 들어옴
		// db에 지역 게시판인데 지역이 없음
		
		List<NoticeBoardVO> list =session.selectList("getAllBoard", loc);
		//System.out.println(list.get(0).getF_content());
		
		session.close();
		
		return list;
	}
	
	public void insertContent() { // 작성
		
	}
	
	public void delectContent() { // 삭제
		
	}
	
	public void updateContent() { // 글 수정
		
	}
}

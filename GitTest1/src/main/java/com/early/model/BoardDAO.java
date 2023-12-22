package com.early.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.early.db.SqlSessionManager;

public class BoardDAO {
	SqlSessionFactory sqlSessionFactory2 = SqlSessionManager.getFactory();
	SqlSession sqlSession2 = sqlSessionFactory2.openSession();
	
	// 게시글 전체 조회
	public List<boardVO> allBoard(){
		List<boardVO> boards = null;
		System.out.println("test2 test2");
		
		try {
			System.out.println("웨않뎀?");
			boards = sqlSession2.selectList("allBoard");
			System.out.println("TEST TEST TEST");
		} catch (Exception e) {
			System.err.println("???");
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			sqlSession2.close();
		}
		return boards;
	}
}

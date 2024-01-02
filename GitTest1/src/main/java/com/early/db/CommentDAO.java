package com.early.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.early.model.CommentVO;


public class CommentDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public int insertComment(CommentVO cvo) {
		
		SqlSession sqlSession = factory.openSession(true);
		
		int row = sqlSession.insert("insertComment", cvo);
		
		sqlSession.close();
		
		return row;
	}
	
	public List<CommentVO> getComment(int f_seq){
		SqlSession sqlSession = factory.openSession();
		
		List<CommentVO> list = sqlSession.selectList("getcomment", f_seq);
		
		sqlSession.close();
		
		return list;
	}
}

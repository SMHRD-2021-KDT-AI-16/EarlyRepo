package com.early.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.early.model.ApartVO;



public class ApartDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<ApartVO> getApart(String name) {
		
		SqlSession sqlSession = factory.openSession(true);
		System.out.println("이름 들어옴?"+name);
		
		List<ApartVO> list = sqlSession.selectList("com.early.db.mapMapper.getApart", name);
		//ApartVO test = sqlSession.selectOne("com.early.db.mapMapper.getApart2", name);
		System.out.println("여기까지 들어옴22?");
		System.out.println("list : "+list.get(0).getApt_loc());
		//System.out.println("test : "+test);
		
		sqlSession.close();
		return list;
	}
}

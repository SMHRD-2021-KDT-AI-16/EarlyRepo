package com.early.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.early.model.ApartAllinfoVO;

public class ApartAllinfoDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<ApartAllinfoVO> getAptAllinfo(String apt_name) {
		SqlSession session = factory.openSession();
		
		List<ApartAllinfoVO> list = session.selectList("com.early.db.mapMapper.getApartinfo", apt_name);
		
		session.close();
		
		return list;
	}
	
	public List<ApartAllinfoVO> getAptreview(String apt_name) {
		SqlSession session = factory.openSession();
		
		List<ApartAllinfoVO> list = session.selectList("com.early.db.mapMapper.getAptReview", apt_name);
		session.close();
		return list;
	}
}

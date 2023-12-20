package com.early.db;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	// 고치지 말자!!!

	// Static 저장공간에 넣음으로써 무조건 먼저 실행되게 만들었다
	public static SqlSessionFactory sqlSessionFactory;

	// 생성자와 같은 역할
	// new SqlSessionManager() --> 이때 실행되는 게 생성자
	// static{} --> 가장 먼저 실행되는 코드
	// Arrays.toString();
	static {
		String resource = "com/early/db/mybatis-config.xml";
		// 1. mybatis 환경설정 파일 경로 선언
		// 파일경로가 바뀔때만 수정가능

		InputStream inputStream;
		// 2. 읽을 수 있는 통로 하나 선언
		try {
			inputStream = Resources.getResourceAsStream(resource);
			// 3. 파일을 읽어서 inputStream 생성

			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			// 4. DBCP(== sqlSessionFactory) 생성
			// Connection == sqlSession
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static SqlSessionFactory getFactory() {

		return sqlSessionFactory;

	}
}

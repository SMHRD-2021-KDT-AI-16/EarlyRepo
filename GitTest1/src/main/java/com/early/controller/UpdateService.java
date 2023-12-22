package com.early.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.DAO;
import com.early.model.MemberVO;


@WebServlet("/UpdateService")
public class UpdateService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_nick = request.getParameter("user_nick");
		
		

		// 3. 세션 영역 안에 있는 이메일 데이터 꺼내오기
		// (1) 세션 꺼내오기
		HttpSession session = request.getSession();
		// (2) 세션 영역안에 있는 member 이름표 데이터 꺼내오기
		MemberVO sessionvo = (MemberVO) session.getAttribute("member");
		// (3) email값만 꺼내오기
		sessionvo.getUser_id();

		// 4. 꺼내온 데이터 들을 하나로 묶어주기
		MemberVO vo = new MemberVO();
		
		vo.setUser_pw(user_pw);
		vo.setUser_nick(user_nick);
	

		// 5. DAO 생성하기
		DAO dao = new DAO();

		// 6. dao, update 기능 사용하기
		int row = dao.update(vo);
		System.out.println("업데이트 : "+row);

		// 7. 수정 성공했다면, session영역 안에 있는 데이터 변경(수정)
		if (row > 0) {
		
			// sessionVO 영역 안에 있는 데이터 변경 방식 사용
			sessionvo.setUser_pw(user_pw);
			sessionvo.setUser_nick(user_nick);
			
			
		}
		return "redirect:/GoMain.do";

	}

		
	
	
}
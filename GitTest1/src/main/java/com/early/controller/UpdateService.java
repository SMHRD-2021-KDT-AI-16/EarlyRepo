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
		// 2. 요청 데이터 꺼내오기(3개)
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		

		// 3. 세션 영역 안에 있는 이메일 데이터 꺼내오기
		// (1) 세션 꺼내오기
		HttpSession session = request.getSession();
		// (2) 세션 영역안에 있는 member 이름표 데이터 꺼내오기
		com.early.model.MemberVO sessionvo = (MemberVO) session.getAttribute("member");
		// (3) email값만 꺼내오기
		String id = sessionvo.getId();

		// 4. 꺼내온 데이터 들을 하나로 묶어주기
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setNick(nick);
	

		// 5. DAO 생성하기
		DAO dao = new DAO();

		// 6. dao, update 기능 사용하기
		int row = dao.update(vo);

		// 7. 수정 성공했다면, session영역 안에 있는 데이터 변경(수정)
		if (row > 0) {
			// 1. 주소값 복사하는 방식 이용
			// sessionvo = vo;

			// 2. sessionVO 영역 안에 있는 데이터 변경 방식 사용
			sessionvo.setPw(pw);
			sessionvo.setNick(nick);
			
			
		}
		return "redirect:/GoMain.do";

	}

		
	
	
}

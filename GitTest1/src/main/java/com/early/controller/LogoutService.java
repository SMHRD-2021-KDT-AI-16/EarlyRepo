package com.early.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutService
 */
@WebServlet("/LogoutService")
public class LogoutService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			// 1. 세션 꺼내오기
			HttpSession session = request.getSession();

			// 2. 세션 영역 안에 있는 모든 데이터 무효화 시키기
			session.invalidate();

			// session.removeAttribute("member"); member의 세션데이터만 지운다
			// session.invalidate(); 모든 데이터 지운다

			// 3.main.jsp로 redirect방식 이동
			return "redirect:/GoMain.do";
	
		
	}
  

}

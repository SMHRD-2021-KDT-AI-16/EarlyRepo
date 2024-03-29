package com.early.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.DAO;
import com.early.model.MemberVO;

public class LoginService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("pw");

		MemberVO vo = new MemberVO();

		vo.setUser_id(user_id);
		vo.setUser_pw(user_pw);

		DAO dao = new DAO();

		MemberVO result = dao.login(vo);

		HttpSession session = request.getSession();
		session.setAttribute("member", result);

		String responseData;
		if (result != null) {
			responseData = "success";
		} else {
			responseData = "fail";
		}
		response.getWriter().write(responseData);
		return null;

	}
}

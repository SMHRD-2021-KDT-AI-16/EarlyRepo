package com.early.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.DAO;
import com.early.model.MemberVO;

public class UpdateService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String user_pw = request.getParameter("user_pw");
		String user_nick = request.getParameter("user_nick");

		MemberVO user = (MemberVO) session.getAttribute("member");
		String user_id = user.getUser_id();

		MemberVO vo = new MemberVO();
		vo.setUser_id(user_id);
		vo.setUser_pw(user_pw);
		vo.setUser_nick(user_nick);
		DAO dao = new DAO();
		int row = dao.update(vo);
		if (row > 0) {
			user.setUser_pw(user_pw);
			user.setUser_nick(user_nick);
		}
		return "redirect:/GoMainPage.do";

	}

}

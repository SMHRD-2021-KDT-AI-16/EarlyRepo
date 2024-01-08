package com.early.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.ApartDAO;
import com.early.db.DAO;
import com.early.db.NoticeBoardDAO;
import com.early.model.MemberVO;

/**
 * Servlet implementation class DelMemberService
 */
@WebServlet("/DelMemberService")
public class DelMemberService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		MemberVO user = (MemberVO) session.getAttribute("member");
		String user_id = user.getUser_id();
		NoticeBoardDAO dao = new NoticeBoardDAO();
		ApartDAO dao2 = new ApartDAO();
		int num2 = dao.deletecomment(user_id);
		int num1 = dao.deleteboard(user_id);
		dao2.deletereview(user_id);
		int cnt = new DAO().deleteMember(user_id);
		if (cnt > 0) {
			session.invalidate();
		}
		return "redirect:/GoMainPage.do";
	}

}

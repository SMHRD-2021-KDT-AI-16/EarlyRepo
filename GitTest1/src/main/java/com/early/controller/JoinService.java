package com.early.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.early.db.DAO;
import com.early.model.MemberVO;


public class JoinService implements Command {
		
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		
		MemberVO vo = new MemberVO();
		
		vo.setId(id);
		vo.setPw(pw);
		vo.setNick(nick);
		
		DAO dao = new DAO();
		int row = dao.join(vo);
		
		if(row>0) {
			request.setAttribute("id", id);
		
			return "redirect:/GoMain.do";
		
		}else {
			
			return "redirect:/GoMain.do";
		}

		
		
		
	}

}

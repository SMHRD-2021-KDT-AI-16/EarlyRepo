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

		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_nick = request.getParameter("user_nick");
		
		MemberVO vo = new MemberVO();
		
		vo.setUser_id(user_id);
		vo.setUser_pw(user_pw);
		vo.setUser_nick(user_nick);
		
		DAO dao = new DAO();
		int row = dao.join(vo);
		
		if(row>0) {
			request.setAttribute("user_id", user_id);
		
			return "redirect:/GoWelcome.do";
		
		}else {
			
			return "redirect:/GoMainPage.do";
		}

		
		
		
	}

}

package com.early.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.model.MemberVO;

public class LoginCheckService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("member");
		if(user != null) {
			url = "Write.jsp";
		}else {
			url = "redirect:/GoMainPage.do";
		}
		
		return url;
	}

}

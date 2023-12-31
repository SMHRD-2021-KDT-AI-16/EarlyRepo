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

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("member");
		
		String responseData;
        if (user != null) {
        	responseData = "success";
        } else {
        	responseData = "fail";
        }
        response.getWriter().write(responseData);
		
		return null;
	}

}

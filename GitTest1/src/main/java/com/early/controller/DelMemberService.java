package com.early.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.early.db.DAO;

/**
 * Servlet implementation class DelMemberService
 */
@WebServlet("/DelMemberService")
public class DelMemberService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		
		int cnt = new DAO().deleteMember(id);
		if(cnt>0) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('탈퇴가 완료됐습니다'); </script>"); 
			writer.close();
		}
			
		return "redirect:/Gomain.do";
		
		
		
	}
	

}

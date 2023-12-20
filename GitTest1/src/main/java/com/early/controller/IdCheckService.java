package com.early.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.early.db.DAO;



public class IdCheckService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String inputE = request.getParameter("inputE");
		
		DAO dao = new DAO();
		boolean checkE = dao.idCheck(inputE);
		PrintWriter out;
		
		try {
			out = response.getWriter();
			out.print(checkE);
			}catch (IOException e) {
				e.printStackTrace();
			}
		return null;
	}
	
}
 

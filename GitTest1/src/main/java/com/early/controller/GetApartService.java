package com.early.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.ApartDAO;
import com.early.model.ApartVO;

public class GetApartService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String apart = request.getParameter("name");
		
		ApartDAO adao = new ApartDAO();
		
		List<ApartVO> list = adao.getApart(apart);
		HttpSession session = request.getSession();		
		
		StringBuilder plainText = new StringBuilder();
		
	    for (ApartVO item : list) {
	        plainText.append(item.getApt_loc()).append(";").append(item.getApt_name()).append(";");
	    }
		
	    session.setAttribute("apart_list", plainText.toString());
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/plain");
	    response.getWriter().write(plainText.toString());
		
		return null;
	}

}

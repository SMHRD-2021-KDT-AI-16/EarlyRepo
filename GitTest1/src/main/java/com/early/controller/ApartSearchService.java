package com.early.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.ApartDAO;

import com.early.model.SearchApartVO;


public class ApartSearchService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String aSearch = request.getParameter("name");
		
		System.out.println("aSearch : "+aSearch);
		
		ApartDAO aDao = new ApartDAO();
		
		List<SearchApartVO> list = aDao.getApartSearch(aSearch);
		
		HttpSession session = request.getSession();
		StringBuilder plainText = new StringBuilder();
		
		for(SearchApartVO item : list) {
			plainText.append(item.getApt_loc()).append(";").append(item.getApt_name()).append(";").append(item.getApt_realprice()).append(";");
		}
		session.setAttribute("apartSearch_list", plainText.toString());
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		response.getWriter().write(plainText.toString());
		
		return null;
	}

}

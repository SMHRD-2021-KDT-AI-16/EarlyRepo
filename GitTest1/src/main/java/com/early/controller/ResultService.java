package com.early.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.ApartDAO;
import com.early.db.CompareDAO;
import com.early.model.ApartVO;
import com.early.model.CompareVO;
import com.early.model.LoanNameVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;


public class ResultService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int total_money = Integer.parseInt(request.getParameter("loan_select"));
		
		
		CompareDAO cdao = new CompareDAO();
		
		List<CompareVO> list = cdao.getCompareincome(total_money);
		
		JsonArray jArray = new JsonArray();
		for (int i=0;i<list.size();i++) {
			Gson gson = new Gson();
			jArray.add(gson.toJson(list.get(i)));
		}
		
		HttpSession session = request.getSession();
		System.out.println("여기?");
		session.setAttribute("final_list", jArray);
		
		
		return "resultMap.jsp";
	}

}

package com.early.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.ApartDAO;
import com.early.model.ApartVO;
import com.early.model.LoanNameVO;


public class ResultService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		List<LoanNameVO> vos = (List<LoanNameVO>)session.getAttribute("loanVOs");
		int limit = vos.get(0).getLOAN_LIMIT();
		System.out.println("limit : "+limit);
		
		ApartDAO adao = new ApartDAO();
		List<ApartVO> vo = adao.SelectPrice();
		
		List<ApartVO> vo2 = new ArrayList<ApartVO>();
		
		for(int i=0;i<vo.size();i++) {
			if(limit>vo.get(i).getApt_realprice()) {
				vo2.add(vo.get(i));
				}
		}
		System.out.println("vo2 : "+vo2);
		session.setAttribute("vo2", vo2);
		
		// 사용자의 자산값 추가해야함
		
		return "resultMap.jsp";
	}

}

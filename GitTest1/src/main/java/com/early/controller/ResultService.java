package com.early.controller;

import java.io.IOException;
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
		
		ApartDAO adao = new ApartDAO();
		List<ApartVO> vo = adao.SelectPrice();
		
		List<ApartVO> vo2= null;
		for(int i=0;i<vo.size();i++) {
			if(limit>vo.get(i).getApt_realprice()) {
				vo2.get(i).getApt_name();
				vo2.get(i).getApt_realprice();
				vo2.get(i).getApt_loc();
			}
		}
		session.setAttribute("vo2", vo2);
		
		return null;
	}

}

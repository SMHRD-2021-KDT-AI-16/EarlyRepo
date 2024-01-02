package com.early.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.ApartDAO;
import com.early.model.LoanNameVO;
import com.early.model.LoanVO;



public class SelectLoansService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String FIRST_HOUSE_YN = request.getParameter("FIRST_HOUSE_YN");
		String DUPLICATE_YN = request.getParameter("DUPLICATE_YN");
		int MARRIAGE_YEARS = Integer.parseInt( request.getParameter("MARRIAGE_YEARS"));
		
		HttpSession session = request.getSession();
		LoanVO vo = new LoanVO();
		vo.setFIRST_HOUSE_YN(FIRST_HOUSE_YN);
		vo.setDUPLICATE_YN(DUPLICATE_YN);
		vo.setMARRIAGE_YEARS(MARRIAGE_YEARS);
		System.out.println("vo : "+vo.getFIRST_HOUSE_YN()+vo.getDUPLICATE_YN()+vo.getMARRIAGE_YEARS());
		ApartDAO dao = new ApartDAO();		
		List<LoanNameVO> loanVOs = dao.SelectLoans(vo);
		System.out.println("loanVOs : "+loanVOs);
		
		session.setAttribute("loanVOs", loanVOs);
		
		
		return "loan.jsp";
		
		
		
				

	}
}

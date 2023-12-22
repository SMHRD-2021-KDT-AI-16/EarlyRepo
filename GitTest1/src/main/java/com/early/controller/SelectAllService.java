package com.early.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.early.db.DAO;
import com.early.model.MemberVO;

@WebServlet("/SelectAllService")
public class SelectAllService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. DAO생성
		DAO dao = new DAO();

		// 2. dao.selectAll();
		// SELECT EMAIL, TEL, ADDRESS
		// WHERE EMAIL != 'admin'
		List<MemberVO> resultlist = dao.selectAll();

		// 3. 조회한 결과를 request영역에 list라는 이름으로 담아주기
		request.setAttribute("list", resultlist);

		return "select.jsp";

	}

}

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
		DAO dao = new DAO();
		List<MemberVO> resultlist = dao.selectAll();
		request.setAttribute("list", resultlist);

		return "select.jsp";

	}

}

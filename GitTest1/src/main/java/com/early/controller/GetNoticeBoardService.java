package com.early.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.NoticeBoardDAO;
import com.early.model.NoticeBoardVO;

public class GetNoticeBoardService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String loc = request.getParameter("loc");
		System.out.println("loc : "+loc);
		
		NoticeBoardDAO nbdao = new NoticeBoardDAO();
		
		List<NoticeBoardVO> list = nbdao.getContents(loc);
		System.out.println("test : "+list.get(0).getF_content());
		HttpSession session = request.getSession();
		session.setAttribute("NoticeAllboard", list);
		
		return "board123.jsp";
	}

}

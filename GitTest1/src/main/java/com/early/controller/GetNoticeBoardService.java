package com.early.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.NoticeBoardDAO;
import com.early.model.NoticeBoardVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

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
		
		JsonArray jArray = new JsonArray();
		for (int i=0;i<list.size();i++) {
			Gson gson = new Gson();
			jArray.add( gson.toJson(list.get(i)));
		}
		
		

		session.setAttribute("NoticeAllboard", jArray);
		
		return "board.jsp";
	}

}

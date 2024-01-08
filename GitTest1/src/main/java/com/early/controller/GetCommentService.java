package com.early.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.early.db.CommentDAO;
import com.early.model.CommentVO;

public class GetCommentService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int f_seq = Integer.parseInt(request.getParameter("f_seq"));
		
		CommentDAO cdao = new CommentDAO();
		
		List<CommentVO> list = cdao.getComment(f_seq);
		
		StringBuilder plainText = new StringBuilder();
		
		for(CommentVO temp : list) {
			plainText.append(temp.getUser_id()).append(";").append(temp.getCreated_at()).append(";").append(temp.getCmt_content()).append(";");
		}
		response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/plain");
	    response.getWriter().write(plainText.toString());
		
		return null;
	}
	

}

package com.early.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.CommentDAO;
import com.early.model.CommentVO;
import com.early.model.MemberVO;

public class InsertCommentService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("member");

		String user_id = user.getUser_id();
		String cmt_content = request.getParameter("cmt_content");
		int f_seq = Integer.parseInt(request.getParameter("f_seq"));
		
		CommentVO cvo = new CommentVO();
		
		cvo.setUser_id(user_id);
		cvo.setF_seq(f_seq);
		cvo.setCmt_content(cmt_content);
		
		CommentDAO cdao = new CommentDAO();
		
		cdao.insertComment(cvo);
		
		return null;
	}

}

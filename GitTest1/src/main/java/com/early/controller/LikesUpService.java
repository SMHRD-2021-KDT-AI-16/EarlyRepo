package com.early.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.early.db.NoticeBoardDAO;
import com.early.model.NoticeBoardVO;

public class LikesUpService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int f_seq = Integer.parseInt(request.getParameter("f_seq"));
		int f_likes = Integer.parseInt(request.getParameter("f_likes")) + 1;

		NoticeBoardDAO nbdao = new NoticeBoardDAO();
		NoticeBoardVO nvo = new NoticeBoardVO();

		nvo.setF_seq(f_seq);
		nvo.setF_likes(f_likes);
		nbdao.likesUp(nvo);

		return null;
	}

}

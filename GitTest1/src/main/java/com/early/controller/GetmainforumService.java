package com.early.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.early.db.NoticeBoardDAO;
import com.early.model.NoticeBoardVO;
import com.google.gson.Gson;

public class GetmainforumService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		NoticeBoardDAO ndao = new NoticeBoardDAO();
		
		List<NoticeBoardVO> list = ndao.getlikeBoard(); 
		
		Gson gson = new Gson();
        String jsonList = gson.toJson(list);

        // JSON 문자열을 응답으로 전송
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonList);

		return null;
	}

}

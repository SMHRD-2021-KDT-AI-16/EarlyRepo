package com.early.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.ApartAllinfoDAO;
import com.early.model.ApartAllinfoVO;

public class GetapartallinfoService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String apt_name = request.getParameter("aptname");
		ApartAllinfoDAO aaidao = new ApartAllinfoDAO();
		List<ApartAllinfoVO> list = aaidao.getAptAllinfo(apt_name);
		List<ApartAllinfoVO> list2 = aaidao.getAptreview(apt_name);
		StringBuilder plainText = new StringBuilder();
		for (ApartAllinfoVO temp : list) {
			plainText.append(temp.getApt_name()).append(";").append(temp.getApt_loc()).append(";")
					.append(temp.getApt_realprice()).append(";").append(temp.getApt_size()).append(";")
					.append(temp.getApt_img()).append(";");
		}
		for (ApartAllinfoVO temp : list2) {
			plainText.append(temp.getReview_content()).append("|");
		}
		HttpSession session = request.getSession();
		session.setAttribute("apart_list", plainText.toString());
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		response.getWriter().write(plainText.toString());
		return null;

	}

}

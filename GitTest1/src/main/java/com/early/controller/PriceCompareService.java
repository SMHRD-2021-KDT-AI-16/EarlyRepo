package com.early.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.CompareDAO;
import com.early.model.ApartVO;
import com.early.model.CompareVO;
import com.google.gson.Gson;

public class PriceCompareService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String income = request.getParameter("income");
		String money = request.getParameter("money");
		int loan_money = Integer.parseInt(money) + Integer.parseInt(income);

		CompareDAO cdao = new CompareDAO();
		String total = String.valueOf(Integer.parseInt(money) + Integer.parseInt(income));

		List<CompareVO> list = cdao.getCompareincome(total);

		StringBuilder plainText = new StringBuilder();

		for (CompareVO item : list) {
			plainText.append(item.getApt_name()).append(";").append(item.getApt_realprice()).append(";")
					.append(item.getApt_loc()).append(";");
		}
		HttpSession session = request.getSession();
		session.setAttribute("loan_money", loan_money);
		session.setAttribute("priceCompare_list", plainText.toString());
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		response.getWriter().write(plainText.toString());

		return null;
	}

}

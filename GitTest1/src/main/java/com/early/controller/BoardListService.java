package com.early.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.controller.Command;
import com.early.model.BoardDAO;

import com.early.model.boardVO;

public class BoardListService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 1. email, pw 가져오기(post 인코딩)
		// 2. Member 객체 생성
		// 3. DAO loginMember() 메소드 호출
		// 4. DB에 있는 값 가져와서 콘솔창에 tel값만 출력하기
		boardVO vo = new boardVO();
		System.out.println("TEST123");
		List<boardVO> result  = new BoardDAO().allBoard();
		System.out.println(result.get(0).getId());
		if (result != null) {
			// 로그인 성공
			System.out.println("data 가져오기 성공");
			HttpSession session = request.getSession();
			session.setAttribute("allboard", result);
		}

		return "board.jsp";
	}

}

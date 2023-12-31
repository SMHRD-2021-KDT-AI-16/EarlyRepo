package com.early.frontcontroller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.early.controller.AllgetBoardService;
import com.early.controller.ApartSearchService;
import com.early.controller.BoardIdService;
import com.early.controller.Command;
import com.early.controller.DelMemberService;
import com.early.controller.GetApartService;
import com.early.controller.GetCommentService;
import com.early.controller.GetNoticeBoardService;
import com.early.controller.GetapartallinfoService;
import com.early.controller.GetmainforumService;
import com.early.controller.IdCheckService;
import com.early.controller.InsertCommentService;
import com.early.controller.JoinService;
import com.early.controller.LikesUpService;
import com.early.controller.LoginCheckService;
import com.early.controller.LoginService;
import com.early.controller.LogoutService;
import com.early.controller.PriceCompareService;
import com.early.controller.ResultService;
import com.early.controller.SelectLoansService;
import com.early.controller.UpdateService;
import com.early.controller.WriteBoardService;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	HashMap<String, Command> map = new HashMap<>();

	@Override
	public void init() throws ServletException {
		super.init();
		
		map.put("Join.do", new JoinService());
		map.put("IdCheckService.do", new IdCheckService());
		map.put("Login.do", new LoginService());
		map.put("Logout.do", new LogoutService());
		map.put("Update.do", new UpdateService());
		map.put("DeleteMember.do", new DelMemberService());
		map.put("getApart.do", new GetApartService());
		map.put("html/notice_Board.do", new GetNoticeBoardService());
		map.put("getApartSearch.do", new ApartSearchService());
		map.put("html/writeboard.do", new WriteBoardService());
		map.put("html/logincheck.do", new LoginCheckService());
		map.put("html/SelectLoans.do", new SelectLoansService());
		map.put("logincheck.do", new LoginCheckService());
		map.put("html/writeboard.do", new WriteBoardService());
		map.put("html/logincheck.do", new LoginCheckService());
		map.put("SelectLoans.do", new SelectLoansService());
		map.put("getapartallinfo.do", new GetapartallinfoService());
		map.put("html/BoardIdService.do", new BoardIdService());
		map.put("Result.do", new ResultService());
		map.put("SelectLoans.do", new SelectLoansService());
		map.put("getapartallinfo.do", new GetapartallinfoService());
		map.put("html/BoardIdService.do", new BoardIdService());
		map.put("likes_up.do", new LikesUpService());
		map.put("html/AllgetBoardService.do", new AllgetBoardService());
		map.put("insertComment.do", new InsertCommentService());
		map.put("getComment.do", new GetCommentService());
		map.put("getmainforum.do", new GetmainforumService());
		map.put("getApartSearch.do", new ApartSearchService());
		map.put("SelectLoans.do", new SelectLoansService());
		map.put("getCompare.do", new PriceCompareService());
		map.put("html/Result.do", new ResultService());
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//프론트엔드에서 어떤 요청을 보냈는지 분석

		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String path = uri.substring(cp.length() + 1);
		
		
		request.setCharacterEncoding("utf-8");

		String finalpath = null;
		Command com = null;
		
		// 3. path값이 어떤 요청이냐에 따라서 다른 기능 수행
		if (path.contains("Go")) {
			// Go + 파일이름 + .do
			finalpath = path.replaceAll("Go", "").replaceAll(".do", ".jsp");
		} else {

			com = map.get(path);
			
			//요청에 맞는 service를 실행시키겠습니다 
			finalpath = com.execute(request, response);
		}

		// 5. 페이지 이동(2가지)
		if (finalpath != null) {
			System.out.println("finalpath : "+finalpath);
			
			if (finalpath.contains("redirect:/")) {
				finalpath = finalpath.replace("redirect:/", "html/");
				
				if(finalpath.contains(".do")) {
					finalpath = finalpath.replaceAll(".do", ".jsp");
					
					if(finalpath.contains("Go")) {
						finalpath = finalpath.replaceAll("Go", "");
					}
				}
				response.sendRedirect(finalpath);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher(finalpath);
				rd.forward(request, response);
			}
		}		

	}

}

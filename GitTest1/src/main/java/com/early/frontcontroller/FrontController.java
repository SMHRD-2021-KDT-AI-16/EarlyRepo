package com.early.frontcontroller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.early.controller.Command;
import com.early.controller.IdCheckService;
import com.early.controller.JoinService;
import com.early.controller.LoginService;
import com.early.controller.LogoutService;
import com.early.controller.UpdateService;
import com.early.controller.BoardListService;


/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	HashMap<String, Command> map = new HashMap<>();

	public FrontController() {
		super();
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
			if (path.equals("Join.do")) {
				// 4. 일반 클래스 파일에게 일 시키는 작업
				com = new JoinService();
			} else if (path.equals("Login.do")) {
				com = new LoginService();
			} else if (path.equals("IdCheckService.do")) {
				com = new IdCheckService();
			}else if (path.equals("Logout.do")) {
				com = new LogoutService();
			}else if (path.equals("Update.do")) {
				com = new UpdateService();
			}else if (path.equals("DeleteMember.do")) {
				com = new UpdateService();
				System.out.println(com);
			}else if (path.equals("listService.do")) { 
				com = new BoardListService();
				System.out.println("com : "+com);
			}
			System.out.println("com값 : "+com);

			finalpath = path.replaceAll(".do", ".jsp");

			System.out.println("1번 :" + finalpath);
			finalpath = com.execute(request, response);

		}

		// 5. 페이지 이동(2가지)
		if (finalpath != null) {
			if (finalpath.contains("redirect:/")) {
				// response.sendRedirect(finalpath.substring(11));
				response.sendRedirect(
						finalpath.replaceAll("redirect:/", "html/").replaceAll(".do", ".jsp").replaceAll("Go", ""));
				System.out.println("2번" + finalpath);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("html/" + finalpath);
				rd.forward(request, response);
			}
		}

	}

}

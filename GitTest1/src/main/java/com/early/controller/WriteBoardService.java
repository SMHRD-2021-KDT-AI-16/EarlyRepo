package com.early.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.NoticeBoardDAO;
import com.early.model.MemberVO;
import com.early.model.NoticeBoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteBoardService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String savePath = "C:\\Users\\user\\git\\EarlyRepo\\GitTest1\\src\\main\\webapp\\uploadimg";
		 
		int sizeLimit = 1024*1024*5;
		
		MultipartRequest multi = new MultipartRequest(request,savePath,sizeLimit,"UTF-8", new DefaultFileRenamePolicy());
		
		String f_file = multi.getFilesystemName("upload");
		String f_content = multi.getParameter("board");
		String loc = multi.getParameter("loc");
		MemberVO user = (MemberVO)session.getAttribute("member");
		String user_id = user.getUser_id();
		
		System.out.println("test : "+f_file);
		System.out.println("test2 : "+f_content);
		System.out.println("test4 : "+loc);
		System.out.println("test5 : "+user_id);
		
		NoticeBoardVO nbvo = new NoticeBoardVO();
		
		nbvo.setF_content(f_content);
		nbvo.setF_file(f_file);
		nbvo.setLoc(loc);
		nbvo.setUser_id(user_id);
		
		NoticeBoardDAO nbdao = new NoticeBoardDAO();
		
		nbdao.insertContent(nbvo);
		
		return "AllgetBoardService.do";
	}

}

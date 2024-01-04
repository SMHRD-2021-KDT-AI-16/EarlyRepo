package com.early.controller;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

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
		response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String savePath = "C:\\Users\\user\\git\\EarlyRepo\\GitTest1\\src\\main\\webapp\\uploadimg";
		 
		int sizeLimit = 4096*4096*15;
		
		MultipartRequest multi = new MultipartRequest(request,savePath,sizeLimit,"UTF-8", new DefaultFileRenamePolicy());
		
		String f_file;
		if(multi.getFilesystemName("upload") != null) {
			f_file = multi.getFilesystemName("upload");
	    }else {
	        f_file="사진없음이없음이없으먇ㅂㄴㅍasdasdwqdvk";
	    }
		String f_content = multi.getParameter("board");
		String loc = multi.getParameter("loc");
		MemberVO user = (MemberVO)session.getAttribute("member");
		String user_id = user.getUser_id();
		
		NoticeBoardVO nbvo = new NoticeBoardVO();
		
		nbvo.setF_content(f_content);
		nbvo.setF_file(f_file);
		nbvo.setLoc(loc);
		nbvo.setUser_id(user_id);
		
		NoticeBoardDAO nbdao = new NoticeBoardDAO();
		
		nbdao.insertContent(nbvo);
		
		
		try { for (int i = 0; i < 2; i++) { TimeUnit.MILLISECONDS.sleep(1800);
		System.out.println("Sleep " + i); } } catch (Exception e) {
		System.out.println(e); }
		
	
		//return "AllgetBoardService.do";
		return "/WriteComplete";
	}

}

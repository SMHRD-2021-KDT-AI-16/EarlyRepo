package com.early.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.model.MemberVO;


public class BoardIdService implements Command{

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      System.out.println("여기까지 들어옴?");
      
      HttpSession session = request.getSession();
      
      MemberVO member = (MemberVO) session.getAttribute("member");
      System.out.println("user_id : "+member.getUser_id());
      
	return null;
      
 
   }

}

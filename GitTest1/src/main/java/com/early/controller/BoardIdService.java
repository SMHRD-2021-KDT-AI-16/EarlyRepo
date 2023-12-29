package com.early.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BoardIdService implements Command{

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      System.out.println("여기까지 들어옴?");
      
      String user_id = request.getParameter("user_id");
      System.out.println("user_id : "+user_id);
      
	return null;
      
 
   }

}

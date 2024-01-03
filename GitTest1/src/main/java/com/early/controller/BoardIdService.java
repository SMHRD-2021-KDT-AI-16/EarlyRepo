package com.early.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.early.db.NoticeBoardDAO;
import com.early.model.MemberVO;
import com.early.model.NoticeBoardVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;



public class BoardIdService implements Command{

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

       HttpSession session = request.getSession();
       

       MemberVO member = (MemberVO) session.getAttribute("member");
       String user_id = member.getUser_id();

       System.out.println("user_id : " + user_id);

       NoticeBoardDAO nbdao = new NoticeBoardDAO();

       List<NoticeBoardVO> list = nbdao.getIdContents(user_id);

       // list가 null이 아닌 경우에만 JsonArray를 생성하고 세션에 저장
       if (list != null && !list.isEmpty()) {
           

           JsonArray jArray = new JsonArray();
           for (int i = 0; i < list.size(); i++) {
               Gson gson = new Gson();
               jArray.add(gson.toJson(list.get(i)));
           }

           session.setAttribute("NoticeIdboard", jArray);
       }

       return "Mypage.jsp";

	 

      
   }
   }



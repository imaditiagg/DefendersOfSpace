/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.exp;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import javax.servlet.http.*;
import java.sql.Connection;
import java.sql.ResultSet;
import com.mysql.jdbc.Statement;


/**
 *
 * @author My Hp
 */
@WebServlet(name = "Register1", urlPatterns = {"/Register1"})
public class Register1 extends HttpServlet {

    public Register1()
    {
    super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name1= request.getParameter("name1");
        String name2= request.getParameter("name2");
    String tname= request.getParameter("tname");

    String Course=request.getParameter("course");
        String Branch=request.getParameter("branch");
    String Year=request.getParameter("year");
    String College=request.getParameter("College");
    String Contact=request.getParameter("Contact");
    String email=request.getParameter("email");
   final HttpSession session=request.getSession();
   session.setAttribute("email", email);
    String pas=request.getParameter("pas");
    try{
        conn ob=new conn();
        Connection con=ob.getConnection();
        if(con==null)
        {
        System.out.println("no conn");
        }
         Statement stmt = (Statement)con.createStatement();
     String sql="insert into register(name1,name2,tname,course,branch,year,clg,cntct,email,pass) values ('"+name1+"','"+name2+"','"+tname+"','"+Course+"','"+Branch+"','"+Year+"','"+College+"','"+Contact+"','"+email+"','"+pas+"')";
     
     stmt.executeUpdate(sql);
     System.out.println("inserted personal");
     String sql2="insert into score(email,team) values ('"+email+"','"+tname+"')";
     stmt.executeUpdate(sql2);
     System.out.println("score");
    /* Calendar calendar=Calendar.getInstance();
     java.sql.Timestamp ts = new java.sql.Timestamp(calendar.getTime().getTime());
     out.print(ts);*/
      
          
      //HttpSession session2=request.getSession();
    //session2.setAttribute("time", 36);
      System.out.println("time ");
     
     String redirectURL = "http://172.16.5.54:8080/associate/rules_final.html";
		response.sendRedirect(redirectURL);
     
    }catch(Exception e)
    {
        e.printStackTrace();
    }
        }
       
    }
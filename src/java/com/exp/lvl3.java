/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.exp;

import java.sql.Connection;
import java.sql.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.Statement;
import javax.servlet.http.*;

/**
 *
 * @author My Hp
 */
@WebServlet(name = "lvl3", urlPatterns = {"/lvl3"})
public class lvl3 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();

        int score=0;
ResultSet rs1=null;
ResultSet r=null;
ResultSet rs2=null;
String answer=request.getParameter("editor");
        try {
          conn obj=new conn();
         Connection con= obj.getConnection();
         Statement st=(Statement)con.createStatement();
         HttpSession session=request.getSession(true);
	String sql3="SELECT on3 FROM score WHERE email ='"+session.getAttribute("email")+"'";
	 r=st.executeQuery(sql3);
while(r.next())
{	if(r.getString("on3").equals("n"))
	{
           
Statement stmt=(Statement)con.createStatement();
	String sql="SELECT ans3 FROM level WHERE uid='1'";
	ResultSet rs=stmt.executeQuery(sql);
	Statement stmt1=(Statement)con.createStatement();
	while(rs.next())
	{
	if(answer.equals(rs.getString("ans3")))
	{
            System.out.println(rs.getString("ans3"));
		String sql2="SELECT total FROM score WHERE email='"+session.getAttribute("email")+"'";
		 rs1=stmt.executeQuery(sql2);
		 	
		while(rs1.next())
		{
			
			score=rs1.getInt("total")+100;
			
			
			String sql1 = "update score set total='"+score+"',on3='y',lvl3=100 where email='"+session.getAttribute("email")+"'";
			stmt1.executeUpdate(sql1);
   		}
                  Statement st4=(Statement)con.createStatement();
	String sql5="SELECT on1,on2,on3,on4,on2,on4,lvl2,lvl1 FROM score WHERE email ='"+session.getAttribute("email")+"'";
	 rs2=st4.executeQuery(sql5);
        while(rs2.next()){
         if(rs2.getString("on1").equals("y") && rs2.getString("on2").equals("y") && rs2.getString("on3").equals("y") &&rs2.getString("on4").equals("y") && rs2.getInt("lvl4")==100 && rs2.getInt("lvl1")==100 )
         {
         String redirectURL = "http://172.16.5.54:8080/associate/puzzle2.jsp";
		response.sendRedirect(redirectURL);
         }else if(rs2.getString("on1").equals("y") && rs2.getString("on2").equals("y") && rs2.getString("on3").equals("y") && rs2.getString("on4").equals("y") && (rs2.getInt("lvl1")!=100 || rs2.getInt("lvl2")!=100))
         {
         String redirectURL = "http://172.16.5.54:8080/associate/Lost.html";
		response.sendRedirect(redirectURL); 
         }else
         {
                String redirectURL = "http://172.16.5.54:8080/associate/lpuzzle3.html";
		response.sendRedirect(redirectURL); 
         }
         }
	}else
	{
		String redirectURL = "http://172.16.5.54:8080/associate/Last1.html";
		response.sendRedirect(redirectURL); 
	}
	}
	}
	{
		
		String redirectURL = "http://172.16.5.54:8080/associate/levels.jsp";
		response.sendRedirect(redirectURL);
	}
	}	
        }catch(Exception e)
        {
        e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

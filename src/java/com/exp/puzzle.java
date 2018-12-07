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
@WebServlet(name = "puzzle", urlPatterns = {"/puzzle"})
public class puzzle extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
ResultSet rs1=null;
        String code=request.getParameter("code");
        try  {
            conn obj=new conn();
         Connection con= obj.getConnection();
         Statement st=(Statement)con.createStatement();
         HttpSession session=request.getSession(true);
      
Statement stmt=(Statement)con.createStatement();
	String sql="SELECT puzzle FROM level WHERE uid='1'";
	ResultSet rs=stmt.executeQuery(sql);
	Statement stmt1=(Statement)con.createStatement();
	while(rs.next())
	{
            out.println(rs.getString("puzzle"));
	if(code.equals(rs.getString("puzzle")))
	{
            String sql2="SELECT total FROM score WHERE email='"+session.getAttribute("email")+"'";
		 rs1=stmt.executeQuery(sql2);
		 	
		while(rs1.next())
		{
			
			int score=rs1.getInt("total")+500;
                        out.println("right ans");
			String sql1 = "update score set total='"+score+"',puzzle= 500,p='y' where email='"+session.getAttribute("email")+"'";
			stmt1.executeUpdate(sql1);
                }
   		System.out.println("score +");
        
         String redirectURL = "http://172.16.5.54:8080/associate/Last2.html";
		response.sendRedirect(redirectURL); 
         
        }		
        else{
            String redirectURL = "http://172.16.5.54:8080/associate/Last1.html";
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

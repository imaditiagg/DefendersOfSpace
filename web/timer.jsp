<%-- 
    Document   : timer
    Created on : Sep 27, 2018, 3:47:43 PM
    Author     : My Hp
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>timer</title>
    </head>
    <body>
       <%
           String time=request.getParameter("distance1");
       try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/spacewar", "root", "");
	 ResultSet rs=null;
  System.out.println("distance="+time);
  String sql="update score set time='"+Integer.parseInt(time)+"'where email='"+session.getAttribute("email")+"'";
  // PreparedStatement ps = con.prepareStatement(sql);
     //   ps.executeUpdate();
     Statement stmt = null;
         stmt=con.createStatement();  
        stmt.executeUpdate(sql); 
          System.out.println("updated");
 
         // In this part u extract time from database
   //step5 close the connection object  
con.close();
       
}catch(Exception e1)
{
    out.println(e1);
}
       %>
    </body>
</html>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.Timestamp" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="csslevels.css">

<script>
 	function preventBack(){window.history.forward();}
 	  setTimeout("preventBack()", 0);
 	  window.onunload=function(){null};
 	</script>
<script language="javascript">

function mouseover(id)
{	if(id=="level1")
	{ content1.style.visibility="visible";
	}
	else if(id=="level2")
	{ content2.style.visibility="visible";
	}
	else if(id=="level3")
	{ content3.style.visibility="visible";
	}
	else if(id=="level4")
	{ content4.style.visibility="visible";
	}
}
function mouseout(id)
{	if(id=="level1")
	{ content1.style.visibility="hidden";
	}
	else if(id=="level2")
	{ content2.style.visibility="hidden";
	}
	else if(id=="level3")
	{ content3.style.visibility="hidden";
	}
	else if(id=="level4")
	{ content4.style.visibility="hidden";
	}
}


</script>

<script>
        <%! Connection con;
         int a11=0;
        
         %>
         // ResultSet rs=null;
  <% int a=0;
try {
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection("jdbc:mysql://localhost:3306/spacewar", "root", "");
	 ResultSet rs=null;
  if(con!=null)
      System.out.println("Data is successfully retrieved!");
  else
      System.out.println("no connection");
  String sql="select time from score where email='"+session.getAttribute("email")+"'";
  // PreparedStatement ps = con.prepareStatement(sql);
     //   ps.executeUpdate();
     Statement stmt = null;
         stmt=con.createStatement();  

         rs=stmt.executeQuery(sql); 
         // In this part u extract time from database
while(rs.next()) { 
    a=rs.getInt(1);
//System.out.println(rs.getInt(1)); //+"  "+rs.getString(2)+"  "+rs.getString(3));  
}
//step5 close the connection object  
       
}catch(Exception e1)
{
    out.println(e1);
}
%>


 // here ur using the time left in the database for the user
var distance1=<%=a%>;

//distance=distance;
// Update the count down every 1 second
var x = setInterval(function() {

    // Get todays date and time
   // var now = new Date().getTime();
    
    // Find the distance between now an the count down date
   /// var distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance1 / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance1 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance1 % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance1 % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("clock-container").innerHTML =  minutes + "m " + seconds + "s ";
    distance1=distance1-1000;
    // If the count down is over, write some text 
    if(distance1<=0)
    	{
    	setTimeout(function () {
    	    window.location.href = "over.html"; //will redirect to your blog page (an ex: blog.html)
    	 },2000); //will call the function after 2 secs.

    	}
        },1000);
// repeat every 5 second
<%
    final String em=(String)session.getAttribute("email");
     final Timer timer = new Timer();
TimerTask task = new TimerTask() {
  synchronized public void run() {
    // job code here
     String sql="Update score set time=? where email='"+em+"'";  // Here u could set for which team time update krna hai like where teamname=...
  // here i have done subtraction not exact values. You guys would have exact values because of sessions
  // as i have not created sessions
 // a1=a1-60000;

 try{
        String sql1="select time from  score where email='"+em+"'";
      Statement stmt1 = null;
         stmt1=con.createStatement();  

        ResultSet rs=stmt1.executeQuery(sql1); 
        String name,pass; 
        int a11=0;
while(rs.next()) { 
    a11=rs.getInt(1);
  
}
//System.out.println("value database se retrieved hai"+a11);
 
a11=a11-1000;
   PreparedStatement ps = con.prepareStatement(sql);
   ps.setInt(1, a11);
     ps.executeUpdate();
  // System.out.println("yh update hui hai databse me"+a11);
   if(a11<=0)
   {
   timer.cancel();
   }
   Statement st4=(Statement)con.createStatement();
   ResultSet rs2=null;
	String sql5="SELECT on1,on2,on3,on4,on2,on4,lvl2,lvl1 FROM score WHERE email ='"+em+"'";
	 rs2=st4.executeQuery(sql5);
        while(rs2.next()){
          if(rs2.getString("on1").equals("y") && rs2.getString("on2").equals("y") && rs2.getString("on3").equals("y") && rs2.getString("on4").equals("y") && (rs2.getInt("lvl1")!=100 || rs2.getInt("lvl2")!=100))
         {
          timer.cancel();
          String sql4="insert into timer(email,time)values('"+em+"','"+a11+"')";
          stmt1.executeUpdate(sql4);
         }
         }
   ResultSet rs1=null;
   String sql3="select p from score where email='"+em+"'";
   rs1=stmt1.executeQuery(sql3);
   
   while(rs1.next())
   {
     //  System.out.println(rs1.getString(1));
   if(rs1.getString(1).equals("y"))
   {
        timer.cancel();  
        String sql4="insert into timer(email,time)values('"+em+"','"+a11+"')";
          stmt1.executeUpdate(sql4);
   }
   }
 }
 catch(Exception e2){
 e2.printStackTrace();
   
 }
    }
};

timer.scheduleAtFixedRate(task, 1000,1000);

//step5 close the connection object  
//con.close();
%>
</script>

</head>
<body>
<!-- <img src="comet.gif" style="width:200; height:200;"></img> -->
<div id="clock-container" style="font-size:40px;
color:white;
text-shadow:4px 4px 4px blue;
width:400px; height:100px;
margin-top:10px;
margin-left:500px;
position:fixed;"></div>
<a href =level1.jsp ><button class="button button1" onmouseover="mouseover(this.value)" onmouseout="mouseout(this.value)" name="level1" value="level1"> Level 1  
 </button></a><br><br><br>
<div class="content" id="content1" >
 <br> Solve this hurdle by answering this objective question. You have one attempt to answer it correctly.
 
 
 </div>




 <a href =level2.jsp ><button class="button button2" onmouseover="mouseover(this.value)" onmouseout="mouseout(this.value)" name="level2" value="level2">Level 2
</button></a><br><br><br>
<div class="content" id="content2" >
 <br> Solve this hurdle by answering this objective question. You have one attempt to answer it correctly. <br> </div>

<a href =level3.jsp ><button class="button button3" onmouseover="mouseover(this.value)" onmouseout="mouseout(this.value)" name="level3" value="level3">Level 3
</button></a><br><br><br>
<div class="content" id="content3" >
 <br> Subjective based hurdle. Answer it correctly, to unlock piece of puzzle. You can attempt it any number of times <br> </div>





<a href =level4.jsp ><button class="button button4" onmouseover="mouseover(this.value)" onmouseout="mouseout(this.value)" name="level4" value="level4">Level 4
</button></a><br><br><br>
<div class="content" id="content4" >
 <br> Subjective based hurdle. Answer it correctly, to unlock piece of puzzle. You can attempt it any number of times

 </div>

 
 



</body>
</html>

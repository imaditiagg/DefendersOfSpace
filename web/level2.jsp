<!DOCTYPE.html>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Level 2</title>
<style>

.team {
	position:absolute;
	margin-top:10px;
	margin-left:20px;
	width:500px;
	height:40px;
	
	
}
.score {
	position:absolute;
	margin-top:30px;
	margin-left:1100px;
	width:200px;
	height:40px;
	
	
}
.container {
    border-radius: 5px;
   	position:absolute;
	height:500;
	width:1100px;
	margin-top:120px;
	margin-left:150px;
	color:white;
}
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}
.col-70 {
    float: left;
    width: 70%;
    margin-top: 6px;
	
}
input[type=text], select, textarea {
    width: 1040px;
	height:400px;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
	margin-left:28px;
	margin-top:10px;
	color:black;
}
input[type=submit] {
    background-color: rgb(0,0,0,0.7);
    color: white;
    padding: 10px 15px;
    height: 40px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
   margin-top:20px;
	margin-bottom:0px;
	 border:2px solid white;
    border-radius: 0px;
	width:140px;
	
}


input[type=submit]:hover {
    background-color: indianred;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}



/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
    .col-25, .col-75, input[type=submit] {
        width: 100%;
        margin-top: 0;
    }
}
</style>
<script>
 	function preventBack(){window.history.forward();}
 	  setTimeout("preventBack()", 0);
 	  window.onunload=function(){null};
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
System.out.println(rs.getInt(1)); //+"  "+rs.getString(2)+"  "+rs.getString(3));  
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
        </script>
     </head>
<body>
<img src="p2.jpeg" style="height:100%;width:100%;position:absolute;background-size: cover">
<%
       int score=0;
       String team="";
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/spacewar", "root", "");
	Statement stmt4=con.createStatement();
	String sql4="select total,team from score where email='"+session.getAttribute("email")+"'";
	ResultSet rs3=stmt4.executeQuery(sql4);
	while(rs3.next())
	{
	 score=rs3.getInt("total");
        team=rs3.getString("team");
	}
}catch(Exception e)
{
e.printStackTrace();	
}
	%>
<div class="team" >
	<h3 style="color:white">Welcome <%=team%> </h3>	
</div>
  <div id="clock-container" style="font-size:40px;
color:white;
text-shadow:4px 4px 4px blue;
width:400px; height:100px;
margin-top:10px;
margin-left:500px;
position:fixed;"></div>
<div class="score">
	<h4 style="color:white">Your score is:<%=score%></h4>
  </div>
    


<div class="container" style="background-color:rgb(0,0,0,0.5);">

	<div class="row">
      <div class="col-100">
        <h3 style="margin-left:30px">Question 2: Find the Output of given code</h3>
      </div>
	</div>

	 <form action="lvl2" method="post">

	<div class="row">
		<div class="col-100">
                    <p style="margin-left:30px ; margin-right:30px; margin-top:20px; font-family:Verdana">#include<stdio.h> <br>
int fun() { <br>
  static int num = 16;<br> 
  return num--; <br>
} <br>
int main() <br>
{ <br>
  for(fun(); fun(); fun())<br> 
    printf("%d ", fun()); <br>
  return 0; <br>
} </p> 
			
			
		</div>
	</div>
	
	<div class="row">
		<div class="col-100">
			<p style="margin-left:30px ; margin-right:30px; margin-top:20px; font-family:Verdana"> 
                            <input type="radio" name="ans" value="a">(A) Infinite loop<br>	
                            <input type="radio" name="ans" value="b">(B) 14 11 8 5 2<br>	
                            <input type="radio" name="ans" value="c">(C) 13 10 7 4 1<br>	
                            <input type="radio" name="ans" value="d">(D) 15 12 8 5 2<br>	
                                                    
                        </p> 
			
			
		</div>
	</div>
	
	<div class="row">
	  <!-- <input type="submit" value="Compile and Test" style="margin-left:760px"> -->
		<input type="submit" value="Submit" id="btn1"  style="margin-left:20px;" >
		
                </form>
	  
    </div>
</div>
<button type="button" style="position:absolute; margin-left:1040px; margin-top:540px; height:60px;width:170px; background-color:rgb(0,0,0,0.7)"><a href="levels.jsp" style="color:white">Go back to Levels</a></button>

</body>


</html>
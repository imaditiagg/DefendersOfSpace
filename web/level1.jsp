<!DOCTYPE.html>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.Timestamp" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Level 1</title>
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
	height:auto;
	width:1100px;
	margin-top:120px;
	margin-left:150px;
	color:white;
}
* {
    box-sizing: border-box;
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
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top:20px;
    border:2px solid white;
    border-radius: 0px;
    margin-bottom:0px;
	
	width:140px;
	
}


input[type=submit]:hover {
    background-color: steelblue;
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
<img src="p1.jpeg" style="height:100%;width:100%;position:absolute;">
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
</div>

<div class="score">
	<h4 style="color:white">Your score is:<%=score%></h4>
  </div>
    


<div class="container" style="background-color:rgb(0,0,0,0.5);">

	<div class="row">
      <div class="col-100">
        <h3 style="margin-left:30px">Ques1 
Pick the best statement for the below program:

</h3>
      </div>
	</div>

	 <form action="lvl1" method="post">

	<div class="row" style=""">
		<div class="col-100">
                    <p style="margin-left:30px ; margin-right:30px; margin-top:20px; font-family:Verdana">#include "stdio.h" <br>
  
int main() <br>
{ <br>
 struct {int a[2], b;} arr[] = {[0].a = {1}, [1].a = {2}, [0].b = 1, [1].b = 2}; <br>
  
 printf("%d %d %d and",arr[0].a[0],arr[0].a[1],arr[0].b); <br>
 printf("%d %d %d\n",arr[1].a[0],arr[1].a[1],arr[1].b); <br>
  
 return 0; <br>
}				
		</div>
	</div>
	
	<div class="row">
		<div class="col-100">
			<p style="margin-left:30px ; margin-right:30px; margin-top:20px; font-family:Verdana"> 
                            <input type="radio" name="ans" value="a">(A) Compile error because struct type (containing two fields i.e. an array of int and an int) has been specified along with the definition of array arr[] of this struct type.<br>	
                            <input type="radio" name="ans" value="b">(B) Compile error because of incorrect syntax for initialization of array arr[].<br>	
                            <input type="radio" name="ans" value="c">(C) No compile error and two elements of arr[] would be defined and initialized. Output would be ?1 0 1 and 2 0 2?.<br>	
                            <input type="radio" name="ans" value="d">(D) No compile error and two elements of arr[] would be defined and initialized. Output would be ?1 X 1 and 2 X 2? where X is some garbage random number.<br>	
                                                    
                        </p> 
			
			
		</div>
	</div>
	
	<div class="row">
	<!--	<input type="submit" value="Compile and Test" style="margin-left:760px"> -->
        <input type="submit" value="Submit" id="btn1" onclick="disableButton(this)" style="margin-left:20px;">
		
                </form>
	  
    </div>
</div>
<button type="button" style="position:absolute; margin-left:1040px; margin-top:530px; height:60px;width:170px; background-color:rgb(0,0,0,0.7)"><a href="levels.jsp" style="color:white">Go back to Levels</a></button></body>


</html>
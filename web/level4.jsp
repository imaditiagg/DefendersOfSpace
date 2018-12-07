<!DOCTYPE.html>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="java.util.Calendar"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Level 4</title>
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
	height:520px;
	width:1100px;
	margin-top:120px;
	margin-left:150px;
        margin-bottom: 0px;
	color:white;
}

    *{
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
}</style>

<script>
var message="Function Disabled!";

///////////////////////////////////
function clickIE4(){
if (event.button==2){
alert(message);
return false;
}
}

function clickNS4(e){
if (document.layers||document.getElementById&&!document.all){
if (e.which==2||e.which==3){
alert(message);
return false;
}
}
}

if (document.layers){
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown=clickNS4;
}
else if (document.all&&!document.getElementById){
document.onmousedown=clickIE4;
}

document.oncontextmenu=new Function("alert(message);return false")

// --> 
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
<img src="codebackground.jpeg" style="height:100%;width:100%;position:absolute;background-size: cover">
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
	<h3 style="color:white">Welcome <%=team %></h3>	
</div>
        <div id="clock-container" style="font-size:40px;
color:white;
text-shadow:4px 4px 4px blue;
width:400px; height:100px;
margin-top:10px;
margin-left:500px;
position:fixed;"></div>
<div class="score">
    <h4 style="color:white">Your score is:<%=score %></h4>
    
</div>

 
<div class="container" style="background-color:rgb(0,0,0,0.5);">

	<div class="row">
      <div class="col-100">
        <h3 style="margin-left:30px">Que 4:</h3>
      </div>
	</div>

	
	<div class="row">
		<div class="col-100">
			<p style="margin-left:30px ; margin-right:30px; margin-top:20px; font-family:Verdana">Ajeyaa and Sriram are here to help you to cross this level. There is Block simulator which generates a tower of N blocks. Each block in the tower 
has a unique value assigned to it. Both of them need to rearrange the tower to make it difficult for your enemies, with each having 
thought of a different way of doing it. Ajeyaa wants to arrange them such that the block values are in ascending order from top to bottom, 
while Sriram wants the block values in descending order from top to bottom. To move a block, one can take it out and insert it between any
2 blocks. It can also be placed on top or inserted at the bottom. It takes 2 seconds to move one block from its original position to any 
other position. Unable to decide upon which method to use, both of them agree to use the method which uses the shortest time (that is, they
will arrange the blocks either in ascending or descending order from top to bottom, depending on which method takes the shortest time). 

There are 7 Blocks and values present on the block from top to bottom are : 10 163 89 5 73 15 49
Find whose arrangement will be final and also find the minimum number of blocks which need to be moved.
</p> 
			
			
		</div>
	</div>
	
	<div class="row">
		<div class="col-100">
			<p style="margin-left:30px ; margin-right:30px; margin-top:20px; font-family:Verdana">Output Format: 
				The first word should be whose arrangement is used, i.e, Ajeyaa or Sriram. If both of the methods use the same time, then output the word 
"Both" (without " "). The next word should be the minimum number of blocks which need to be moved.There will be space between both terms.
e.g ABCD 12
</p> 
			
			
		</div>
	</div>
	
	
	
	
	<div class="row">
      <div class="col-70">
          <form action="lvl4" method="post">
        <input type="text" id="fname" name="editor" style="height:50px">
        
      </div>
	</div>
	
	<div class="row">
      <!--      <input type="submit" value="Compile and Test" style="margin-left:760px"> -->
      <input type="submit" value="Submit" style="margin-left:20px;" >
		
	</form>
	
	  
    </div>
</div>
<button type="button"  style="position:absolute; margin-left:1040px; margin-top:550px; height:60px;width:170px;padding-bottom: 0px; background-color:rgb(0,0,0,0.7)"><a href="levels.jsp" style="color:white">Go back to Levels</a></button>
</body>


</html>
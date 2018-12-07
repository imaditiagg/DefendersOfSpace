<!DOCTYPE html>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.Timestamp" %>
<html>
<head>
<title>Puzzle</title>

    <script>
 	function preventBack(){window.history.forward();}
 	  setTimeout("preventBack()", 0);
 	  window.onunload=function(){null};
 	</script>
        <script>
<%! Connection con;
         int a11=0;
        
         %>
         
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
// repeat every 5 second
</script>

<%--
    final String em=(String)session.getAttribute("email");
     final Timer timer = new Timer();
TimerTask task = new TimerTask() {
   public void run() {
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

System.out.println("value database se retrieved hai"+a11);
 
a11=a11-10000;
   PreparedStatement ps = con.prepareStatement(sql);
   ps.setInt(1, a11);
     ps.executeUpdate();
   System.out.println("yh update hui hai databse me"+a11);
   if(a11<=0)
   {
   timer.cancel();
   }
   ResultSet rs1=null;
   String sql3="select p from score where email='"+em+"'";
   rs1=stmt1.executeQuery(sql3);
   
   while(rs1.next())
   {
       System.out.println(rs1.getString(1));
   if(rs1.getString(1).equals("y"))
   {
        timer.cancel();
        String sql4="insert into timer(email,time) values('"+em+"','"+a11+"')";
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
--%>
<script type="text/javascript">  
	
window.onload = onReady;  
  
var can;  
var ctx;          
var img;  
var clickX;  
var clickY;  
var selected1;  
var selected2;        
var blockSize   = 160;  
var piecesArray = new Array();  
  
function onReady()  
{  
    can = document.getElementById('myCanvas');  
  
    if(navigator.userAgent.toLowerCase().indexOf('firefox') >= 0 || !can.getContext)  
    {  
        can.style.display = 'none';  
        document.getElementById('sorry').style.display = 'inline';  
        return;  
    }  
  
    ctx        = can.getContext('2d');            
    img        = new Image();  
    img.onload = onImage1Load;  
    img.src    = "code9.jpg";           
} 
	function onImage1Load()  
{  
    var r;  
    for(var i = 0; i < 4; i++)  
    {  
        for(var j = 0; j < 3; j++)  
        {  
            r = new Rectangle(i * blockSize, j * blockSize, i*blockSize + blockSize, j * blockSize + blockSize);  
            piecesArray.push(r);  
        }                 
    }  
              
    scrambleArray(piecesArray, 30);  
    drawImage();  
}  
function onImage1Load()  
{  
    var r;  
    for(var i = 0; i < 4; i++)  
    {  
        for(var j = 0; j < 3; j++)  
        {  
            r = new Rectangle(i * blockSize, j * blockSize, i*blockSize + blockSize, j * blockSize + blockSize);  
            piecesArray.push(r);  
        }                 
    }  
              
    scrambleArray(piecesArray, 30);  
    drawImage();  
}  
function Rectangle(left, top, right, bottom)  
{  
    this.left = left;  
    this.top  = top;  
    this.right = right;  
    this.bottom = bottom;  
              
    this.width = right - left;  
    this.height = bottom - top;  
}  

function scrambleArray(ar, times)  
{  
    var count = 0;  
    var temp;  
    var index1;  
    var index2;  
  
    while(count < times)  
    {  
        index1 = Math.floor(Math.random()*piecesArray.length);  
        index2 = Math.floor(Math.random()*piecesArray.length);  
                  
        temp = piecesArray[index1];  
        piecesArray[index1] = piecesArray[index2];  
        piecesArray[index2] = temp;  
                  
        count++;  
    }  
} 

function drawImage()  
{  
    var r;  
    for(var i = 0; i < 4; i++)  
    {  
        for(var j = 0; j < 3; j++)  
        {  
            r = piecesArray[i*3+j];                   
            ctx.drawImage(img, r.left, r.top, r.width, r.height, i*blockSize, j*blockSize, blockSize, blockSize);  
        }  
    }  
} 
function highlightRect(drawX, drawY)  
{  
    ctx.beginPath();  
    ctx.moveTo(drawX, drawY);  
    ctx.lineTo(drawX + blockSize, drawY);  
    ctx.lineTo(drawX + blockSize, drawY + blockSize);  
    ctx.lineTo(drawX, drawY + blockSize);  
    ctx.lineTo(drawX, drawY);  
    ctx.lineWidth = 2;  
  
    // set line color  
    ctx.strokeStyle = "#ff0000";  
    ctx.stroke();  
}  
          
function swapRects(r1, r2)  
{  
    var index1;  
    var index2;  
    var temp = r1;  
              
    index1 = piecesArray.indexOf(r1);  
    index2 = piecesArray.indexOf(r2);  
              
    piecesArray[index1] = r2;  
    piecesArray[index2] = temp;           
}  
function onCanvasClick(evt)  
{  
    clickX = evt.offsetX;  
    clickY = evt.offsetY;  
              
    var drawX         = Math.floor(clickX / blockSize);  
    var drawY         = Math.floor(clickY / blockSize);           
    var index         = drawX * 3 + drawY;            
    var targetRect    = piecesArray[index];  
    var drawHighlight = true;  
              
    drawX *= blockSize;  
    drawY *= blockSize;  
              
    ctx.clearRect(0, 0, 640, 480);  
              
    if(selected1 != undefined && selected2 != undefined)  
    {  
        selected1 = selected2 = undefined;  
    }  
              
    if(selected1 == undefined)  
    {  
        selected1 = targetRect;  
    }  
    else  
    {  
        selected2 = targetRect;  
        swapRects(selected1, selected2);  
        drawHighlight = false;  
    }  
              
    drawImage();  
              
    if(drawHighlight)     
        highlightRect(drawX, drawY);  
}  
</script>
<style>
	
	.foot{
		margin-top:100px;
		margin-left:500px;
	}
 
 
</style>

</head>
     <div id="clock-container" style="font-size:40px;
color:white;
text-shadow:4px 4px 4px blue;
width:400px; height:100px;
margin-top:10px;
margin-left:500px;
position:fixed;"></div>
	<body style="background-color:#fbfbfb;background-image:url('bg3.jpeg'); background-size: 100% 100%" >  
  
    <div style="margin:0 auto; width:640px; height:480px; border: 4px solid #cc6699;">  
          
    <img id="sorry" src="sorry.jpg" style="display:none;"/>  
          
    <canvas id="myCanvas" width="640" height="480" onclick="onCanvasClick(event);">  
    </canvas>  
      
    </div>  
            
	<div class="foot" style="margin-left:70px; margin-top:40px">
        <form action="puzzle" method="post">
	<p style="font-family:Verdana; font-size:20px;color:white;margin-left:80px;margin-top: 10px;">After rearranging the puzzle, enter the sum of ASCII values of characters:
	<input type="text" name="code" id="code1"></p>
	<br>
	<button type="submit" style="margin-left:500px;margin-top:0px;height:30px;width:180px;background-color:rgb(0,0,0,0.5); color:white">Click to Submit</button>
        </form>
        </div>
	</body>  
 
</html>
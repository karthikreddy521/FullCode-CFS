<%@ page language="java"  pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'ValidateUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body> 
    <%
     	String userId=request.getParameter("USERID");
          String password=request.getParameter("PASSWORD");
          	int user=0;
          	user=serviceLayer.Login.verify(userId,password);
          	if(user==0)
          		response.sendRedirect("InValidLogin.jsp");
          	else if(user==1)
          		response.sendRedirect("../Admin/Admin.jsp");
          	else if(user==2)
          		response.sendRedirect("../Student/Student.jsp?userId="+userId);
          	else if(user==3)
          		response.sendRedirect("AlreadyLoggedIn.jsp");
          	else if(user==4)
          	    response.sendRedirect("NoFeedBackTakingPlace.jsp");
     %>
    <br>
  </body>
</html>

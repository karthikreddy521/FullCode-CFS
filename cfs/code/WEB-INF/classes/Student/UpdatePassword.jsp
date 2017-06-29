<%@ page language="java"  pageEncoding="ISO-8859-1"%>
<%@page import="dataAccessLayer.GetPassword"%>
<%@page import="serviceLayer.Feedback"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'UpdatePassword.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

  </head>
  
  <body>
    <%
    Feedback feedback=(Feedback)session.getAttribute("feedbackObject");
    String userId=feedback.getStudentId();
    
    String password=request.getParameter("password");
    String confirmPassword=request.getParameter("confirmpassword");
    if(password.equals(confirmPassword))
    {
    GetPassword.updatePassword(userId,password);
    %>
    <center><strong>------Password Updated successfully--------</strong><br><br>
    <a href="../login.jsp">LOGOFF</a> <br/></center>
    <%
    
    }
    else
    {
    %>
    <center><strong>------Password didnot match --------</strong>
     <a href="ChangePassword.jsp">TRY AGAIN</a> <br/></center>
     <%
     
     }
      %>
  </body>
</html>

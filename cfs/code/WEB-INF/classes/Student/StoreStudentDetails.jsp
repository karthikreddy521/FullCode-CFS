<%@ page language="java"  pageEncoding="ISO-8859-1"%>
<%@page import="others.Variables"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'StoreStudentDetails.jsp' starting page</title>
    
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
    if(!Variables.isFeedBackInProgress())
    {
     response.sendRedirect("NoCourseSelected.jsp");
    }
    else
    {
    %>
    <jsp:useBean id="studentDetails" class="serviceLayer.RegistrationStudentDetails"/>
    <jsp:setProperty name="studentDetails" property="*"/>
    <jsp:setProperty name="studentDetails" property="storeStudentDetails" value="xxx"/>
    
    <%
    }
     %>
       <table width="90%" border="0">
  <tr>
    <td width="34%" height="126">&nbsp;</td>
    <td width="40%">&nbsp;</td>
    <td width="26%">&nbsp;</td>
  </tr>
  <tr>
    <td height="106">&nbsp;</td>
    <td align="center"><strong><font size="+2">Your Details submitted successFully
     <br/> </font></strong></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="174">&nbsp;</td>
    <td align="center" valign="top"><a href="../login.jsp">Try After Some Time </a></td>
    <td>&nbsp;</td>
  </tr>
</table>
  </body>
</html>

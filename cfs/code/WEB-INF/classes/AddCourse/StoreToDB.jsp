<%@ page language="java"  pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.StoreCourse"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    
    
    <title>My JSP 'StoreToDB.jsp' starting page</title>
    
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
  <p>&nbsp;</p>
  <div align="center">
  <table width="90%" border="0">
  <tr>
    <td width="18%" height="61">&nbsp;</td>
    <td width="60%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
  </tr>
  <tr>
    <td height="144">&nbsp;</td>
    <td align="center" valign="middle"><%
  if(StoreCourse.addCourse())
  {
  out.print("Course  Details Stored to Data Base Successfully   <br>");
  
	}
else
  out.print("Error While Storing Details to DB   <br>");
   %>
 <br><br>  <a href="../Admin/Admin.jsp">HOME</a></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="99">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
  
   
</body>
</html>

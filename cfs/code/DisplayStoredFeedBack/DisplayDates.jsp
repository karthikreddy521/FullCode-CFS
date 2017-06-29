<%@ page language="java"  pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    
    
    <title>My JSP 'ValidateUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="../styles.css">

  </head>
  
  <body> 
    <%
    SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
    String section=request.getParameter("Section");
  	selectCourse.setSection(section);
    ArrayList<String> dates=selectCourse.getFeedBackDates();
    int length=dates.size();
	%>
	<table width="90%" border="0">
  <tr>
    <td width="25%" height="50">&nbsp;</td>
    <td width="54%" align="center">Click on the date to get FeedBack taken on that date</td>
    <td width="21%">&nbsp;</td>
  </tr>
  <tr>
    <td height="156">&nbsp;</td>
    <td align="center" valign="middle"><%for(int i=0;i<length;i++)
    {
   
    out.println("<a href='setDateInSession.jsp?date="+dates.get(i)+"'>"+dates.get(i)+"</a></br>");
    
    
    

    }%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

    
     	
    <br>
</body>
</html>



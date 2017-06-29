<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'Promote.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

  </head>
  
  <body><br>
    
     
    
     <%
     Integer year=(Integer)session.getAttribute("Year");
     SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
     System.out.println("in promote year got 4m session");
     if(year>0)
     {
     selectCourse.setYear(year);
     
     
     %>
     
      <jsp:forward page="InitilizeSection.jsp"/>
      
     <% 
     }
     else
     {
     %>
      <jsp:forward page="AllStudents Promoted.jsp"/>
     <% 
     }
    %>
      
  </body>
</html>

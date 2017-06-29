<%@ page language="java"  pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'InitilizePromote.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><% 
  SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
  String branch=request.getParameter("Branch");
  selectCourse.setBranch(branch);
  Integer year=selectCourse.getCourseDuration();
  System.out.println("initilizepromote  setting session attribute year"+year);
  session.setAttribute("Year",year); 
  %>
    <jsp:forward page="Promote.jsp"/>
  </body>
</html>

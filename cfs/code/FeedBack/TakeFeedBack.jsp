<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="others.Variables"%>
<%@page import="serviceLayer.GetStudentsStatus"%>
<%@page import="serviceLayer.StudentStatus"%>
<%@page import="others.Spell"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'TakeFeedBack.jsp' starting page</title>
    
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
  Variables.setFeedBackInProgress(true);
   response.sendRedirect("StudentsRegistered.jsp");
   
  %>
  </body>
</html>

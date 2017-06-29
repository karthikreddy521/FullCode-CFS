<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'SelectSection.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">
	

  </head>
  
  <body>
  <font>
   <%
   SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
   ArrayList<String> sectionsArrayList=selectCourse.getSections();
   int sectionCount=(Integer)session.getAttribute("SectionCount");
   if(sectionCount>0)
   {
    String section=sectionsArrayList.get(sectionCount-1);
    selectCourse.setSection(section);
    
    %>
    <jsp:forward page="DisplayStudents.jsp"/>
    <%
   }
   else
   {
   Integer year=(Integer)session.getAttribute("Year");
   year--;
   session.setAttribute("Year",year);
   
  %>
  <jsp:forward page="Promote.jsp"/>
  <%
  }
   
    %>
    </font>
  </body>
</html>

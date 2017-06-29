<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'FeedBack.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

  </head>
  
  <body>
    <br>
    <%!
    SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
    ArrayList<String> subjects=selectCourse.getSubjects();
    int length=subjects.size();
    
    synchronized void incrementSubjectNumber(HttpSession session)
    {
      int subjectNo=(Integer)session.getAttribute("SubjectNumber");
      subjectNo++;
       session.setAttribute("SubjectNumber",subjectNo);    
    }
     %>
    <%
    
    System.out.println("course-->"+selectCourse.getCourseName()+"   branch"+selectCourse.getBranch()+"year"+selectCourse.getYear());
   
  
    int subjectNo=(Integer)session.getAttribute("SubjectNumber");
    if(subjectNo<length)
    {
    session.setAttribute("subject",subjects.get((Integer)session.getAttribute("SubjectNumber")));
   
    incrementSubjectNumber(session);
      
    
     %>
      <jsp:forward page="FaculityFeedbackGraph.jsp"/>
    <%
    }
    else
    {
     %>
     <jsp:forward page="CollegeFeedbackGraph.jsp"/>
     <%
     
     }
      %>
  </body>
</html>

<%@ page language="java"  pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="serviceLayer.PromoteStudents"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'PromoteStudents.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

  </head>
  
  <body>
    <%
    int noOfStudents=(Integer)session.getAttribute("noOfStudents");
    System.out.println("in PromoteStudents 4m sesionnoofstudents"+noOfStudents);
    ArrayList<PromoteStudents> promoteStudents=new ArrayList<PromoteStudents>();
    for(int i=1;i<=noOfStudents;i++)
    {
    PromoteStudents student=new PromoteStudents();
    String rollNo=(String)request.getParameter("StudentId"+i);
    System.out.println("in promote students Rollno"+rollNo);
    student.setStudentId(rollNo);
    String promote=(String)request.getParameter("promote"+i);
    System.out.println("in promote students promote"+promote);
    if(promote.equals("yes"))
      student.setPromote(1);
   else
     student.setPromote(0);
     
     promoteStudents.add(student);
    }
    
    SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
    boolean flag=selectCourse.promoteStudents(promoteStudents);
    if(flag)
    {
    %>
     <jsp:forward page="SuccesFullyStored.jsp"/>
     <%
     }
    else
    {
    %>
    <jsp:forward page="ErrorWhileStoring.jsp"/>
    <% 
    }
    %>
  </body>
</html>

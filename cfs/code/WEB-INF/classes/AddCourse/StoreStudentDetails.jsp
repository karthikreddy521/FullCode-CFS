<%@ page language="java"  import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="serviceLayer.Student"%>

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
  SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
  int strength=selectCourse.getStrength();
  System.out.println("in storestudDetails strength"+strength);
  ArrayList<Student> students=new ArrayList<Student>();
  for(int i=1;i<=strength;i++){
  Student student=new Student();
  student.setName(request.getParameter("Name"+i));
  student.setPassword(request.getParameter("Password"+i));
  student.setRollNo(request.getParameter("RollNo"));
  students.add(student);
  }
  if(selectCourse.storeStudentDetails(students))
  {
  %>
 stored  student details succesfully 
 <%
 }
 else
 {
 %>
 Error while storing student details succesfully
 

  
 <%
 }
  %>  
  
  
 
  
  
  
   
   
  </body>
</html>

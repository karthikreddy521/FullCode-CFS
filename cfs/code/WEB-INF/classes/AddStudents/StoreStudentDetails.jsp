<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
	<link rel="stylesheet" type="text/css" href="../styles.css">

  </head>
  
  <body>
    <%
    SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
    int strength=selectCourse.getStrength();
    ArrayList<Student> students=new ArrayList<Student>();
    String rollNo,name,password;
    for(int i=1;i<=strength;i++)
    {
    	
     rollNo=request.getParameter("RollNo"+i);
      password=request.getParameter("Password"+i);
      name=request.getParameter("Name"+i);
      Student student=new Student();
      student.setName(name);
      student.setPassword(password);
      student.setRollNo(rollNo);
      students.add(student);
    }
    boolean flag=selectCourse.storeStudentDetails(students);
    if(flag)
    {
     %>
    Student details sucessfully stored 
    <%
    }
    else
    {
     %>
     
    Error While Stroring Student Details To Data base
    <%
    }
     %>
      <a href="../Admin/Admin.jsp">HOME</a>
  </body>
</html>

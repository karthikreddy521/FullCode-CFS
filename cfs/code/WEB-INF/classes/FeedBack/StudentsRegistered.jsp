<%@ page language="java"  pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.GetStudentsStatus"%>
<%@page import="serviceLayer.StudentStatus"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'StudentsRegistered.jsp' starting page</title>
    
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
    <table width="90%" border="1" align="center" cellpadding="1" cellspacing="1">
  <caption>
  STUDENTS  STATUS
  </caption>
   <tr>
    <th width="28%">STUDENTID</th>
    <th width="36%" align="center" valign="middle">NAME</th>
  
  </tr>
  <%
  GetStudentsStatus.makeNew();
  GetStudentsStatus.initilizeStudentIds();
  ArrayList<StudentStatus> studentsStatusArrayList=GetStudentsStatus.getStudents();
   int length=studentsStatusArrayList.size();
   
  for(int i=0;i<length;i++)
  {
   %>
  <tr>
    <td align="center" valign="middle"><%=studentsStatusArrayList.get(i).getStudentId() %></td>
    <td align="center" valign="middle"><%=studentsStatusArrayList.get(i).getName() %></td>
    
  </tr>
  <%
  }
   %>
   </table>
              <a href="StudentsStatus.jsp">StartFeebBack</a>   
  </body>
</html>

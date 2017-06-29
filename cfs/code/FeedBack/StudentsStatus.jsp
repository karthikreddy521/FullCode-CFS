<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="serviceLayer.GetStudentsStatus"%>
<%@page import="serviceLayer.StudentStatus"%>
<%@page import="others.Spell"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'TakeFeedBack.jsp' starting page</title>
     <meta http-equiv = "refresh" content = "3" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

  </head>
  
  <body>
  
  
  <%!
  
 SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
 
  
  
 
  %>
  FEEDBACK IN PROGRESS FOR <%=selectCourse.getCourseName()%>&nbsp;&nbsp;&nbsp;<%=Spell.spellIntToTHForm(selectCourse.getYear())%>&nbsp;YEAR&nbsp;&nbsp;
  <%=selectCourse.getBranch()%>&nbsp;&nbsp;Section<%=selectCourse.getSection()%>&nbsp;&nbsp;
  
  
  
  <table width="90%" border="1" align="center" cellpadding="1" cellspacing="1">
  <caption>
  STUDENTS  STATUS
  </caption>
   <tr>
    <th width="28%">STUDENTID</th>
    <th width="36%" align="center" valign="middle">NAME</th>
    <th width="36%" align="center" valign="middle">STATUS</th>
  </tr>
  <%
  
  ArrayList<StudentStatus> studentsStatusArrayList=GetStudentsStatus.getStudents();
   int length=studentsStatusArrayList.size();
   
  for(int i=0;i<length;i++)
  {
   %>
  <tr>
    <td align="center" valign="middle"><%=studentsStatusArrayList.get(i).getStudentId() %></td>
    <td align="center" valign="middle"><%=studentsStatusArrayList.get(i).getName() %></td>
    <%
    int status=studentsStatusArrayList.get(i).getStatus();

    if(status==0)
    {
    %>
    <td align="center" valign="middle">NOT LOGGEDIN</td>
    <%
    }
    else if(status==1)
    {
    %>
    <td align="center" valign="middle">LOGGEDIN</td>
    <%
    }
    else if(status==2)
    {
     %>
    <td align="center" valign="middle">SUBMITED</td>
    <%
    }
    else
    {
     %>
     <td align="center" valign="middle">ERROR</td>
     <%
     }
      %>
     
  </tr>
  <%
  }
   %>
   </table>
              <a href="SelectSubjectForFeedBack.jsp">Get Statistics</a>   
  </body>
</html>

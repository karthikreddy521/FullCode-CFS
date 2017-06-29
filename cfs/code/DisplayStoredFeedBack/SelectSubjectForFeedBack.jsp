<%@ page language="java"  pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="java.util.ArrayList"%>

 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'Student.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

  </head>
  
  <body>
    <div align="center"><table width="90%" border="0">
  <caption>
    Click on the links to get the statictics 
  </caption>
  <tr>
    <td width="27%" height="110">&nbsp;</td>
    <td width="39%">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
  <tr>
    <td height="207">&nbsp;</td>
    <td align="center" valign="middle"><%
	 
      SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
      ArrayList<String> subjects=selectCourse.getSubjects();
      int noOfSubjects=subjects.size();
      for(int i=0;i<noOfSubjects;i++)
      {
      String subject=subjects.get(i);
       out.println("<a href='FaculityFeedbackGraph.jsp?SubjectNo="+i+"'>"+subject+"</a><br/><br/>");
      }     
      %>
      <a href="CollegeFeedbackGraph.jsp">College Feed Back</a><br><br><br>
      
      <a href="../Admin/Admin.jsp">HOME</a>
      
      
      </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="85">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
     
  </body>
</html>

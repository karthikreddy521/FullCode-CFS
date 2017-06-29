<%@ page language="java"  pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="serviceLayer.SelectCourse"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'AddStudentsStrength.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

  </head>
  
  <body>
  <form action="AddStudentsDetails.jsp" method="post">
  <%
  
  SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
  String section=request.getParameter("Section");
  selectCourse.setSection(section);
  %>
  
  <table width="90%" border="0">
  <tr>
    <td width="47%" height="112">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="44%">&nbsp;</td>
  </tr>
  <tr>
    <td height="150" align="right">Students Strength <br><br>Common Part of RollNo</td>
    <td>&nbsp;</td>
    <td><input name="StudentsStrength" type="text" size="10" maxlength="10" /><br><br>
      <input name="CommonRollNo" type="text" size="10" maxlength="10" /></td>
  </tr>
  <tr>
    <td height="147">&nbsp;</td>
    <td align="center" valign="top"><input name="Next"  value="next"  type="submit" /></td>
    <td>&nbsp;</td>
  </tr>
</table>
  <br><br>
   <!--   
  Remaining Part Of roll number<br>
  Starting 
  <input name="StartingRollNo" type="text" size="10" maxlength="20" /><br>
  Ending
  <input name="EndingRollNo" type="text" size="10" maxlength="10" /><br>
  -->
  </form>
  </body>
</html>

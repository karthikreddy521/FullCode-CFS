<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="serviceLayer.SelectCourse"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'AddStudentsBranch.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">
  </head>
  
  <body>
  <form action="AddStudentsStrength.jsp" method="post">
  <%
  
  SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
  String branch=request.getParameter("Branch");
  int year=Integer.parseInt(request.getParameter("Year"));
  selectCourse.setBranch(branch);
  selectCourse.setYear(year);

  ArrayList<String> sections=selectCourse.getSections();
  
  int length = sections.size();
  %>
  
 <div align="center"> <table width="90%" border="0">
  <tr>
    <td width="42%" height="98">&nbsp;</td>
    <td width="23%">&nbsp;</td>
    <td width="35%">&nbsp;</td>
  </tr>
  <tr>
    <td height="92">&nbsp;</td>
    <td align="center" valign="middle"> Section <select name="Section">
  <%
			for (int i = 0; i < length; i++) {
		%>
		
			<option><%=sections.get(i)%></option>
			<%
				}
			%>
		</select></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="122">&nbsp;</td>
    <td align="center" valign="top"><input name="Next"  value="next" type="submit" /> </td>
    <td>&nbsp;</td>
  </tr>
</table></div>

 
	<br>
		
    
    </form>
  </body>
</html>

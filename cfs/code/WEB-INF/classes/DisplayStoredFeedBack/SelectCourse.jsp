<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourseFactory"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'SelectCourse.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

  </head>
  
  <body>
  <%
				SelectCourseFactory.makeNew();
				ArrayList<String> courses = SelectCourseFactory.getSelectCourse()
						.getCourseNames();
				int length = courses.size();
				%>
    <form action="SelectBranchYear.jsp" method="post">
      <div align="center">
  <table width="90%" border="0">
    <tr>
      <td width="25%" height="115">&nbsp;</td>
      <td width="45%" align="center" valign="middle"><font size="+3">Select The Course</font></td>
      <td width="30%">&nbsp;</td>
      </tr>
    <tr>
      <td height="118">&nbsp;</td>
      <td align="center" valign="middle"><select name="Course">
        <% 
				for (int i = 0; i < length; i++) {
			%>
        <option><%=courses.get(i)%></option>
        <%
					}
				%>
        </select></td>
      <td>&nbsp;</td>
      </tr>
    <tr>
      <td height="113">&nbsp;</td>
      <td align="center" valign="middle"><input name="Next" type="submit"  value="NEXT"/></td>
      <td>&nbsp;</td>
      </tr>
  </table>
  <br>
      </div>
    </form>
  </body>
</html>

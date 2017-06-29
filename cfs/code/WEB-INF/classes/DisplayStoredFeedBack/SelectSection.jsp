<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title>My JSP 'SelectSection.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

  </head>
  
  <body>
   <form action="DisplayDates.jsp" method="post">
 
    <%
  
  SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
  String branch=request.getParameter("Branch");
  int year=Integer.parseInt(request.getParameter("Year"));
  selectCourse.setBranch(branch);
  selectCourse.setYear(year);

  ArrayList<String> sections=selectCourse.getSections();
  
  int length = sections.size();
  %>
   <div align="center">
  <table width="90%" border="0">
    <tr>
    <td width="42%" height="156">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="50%">&nbsp;</td>
  </tr>
  <tr>
    <td height="89" align="right">Section </td>
    <td>&nbsp;</td>
    <td><select name="Section">
      <%
			for (int i = 0; i < length; i++) {
		%>
      <option><%=sections.get(i)%></option>
      <%
				}
			%>
    </select></td>
  </tr>
  <tr>
    <td height="156">&nbsp;</td>
    <td align="center" valign="top"><input name="Next"  value="NEXT" type="submit" /></td>
    <td>&nbsp;</td>
  </tr>
</table></div>
<br>
  </form>
  </body>
</html>

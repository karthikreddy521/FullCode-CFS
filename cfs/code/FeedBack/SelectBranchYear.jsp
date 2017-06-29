<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="serviceLayer.SelectCourse"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'SelectBranchYear.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">
  </head>
  
  <body>
  <form action="SelectSection.jsp" method="post">
  <%
 
  SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
  String course=request.getParameter("Course");
  selectCourse.setCourseName(course);
  ArrayList<String> branches=selectCourse.getBranches();
  
  int length = branches.size();
  %><table width="90%" border="0">
  <tr>
    <td width="44%" height="112" align="right" valign="bottom">Branch </td>
    <td width="9%">&nbsp;</td>
    <td width="47%" valign="bottom"><select name="Branch">
      <%
			for (int i = 0; i < length; i++) {
		%>
      <option><%=branches.get(i)%></option>
      <%
				}
			%>
    </select></td>
  </tr>
  <tr>
    <td height="108" align="right" valign="middle">Year</td>
    <td></td>
    <td><select name="Year">
			<% 
	int duration=selectCourse.getCourseDuration();
	for(int j=1;j<=duration;j++)
	{
	%>
		
			<option><%=j%></option>
		
	<% 	
	}			
			%>
	  </select></td>
  </tr>
  <tr>
    <td height="149">&nbsp;</td>
    <td align="center" valign="top"><input name="Next" type="submit" value="NEXT"/></td>
    <td>&nbsp;</td>
  </tr>
</table>

  
 
			
	            <br>
    </form>
  </body>
</html>

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
    <form action="SelectBranch.jsp" method="post">
			<%
				SelectCourseFactory.makeNew();
				ArrayList<String> courses = SelectCourseFactory.getSelectCourse()
						.getCourseNames();
				int length = courses.size();
				%>
				
				<select name="Course">
				<% 
				for (int i = 0; i < length; i++) {
			%>
			
				<option><%=courses.get(i)%></option>
				<%
					}
				%>
			</select>
			<br>
			<input name="Next" type="submit"  value="NEXT"/>
		</form>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="serviceLayer.SelectCourse"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'SelectBranch.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">
	

  </head>
  
  <body>
  
    <form action="InitilizePromote.jsp" method="post">
  <%
  
  SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
  String course=request.getParameter("Course");
  selectCourse.setCourseName(course);
  ArrayList<String> branches=selectCourse.getBranches();
  
  int length = branches.size();
  %><font>Branch  <select name="Branch">
  <%
			for (int i = 0; i < length; i++) {
		%>
		
			<option><%=branches.get(i)%></option>
			<%
				}
			%>
			</select><br>
			
	            <br>
		<input name="Next" type="submit" value="NEXT"/> 
    </font>
    </form>
    
  </body>
</html>

<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.Course"%>
<%@page import="serviceLayer.CourseFactory"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'AddCollegeFeedBack.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

  <link href="styles.css" rel="stylesheet" type="text/css">
  </head>
<%
	String course1 = request.getParameter("Course");
	int duration = Integer.parseInt(request.getParameter("Duration"));
	int noOfBranches = Integer.parseInt(request.getParameter("No of Branches"));
	CourseFactory.makeNew();
	Course course = CourseFactory.getCourse();
	course.setDuration(duration);
	course.setName(course1);
	course.setNoOfBranches(noOfBranches);
	%>
<form action="StoreBranches.jsp" method="post">

<table width="90%" border="0">
  <tr>
    <td width="16%" height="135">&nbsp;</td>
    <td width="64%" align="center" valign="middle"><font size="+1" >Enter branch names</font></td>
    <td width="20%">&nbsp;</td>
  </tr>
  <tr>
    <td height="211">&nbsp;</td>
    <td align="center" valign="middle"><%
	for (int i = 1; i <= noOfBranches; i++) {
		out.println("Branch" + i + "&nbsp<input name='branch"+i+ "' type='text' size='10' maxlength='20' /><br>");
		
	}
%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="97">&nbsp;</td>
    <td align="center" valign="top"><input name="next" type="submit" value="next" /></td>
    <td>&nbsp;</td>
  </tr>
</table>




    </form>


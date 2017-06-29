<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%@page import="serviceLayer.SelectCourseFactory"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		

		<title>My JSP 'AddStudents.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="../styles.css">

	</head>

	<body>
    <div align="center"><table width="90%" border="0">
  <tr>
    <td width="20%" height="103">&nbsp;</td>
    <td width="50%" align="center" valign="bottom"><strong>Select the course to with students to be added</strong></td>
    <td width="30%">&nbsp;</td>
  </tr>
  <tr>
    <td height="148">&nbsp;</td>
<td align="center" valign="middle"><form action="AddStudentsBranchYear.jsp" method="post">
			
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
			  <br><br>
			  <input name="Next" type="submit"  value="Next"/>
	    
    </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="125">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
    
		
	</body>

</html>

<%@ page language="java"  pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		

		<title>My JSP 'AddStudentsDetails.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="../styles.css">

	</head>

<body>
		<form action="StoreStudentDetails.jsp" method="post">
        <table width="90%" border="0" align="center">
  
  <tr>
    <td align="center">ROLLNO</td>
    <td align="center">PASSWORD</td>
    <td align="center">NAME</td>
  </tr>
  
    


		      
			<%
				int strength = Integer.parseInt(request
						.getParameter("StudentsStrength"));
				String commonRollNo = request.getParameter("CommonRollNo");
		
				 SelectCourse selectCourse = SelectCourseFactory.getSelectCourse();
				selectCourse.setStrength(strength);
				 
				 
				 for (int i = 1; i <=strength; i++) {
			
		out.print("<tr><td align='center'><input name='RollNo"+i+"' type='text' size='20' value='"+commonRollNo+"'/>&nbsp;</td>");
		out.print("<td align='center'><input name='Password"+i+"' type='text' size='20' value='123' />&nbsp;</td>"); 
		out.println("<td align='center'><input name='Name"+i+"' type='text' size='20' />&nbsp;<br></td></tr>");
        
    
			
			
				}
				
			%>
			<tr>
            <td>&nbsp;</td>
    <td align="center"><input name="Next"  value="next" type="submit" /> </td>
    <td>&nbsp;</td>
  </tr>
            
		  </table>
</form>
</body>
</html>

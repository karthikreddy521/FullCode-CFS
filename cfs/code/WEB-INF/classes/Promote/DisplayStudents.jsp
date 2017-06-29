<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="serviceLayer.Student"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'DisplayStudents.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

	</head>

	<body>
		<form method="post" action="PromoteStudents.jsp">
		
				<%
					SelectCourse selectCourse = SelectCourseFactory.getSelectCourse();
					ArrayList<Student> studentArrayList = selectCourse.getStudents();
				%>
				Course--<%=selectCourse.getCourseName()%> &nbsp;&nbsp;
				Branch--<%=selectCourse.getBranch()%> &nbsp;&nbsp;
				Year--<%=selectCourse.getYear()%>&nbsp;&nbsp;
				Section--<%=selectCourse.getSection() %>&nbsp;&nbsp;
				<div align="center">
					<table width="90%" border="1" cellspacing="1" cellpadding="1" align="right" bgcolor="#c0c0c0">
						<caption>
							Promote Students
						</caption>
						<tr>
							<th width="289" align="center" valign="middle">
								Roll No
							</th>
							<th width="289" align="center" valign="middle">
								Name
							</th>
							<th width="319" align="center" valign="middle">
								Promoted?
							</th>
						</tr>
						<%
						int noOfStudents=studentArrayList.size();
						session.setAttribute("noOfStudents",noOfStudents);
						System.out.println("in DisplayStudents noofstudents"+noOfStudents);
					      for(int i=1;i<=noOfStudents;i++)
					      {
						 
						out.print("<input name='StudentId"+i+"' type='hidden' value='"+studentArrayList.get(i-1).getRollNo()+"' />");
						out.print("<tr><td align='center' valign='middle'>"+studentArrayList.get(i-1).getRollNo()+"</td>");
						
						out.print("<td align='center' valign='middle'>"+studentArrayList.get(i-1).getName()+"</td>");
						out.print("<td align='center' valign='middle'>");
						out.print("<input name='promote"+i+"' type='radio' value='yes' checked='checked' />yes");
						out.print("<input name='promote"+i+"' type='radio' value='no' />no</td></tr>");
						
				
							
					}
						 %>
						</table>

						<br />
						<br />

						<input name="" type="submit" value="next" />
						</div>
						</form>
	</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.Course"%>
<%@page import="serviceLayer.CourseFactory"%>
<%@page import="serviceLayer.Branch"%>
<%@page import="serviceLayer.Year"%>
<%@page import="others.Spell"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		
		<title>My JSP 'StoreSubjects.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

	</head>

	<body><center>
		<form action="StoreToDB.jsp" method="post">
			<%
				Course course = CourseFactory.getCourse();

				int duration = course.getDuration();
				int noOfBranches = course.getBranch().size();
				ArrayList<Branch> branchs = course.getBranch();
				for (int i = 1; i <= noOfBranches; i++) {
					Branch branch = branchs.get(i - 1);
					String branchName = branch.getBranchName();
					ArrayList<Year> years = branch.getYear();
					for (int j = 1; j <= duration; j++) {
						Year year = years.get(j - 1);
						int y = year.getYear();
						int noOfSubjects = year.getNoOfSubjects();
						for (int k = 1; k <= noOfSubjects; k++) {
							ArrayList<String> subjects = year.getSubjects();
							String temp = branchName + y + "subject" + k;
							String subject = request.getParameter(temp);
							subjects.add(subject);

						}
					}

				}
				%>

				Course Name : <%=course.getName()%><br>
				
				
				
				
				
				
<% 
				for (int i = 1; i <= noOfBranches; i++) {
					Branch branch = branchs.get(i - 1);
					String branchName = branch.getBranchName();
					%>
					
			<br><br>Branch:<%=branchName%><br>
			
			
			
			
			  
					<%
					ArrayList<Year> years = branch.getYear();
					for (int j = 1; j <= duration; j++) {
						Year year = years.get(j - 1);
						int y = year.getYear();
						%>
						
						<%=Spell.spellIntToTHForm(y)%>year subjects<br>
						
						
						<% 
						int noOfSubjects = year.getNoOfSubjects();
						ArrayList<String> subjects = year.getSubjects();
						for (int k = 0; k < noOfSubjects; k++) {
							
							
								out.print(subjects.get(k)+"<br>");

						}
					}

				}
			%>
			<input name="next" type="submit" value="Store The Course " />
		</form></center>
	</body>
</html>

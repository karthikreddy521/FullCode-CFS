<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="java.util.ArrayList"%>

<%@page import="serviceLayer.FaculityFeedBackStatistics"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'Student.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="../styles.css">

	</head>

	<body>
		<%
			SelectCourse selectCourse = SelectCourseFactory.getSelectCourse();
			ArrayList<String> subjects = selectCourse.getSubjects();

			String subject = subjects.get(Integer.parseInt(request
					.getParameter("SubjectNo")));

			out.print("SUBJECT" + subject);
			String dateFeedBackTaken = (String)session.getAttribute("date");
			int totalCount = selectCourse
					.getTotalstudentsGivenFeedback(dateFeedBackTaken);
			FaculityFeedBackStatistics faculityFeedBackStatistics = selectCourse
					.getSubjectStatistics(subject, dateFeedBackTaken);
		%>

		<div align="center">
			<table width="90%" border="1" cellpadding="1" cellspacing="1">
				<caption>
					SUBJECT:<%=subject%>&nbsp;&nbsp;&nbsp;TOTAL STUDENTS:<%=totalCount%>
				</caption>
				<tr>
					<th align="center" valign="middle">
						Feature
					</th>
					<th align="center" valign="middle">
						Average
					</th>
					<th align="center" valign="middle">
						Good
					</th>
					<th align="center" valign="middle">
						Very Good
					</th>
					<th align="center" valign="middle">
						Excellent
					</th>
				</tr>
				<tr>
					<%
							for (int i = 1; i <= 15; i++) {
							float averageCount = faculityFeedBackStatistics
							.getFeatureStatisticsArrayList().get(i).averageCount;
							float goodCount = faculityFeedBackStatistics
							.getFeatureStatisticsArrayList().get(i).goodCount;
							float veryGoodCount = faculityFeedBackStatistics
							.getFeatureStatisticsArrayList().get(i).veryGoodCount;
							float excellentCount = faculityFeedBackStatistics
							.getFeatureStatisticsArrayList().get(i).excellentCount;
							
							float averagePercentage = (averageCount / totalCount * 100);
							float goodPercentage = (goodCount / totalCount * 100);
							float veryGoodPercentage = (veryGoodCount / totalCount * 100);
							float excellentPercentage = (excellentCount / totalCount * 100);
					%>
					<td align="left" valign="middle">
					<%
					String featureNo="FaculityFeature"+i;
					out.print(application.getInitParameter(featureNo)); %></td>
					<td align="center" valign="middle"><%=averagePercentage%></td>
					<td align="center" valign="middle"><%=goodPercentage%></td>
					<td align="center" valign="middle"><%=veryGoodPercentage%></td>
					<td align="center" valign="middle"><%=excellentPercentage%></td>
				</tr>
				<%
				}
				%>
			</table>
			<a href="SelectSubjectForFeedBack.jsp">BACK</a>
		</div>





	</body>
</html>

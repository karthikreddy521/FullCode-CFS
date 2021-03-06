<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.SelectCourse"%>
<%@page import="serviceLayer.SelectCourseFactory"%>
<%@page import="dataAccessLayer.FeedBackDAO"%>
<%@page import="serviceLayer.CollegeFeedBackStatistics"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'CollegeFeedbackForm.jsp' starting page</title>

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
			String dateFeedBackTaken = FeedBackDAO.getTodaysDate();
			int totalCount = selectCourse
					.getTotalstudentsGivenFeedback(dateFeedBackTaken);
			CollegeFeedBackStatistics collegeFeedBackStatistics = selectCourse
					.getCollegeStatistics(dateFeedBackTaken);
		%>
		<div align="center">
			<table width="90%" border="1" cellpadding="1" cellspacing="1">
				<caption>
					CollegeFeedBack &nbsp;&nbsp;&nbsp;TOTAL STUDENTS:<%=totalCount%>
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
						for (int i = 1; i <= 10; i++) {
							float averageCount = collegeFeedBackStatistics
									.getCollegeFeedBackArrayList().get(i).averageCount;

							float goodCount = collegeFeedBackStatistics
									.getCollegeFeedBackArrayList().get(i).goodCount;
							float veryGoodCount = collegeFeedBackStatistics
									.getCollegeFeedBackArrayList().get(i).veryGoodCount;
							float excellentCount = collegeFeedBackStatistics
									.getCollegeFeedBackArrayList().get(i).excellentCount;
							/*System.out.println("-IN COLLegefeeedback.jsp ");
							  System.out.println("totalcount-->"+totalCount);
							 System.out.println("avgcount-->"+averageCount);
							 System.out.println("goodcount-->"+goodCount);
							 System.out.println("verygoodcount-->"+veryGoodCount);
							 */
							System.out.println("excellentcount-->" + excellentCount);
							float averagePercentage = (averageCount / totalCount * 100);
							float goodPercentage = (goodCount / totalCount * 100);
							float veryGoodPercentage = (veryGoodCount / totalCount * 100);
							float excellentPercentage = (excellentCount / totalCount * 100);
					%>
					<td align="left" valign="middle">

						<%
							String featureNo = "CollegeFeature" + i;
								out.print(application.getInitParameter(featureNo));
						%>



					</td>
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

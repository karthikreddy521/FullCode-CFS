<%@ page language="java"  pageEncoding="ISO-8859-1"%>
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
	String subject=(String)session.getAttribute("subject");
	
	
	 
	 %>
	 
	 
		&nbsp;
		
		<form   method="post" action="AddSubjectFeedBack.jsp"> 
        
	
		<div align="center">
		
			<table width="90%" border="1" cellspacing="1" cellpadding="1">
			
            <caption>Select your opinions regarding Faculity of the SUBJECT: <%=subject%>
            			</caption>	<tr>
					<td width="480" align="center">
						Feature
					</td>
					<td width="419">
						<div align="center">
							Option
						</div>
					</td>
				</tr>
				
				
				
				<%
				
				
				for(int i=1;i<=15;i++)
				{
				
					String featureNo="FaculityFeature"+i;
					out.print("<tr> <td>");
					out.print(application.getInitParameter(featureNo)); 
				out.print("</td> <td><label><input type='radio' name='feature"+i+"' value='1'  />Average</label><label><input type='radio' name='feature"+i+"' value='2'  />Good</label><label><input type='radio' name='feature"+i+"' value='3' checked='checked' />Very Good</label> <label><input type='radio' name='feature"+i+"' value='4'  /> Excellent</label> </td></tr>");
				
				
			}	
				 %>
				
	    </table>
			
			 <input name="Next" type="submit" value="Next" /></div>
			
			</form>
		
	
			
	</body>
</html>

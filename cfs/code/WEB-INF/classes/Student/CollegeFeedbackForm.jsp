<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>


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
  <form   method="post" action="AddCollegeFeedBack.jsp"> 
		
		<div align="center">
			<table width="545" border="1" cellspacing="1" cellpadding="1" align="center">
			 <caption><big>Select your opinion regarding College features</big></caption>
				<tr>
					<td width="143">
						Feature
					</td>
					<td width="389">
						<div align="center">
							Option
						</div>
					</td>
				</tr>
    <%
				
				
				for(int i=1;i<=10;i++)
				{
				out.print("<tr> <td>");
				
							String featureNo = "CollegeFeature" + i;
								out.print(application.getInitParameter(featureNo));
						
				out.print("</td> <td><label><input type='radio' name='feature"+i+"' value='1'  />Average</label><label><input type='radio' name='feature"+i+"' value='2'  />Good</label><label><input type='radio' name='feature"+i+"' value='3' checked='checked'  />Very Good</label> <label><input type='radio' name='feature"+i+"' value='4'  /> Excellent</label> </td></tr>");
				
				}	
	%>
	 </table>
	
			<br><br> <input name="Next" type="submit" value="Next" /> </div>
			</form>
  </body>
</html>

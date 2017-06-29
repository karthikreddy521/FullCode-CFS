<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.Feedback"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'ChangePassword.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="../styles.css">

	</head>

	<body>
		<form action="UpdatePassword.jsp" method="post">
		<div align="center">	<table width="90%" border="0">
			
				<tr>
					<td width="45%" height="117">
						&nbsp;
					</td>
					<td width="12%">
						&nbsp;
					</td>
					<td width="43%">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td height="176" align="right">
						Enter new password
						<br />
						<br />
						Confirm password
					</td>
					<td>
						&nbsp;
					</td>
					<td>
						<input name="password" type="password"  />
						<br />
						<br />
						<input name="confirmpassword" type="password"  />
					</td>
					
					
				</tr>
				<tr>
					<td height="110">
						&nbsp;
					</td>
					<td align="center" valign="top">
						<input name="" type="submit" value="Change" />
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table></div>
		</form>

		
	</body>
</html>

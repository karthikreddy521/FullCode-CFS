<%@ page language="java" pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'RegistrationForm.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">
			<script language="javascript">

function checkFields()
{    
	var name=window.document.RegForm.name.value;
	
	var rollNo=window.document.RegForm.rollNo.value;
	var password=window.document.RegForm.password.value;
	var confirmPassword=window.document.RegForm.confirmPassword.value;
	
	if(name=="")
	{
		window.alert("Enter Your Name");
		window.document.getElementById(name).focus();
	}
	if(rollNo=="")
	{
		window.alert("Enter Your RollNO");
		window.document.getElementById(rollNo).focus();
	}
	if(password=="")
	{
		window.alert("Enter Your Password");
		window.document.getElementById(password).focus();
	}
	if(confirmPassword=="")
	{
		window.alert(" Confirm Password");
		window.document.getElementById(confirmPassword).focus();
	}
	if(password!=confirmPassword)
	{
		window.alert("Password Didnot Match");
		window.document.getElementById(name).focus();
	}
	
}
</script>
	</head>
	<body>
		<form action="StoreStudentDetails.jsp" method="post" name="RegForm">
			<div align="center">
				<table width="90%" border="0">
					<caption>
						<font color="#D43F00" size="+1">Enter Your Details</font>
					</caption>
					<tr>
						<td height="59">
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td width="43%" height="50" align="right" valign="middle">
							Name*
						</td>
						<td width="13%">
							&nbsp;
						</td>
						<td width="42%">
							<input name="name" type="text" id="name" />
						</td>
					</tr>
					<tr>
						<td height="50" align="right">
							RollNO*
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<input name="rollNumber" type="text" id="rollNo" />
						</td>
					</tr>
					<tr>
						<td height="50" align="right" valign="middle">
							Password*
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<input name="password" type="password" id="password" />
						</td>
						<td width="2%"></td>
					</tr>
					<tr>
						<td height="50" align="right">
							Confirm Password*
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<input name="confirmPassword" type="password"
								id="confirmPassword" />
						</td>
						
					</tr>
					<tr>
						<td height="50" align="right" valign="middle">
							MailId
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<input name="mailId" type="text" />
						</td>
						
					</tr>
					<tr>
						<td height="50" align="right" valign="middle">
							Contact Number
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<input name="contactNumber" type="text" />
						</td>
						<td>
					</tr>
					<tr>
						<td height="50">
							&nbsp;
						</td>
						<td align="center" valign="top">
							<input name="" type="submit" value="submit"
								ONCLICK="checkFields();" />
						</td>
						<td>
							&nbsp;
						</td>
					
					</tr>
				</table>

			</div>
		</form>
	</body>
</html>


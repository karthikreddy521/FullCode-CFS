<%@ page language="java"  pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body> 
  <div align="center"><font size="+4" color="#FF9999"> Welcome to FeedBack System</font> </div><br/><br/><br/>
  <form action="./Login/ValidateUser.jsp" method="post" name="login"> 
   <div align="center"> <table width="90%" border="0">
  <caption>&nbsp;
  </caption>
  <tr>
  <th height="34" colspan="3"><div align="center">
    <font color="#FF9999" >Please Enter your login credentials</font></div></th>
  </tr>
  <tr>
    <td width="40%" height="23">&nbsp;</td>
    <td width="7%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td height="39" align="right"><font  color="#FF9999">USER ID</font> </td>
    <td>&nbsp;</td>
    <td><font  color="#FF9999"><input type="text" name="USERID" size="20" maxlength="20"></font></td>
  </tr>
  <tr>
    <td height="36" align="right"><font  color="#FF9999">PASSWORD </font></td>
    <td>&nbsp;</td>
    <td align="left"><font  color="#FF9999"><input type="password" name="PASSWORD" size="20" maxlength="20"></font></td>
  </tr>
  <tr>
    <td height="43">&nbsp;</td>
    <td align="center" valign="middle"><font color="#0000ff">
      <input type="submit" height="10" border="5" align="middle" name="LOGIN" value="Login" size="10">
    </font></td>
    <td>&nbsp;</td>
  </tr>
</table></div>
    
</form><br>
   </body>
</html>

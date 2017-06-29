<%@ page language="java" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'AddCollegeFeedBack.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">

  <link href="styles.css" rel="stylesheet" type="text/css">
  </head>


<body>
<div align="center"><form  method="post" action="StoreCourse.jsp">
<table width="90%" border="0">
  <tr>
    <td width="38%" height="127">&nbsp;</td>
    <td width="7%">&nbsp;</td>
    <td width="55%">&nbsp;</td>
  </tr>
  <tr>
    <td height="198" align="right">Course<br><br>Duration<br><br>No of branches      </td>
    <td><br /><br />
      <br /> <br />
      <br /> <br /><br />	
  
</td>
    <td><input type="text" name="Course" id="Course" /><br><br>
      <select name="Duration" >
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        <option>6</option>
        <option>7</option>
        <option>8</option>
        <option>9</option>
      </select><br><br>
      <select name="No of Branches" >
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        <option>6</option>
        <option>7</option>
        <option>8</option>
        <option>9</option>
      </select></td>
  </tr>
  <tr>
    <td height="163">&nbsp;</td>
    <td align="center" valign="top"><input type="submit" name="Next" value="Next" /></td>
    <td>&nbsp;</td>
  </tr>
</table>

</form>
</div>
</body>
</html>
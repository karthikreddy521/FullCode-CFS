<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.CourseFactory"%>
<%@page import="serviceLayer.Course"%>
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
	<link href="styles.css" rel="stylesheet" type="text/css">
  </head>
  
  <body><div align="center"><font size="4" >Enter The Subjects Details<br><br></font></div>
  <form action="StoreSubjects.jsp" method="post"> 
  <%
  Course course=CourseFactory.getCourse();
  int duration=course.getDuration();
  int noOfBranches=course.getBranch().size();
  
   ArrayList<Branch> branchs=course.getBranch();
  for(int i=1;i<=noOfBranches;i++)
  {
  Branch branch=branchs.get(i-1);
  String branchName=branch.getBranchName();
  ArrayList<Year> years=branch.getYear();

  for(int j=1;j<=duration;j++)
  {
  	Year year=years.get(j-1);
  	String temp=branchName+j;
  	
  	year.setNoOfSubjects(Integer.parseInt(request.getParameter(temp)));
  	year.setSections(Integer.parseInt(request.getParameter(temp+"sections")));
  
  }
  
  }
  for(int i=1;i<=noOfBranches;i++)
  {
  Branch branch=branchs.get(i-1);
  String branchName=branch.getBranchName();
  out.println("Enter the subjects of &nbsp;"+branchName+"&nbsp;Branch<br><br>");
  ArrayList<Year> years=branch.getYear();
  for(int j=1;j<=duration;j++)
  {
  	Year year=years.get(j-1);
  	int y=year.getYear();
  	out.print("Enter the subjects Of"+Spell.spellIntToTHForm(y)+" year<br>");
  	int noOfSubjects=year.getNoOfSubjects();
  	for(int k=1;k<=noOfSubjects;k++)
  	{
  	out.print("Enter subject"+k+"&nbsp;name");
  	out.print("<input name='"+branchName+y+"subject"+k+"' type='text' size='10'maxlength='30' /><br>");
  }
  }
  out.print("<br><br><br><hr>")
  }
   %>
   <input name="next" type="submit" value="next" />
    </form>
      
  </body>
</html>

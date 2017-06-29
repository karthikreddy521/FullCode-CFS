<%@ page language="java"  pageEncoding="ISO-8859-1"%>

<%@page import="serviceLayer.CourseFactory"%>

<%@page import="java.util.ArrayList"%>
<%@page import="serviceLayer.Branch"%>
<%@page import="serviceLayer.Year"%>
<%@page import="others.Spell"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'StoreBranches.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../styles.css">
 <link rel="stylesheet" type="text/css" href="../styles.css">
 
  </head>
  
  <body> 
<form action="StoreNoOfSubjects.jsp" method="post"><div align="center">  
   <%
   int noOfBranches=CourseFactory.getCourse().getNoOfBranches();
   int duration=CourseFactory.getCourse().getDuration();
   for(int i=1;i<=noOfBranches;i++){
   
    String name=request.getParameter("branch"+i);
    Branch branch=new Branch();
    branch.setBranchName(name);
    ArrayList<Branch> branchs=CourseFactory.getCourse().getBranch();
    ArrayList<Year> years=branch.getYear();
    out.println("<br>  <big>Enter The Details Of &nbsp;"+name+"&nbsp; Branch</big><br><br>");
    for(int j=1;j<=duration;j++)
    {
    	Year year=new Year();
    	year.setYear(j);
    	years.add(year);
    	
       %> 
        No of subjects in <%=Spell.spellIntToTHForm(j)%> year
        <select name="<%=name+j%>">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
  <option value="6">6</option>
  <option value="7">7</option>
  <option value="8">8</option>
  <option value="9">9</option>
  <option value="10">10</option>
  <option value="11">11</option>
  <option value="12">12</option>
  <option value="13">13</option>
  <option value="14">14</option>
  <option value="15">15</option>
  <option value="16">16</option>
  <option value="17">17</option>
  <option value="18">18</option>
  <option value="19">19</option>  
</select>
        
        
        
        
        
       No of sections in<%=Spell.spellIntToTHForm(j)%>year
       <select name='<%=name+j+"sections"%>'>
        <option>1</option>
         <option>2</option>
          <option>3</option>
          </select><br><br><br>
          <hr>
       <%
    }
    branchs.add(branch);
    
    
   }
   
    %>
    <input name="next" type="submit" value="next" />
    </div>
    </form>
                                                                                                      
  </body>
</html>

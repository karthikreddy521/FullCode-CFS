<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.CollegeFeedBack"%>
<%@page import="serviceLayer.Feedback"%>
<%@page import="serviceLayer.StoreFeedBack"%>
<%@page import="serviceLayer.StudentStatus"%>
<%@page import="serviceLayer.GetStudentsStatus"%>


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

  </head>
  
  <body>
    <%
    Feedback feedback=(Feedback)session.getAttribute("feedbackObject");
    CollegeFeedBack collegeFeedBack=new CollegeFeedBack();
    ArrayList<Integer> features=new ArrayList<Integer>();
    for(int i=1;i<=10;i++)
    {
    Integer f=Integer.parseInt(request.getParameter("feature"+i));
    features.add(f);
    }
    collegeFeedBack.setFeatures(features);
    feedback.setCollegeFeedBack(collegeFeedBack);
    
    boolean flag=StoreFeedBack.saveFeedBack(feedback);
    
    if(flag)
    {
    ArrayList<StudentStatus> studentStatusArrayList=GetStudentsStatus.getStudents();
    int statusLength=studentStatusArrayList.size();
    String id=feedback.getStudentId();
    String studentId;
    for(int i=0;i<statusLength;i++)
    {
    StudentStatus studentStatus=studentStatusArrayList.get(i);
    studentId=studentStatus.getStudentId();
    if(id.equals(studentId))
    {
    System.out.println("AddCollegefeedback  student"+studentId+"status changed");
       studentStatus.setStatus(2);
     System.out.println("currentstatus"+studentStatus.getStatus());  
       break;
    }
    
    
    }
     %>
   -------FEED BACK SUCCESSFULLY SUBMITED--------<br><br><br>
   <a href="../login.jsp">LOG OFF</a><br>
     <a href="ChangePassword.jsp">Changepassword</a>
    <%
    }
    else
    {
    %>
    
    --------ERROR WHILE STORIND DATA TO DATA BASE------
    <a href="../login.jsp">LOG OFF</a>
    
    <%
    }
   %>
  </body>
</html>

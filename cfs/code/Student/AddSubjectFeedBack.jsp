<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="serviceLayer.Feedback"%>
<%@page import="serviceLayer.FaculityFeedBack"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'AddSubjectFeedBack.jsp' starting page</title>
    
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
    Feedback feedback=(Feedback)session.getAttribute("feedbackObject");
   
    
    
    FaculityFeedBack faculityFeedBack=new FaculityFeedBack();
    faculityFeedBack.setSubject(subject);
    
    ArrayList<Integer> features=new ArrayList<Integer>();
    for(int i=1;i<=15;i++)
    {
    Integer f=Integer.parseInt(request.getParameter("feature"+i));
    features.add(f);
    }
    faculityFeedBack.setFeatures(features);
    feedback.getFaculityFeedBackArrayList().add(faculityFeedBack);
     %>
     <jsp:forward page="FeedBack.jsp"/>
  </body>
</html>

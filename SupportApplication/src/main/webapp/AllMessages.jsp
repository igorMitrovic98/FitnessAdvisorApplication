<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="beans.MessageBean"%>
<%@page import="java.util.*" %>
<jsp:useBean id="messageService" class="services.MessageService" scope="application"></jsp:useBean>
<jsp:useBean id="supportService" class="services.SupportService" scope="session"></jsp:useBean>
<jsp:useBean id="supportBean" class="beans.SupportBean" scope="session"></jsp:useBean>
<%
	if(!(supportBean.isLoggedIn())) response.sendRedirect("SignIn.jsp");
%>
<%
	List<MessageBean> messages = messageService.getAllMessages();
%>
<%
	if(request.getParameter("search") != null){
		String content = request.getParameter("content");
		messages = messageService.getByContent(content);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Messages</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<style>
	table,td,th{
		text-align:center;
	}
</style>
</head>
<body class="container-fluid">
	<header style="margin-right:20px;margin-top:20px" class="float-end containter-fluid">
		<a style="font-size:20px;" href="Sign-out.jsp">Logout</a>
	</header>
	<form class="form-inline" action="AllMessages.jsp" method="post">
	<div class="col-md-3">
	<h3>Search messages by content</h3>
		<input class="form-control" style="margin-bottom:10px" autocomplete="off" name="content" placeholder="Content" type="text" />
		<button class="w-100 btn btn-lg btn-primary" name="search" type="submit">Search</button>
	</div>
	</form>
	<div class="container-fluid">
		<table class="table">
			<thead>
			    <tr>
			      <th scope="col">Sender</th>
			      <th scope="col">Message</th>
			      <th scope="col">Date</th>
			      <th scope="col">Action</th>
				</tr>
			  </thead>
			  <tbody>
			  <%
			  	for(MessageBean message : messages){
			 
			  		out.println("<tr><td >"+(supportService.getUserByUsername(message.getSenderName())).getUsername()+"</td>"+
			  	"<td style='overflow:hidden;white-space:nowrap;width:620px;'>"+message.getContent()+"</td><td style='width:150px;'>"+message.getDateTime()+"</td>"+
			  		"<td><a href='SingleMessage.jsp?id="+messageService.updateById(message.getId())+"' target='_blank'>Message Preview</a></td></tr>");
			  	}
			  %>
			  </tbody>
		</table>
	</div>
	
</body>
</html>
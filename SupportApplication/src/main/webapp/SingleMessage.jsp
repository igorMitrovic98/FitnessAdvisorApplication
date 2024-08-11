<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="beans.*"%>
<%@page import="java.util.*" %>
<jsp:useBean id="messageService" class="services.MessageService" scope="application"></jsp:useBean>
<jsp:useBean id="supportService" class="services.SupportService" scope="session"></jsp:useBean>
<jsp:useBean id="supportBean" class="beans.SupportBean" scope="session"></jsp:useBean>
<%
	if(!(supportBean.isLoggedIn())) response.sendRedirect("SignIn.jsp");
%>
<%	
	String a = request.getParameter("id");
	Integer id = Integer.parseInt(a);
	MessageBean message = messageService.getMessageById(id);
	UserBean user = supportService.getUserByUsername(message.getSenderName());
	
	if (request.getParameter("send") != null) {
	
		String reply = request.getParameter("replyContent");
		session.setAttribute("reply", reply);
		session.setAttribute("email",user.getEmail());
		System.out.println(reply);
		response.sendRedirect("Email.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message <%=id %></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
</head>
<body style="display:flex;flex-direction:column;justify-content:center;align-items:center;height:100vh" class="containter-fluid">
		<p style="text-align:center;font-size:20px">Sender: <b><%=message.getSenderName() %></b></p>
		<br>
		<div style="border:2px solid black" class="container-fluid">
			<p style="text-align:center;"><i><%=message.getContent()%></i></p>
		</div>
		<br>
		<div>
		<form id="emailResponse" class="form-inline text-center" action="" method="post" >
		<h3 style="text-align:center;">Reply</h3>
		<textarea  style="resize:none;" rows="8" cols="100" wrap="soft" required class="form-control" autocomplete="off" name="replyContent" placeholder="Type a reply" ></textarea>
		<br>
		<input class="form-control" type="file" id="myfile" name="myfile">
	
		<hr>
		<br>
		<button class=" w-50 btn btn-lg btn-primary"  name="send" type="submit">Send</button>
	
	</form>
	</div>
</body>
</html>
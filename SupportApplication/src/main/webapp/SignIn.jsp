<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.SupportBean" %>
<jsp:useBean id="supportBean" class="beans.SupportBean" scope="session"></jsp:useBean>
<jsp:useBean id="supportService" class="services.SupportService" scope="application"></jsp:useBean>
<jsp:setProperty property="username" name="supportBean" param="username"></jsp:setProperty>
<jsp:setProperty property="password" name="supportBean" param="password"></jsp:setProperty>
<%
	if(request.getParameter("submit") != null) {
		SupportBean support = supportService.login(supportBean.getUsername(), supportBean.getPassword());
		if (support != null) {
			supportBean.setLoggedIn(true);
			supportBean.setFirstName(support.getFirstName());
			supportBean.setLastName(support.getLastName());
			session.setAttribute("notify", "");
			response.sendRedirect("AllMessages.jsp");
		} else {
			session.setAttribute("notify", "Username or password not valid.");
			supportBean.setLoggedIn(false);
		}
	} else {
		session.setAttribute("notify", "");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign-In</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<style>
	.form-signin {
    width: 100%;
    max-width: 330px;
    padding: 15px;
    margin: auto;
  }
  .patterns:focus::placeholder {
    color: #6c757d;
  }
  body{
  	display: flex;
  	flex-direction: column;
  	height: 100vh;
  }
  @media (min-width: 768px) {
    .bd-placeholder-img-lg {
      font-size: 3.5rem;
    }
  }
   .con{
    width: 100%;
    height: 100%;
    justify-content: center;
    align-items: center;
    display: flex;
    
  }
</style>
</head>
<body class="container-fluid">
		<div class="contaiter-fluid con">
		<div class="form-signin">
		<form action="SignIn.jsp" method="post">
		<h2 style="text-align:center">Sign into your support account</h2>
		 <input type="text" class="form-control" name="username"  autocomplete="off" placeholder="Username" >
          <br>
           <input style="margin-bottom: 10px;" type="password" name="password" class="form-control" placeholder="Password">
          <br>
          <button class="w-100 btn btn-lg btn-primary" name="submit" type="submit">Sign in</button>
          <%=session.getAttribute("notify").toString()%>
         </form>
         </div>
         </div>

</body>
</html>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
 
<%
   String result;
   String host = "localhost";
 
   // Get properties object
 
 // Get a Properties object
    Properties prop = new Properties();
    //prop.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
    final String username = "ip118817@gmail.com";
    final String password = "qwpjydzgyurbxgei";
 
    prop.put("mail.smtp.host", "smtp.gmail.com");
    prop.put("mail.store.protocol", "pop3");
    prop.put("mail.transport.protocol","smtp");
    prop.put("mail.smtp.auth", "true");
    prop.put("mail.debug", "true");
    prop.put("mail.smtp.starttls.enable", "true");
    prop.put("mail.user",username);
    prop.put("mail.password",password);
    prop.put("mail.smtp.port", "465");
    prop.put("mail.smtp.socketFactory.port", "465");  
    prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
    prop.put("mail.smtp.socketFactory.fallback", "false");  
   
    
    try{
      Session session1 = Session.getInstance(prop, 
                          new Authenticator(){
    	  					@Override
                             protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(username, password);
                             }});
	
     final String emailToSend = session.getAttribute("email").toString();
     System.out.println(emailToSend);
      MimeMessage message = new MimeMessage(session1);
      message.setFrom(new InternetAddress(username));
      message.addRecipient(
       Message.RecipientType.TO,new InternetAddress(emailToSend));
      message.setSubject("Support response - fitness");

     final String msg = session.getAttribute("reply").toString();

      /*MimeBodyPart mimeBodyPart = new MimeBodyPart();
      mimeBodyPart.setContent(msg, "text/html; charset=utf-8");

      Multipart multipart = new MimeMultipart();
      multipart.addBodyPart(mimeBodyPart);*/

      message.setText(msg);

      Transport.send(message);
   // -- Create a new message --
   /*   Message msg = new MimeMessage(sessionA);
   
   String emailToSend = session.getAttribute("email").toString();

   // -- Set the FROM and TO fields --
      msg.setFrom(new InternetAddress("ip118817@gmail.com"));
      msg.setRecipients(Message.RecipientType.TO, 
                        InternetAddress.parse(emailToSend));
      msg.setSubject("Support response - fitness");
      
      String replyContent = session.getAttribute("reply").toString();
      
      msg.setText(replyContent);
      msg.setSentDate(new Date());
      Transport.send(msg);*/
      
      //System.out.println("Message sent.");
      result = "Sent successfully to: " + emailToSend;
    }catch (MessagingException e){
    	result="An Error occured.";
    	e.printStackTrace();

    }
%>
 
<html>
   <head>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>Email</title>
    	<script>
    	function closeThis(){
    		window.close();
    	}
    </script>
   </head>
  
   <body>
       
       <div style="height: 100vh; display: flex; justify-content: center; align-items: center; flex-direction: column;">
       		<h1>Email</h1>
       		<%
          		out.println(result + "\n");
       		%>
			<button style="margin-top:10px" class="btn btn-primary" onclick="closeThis()">CLOSE THIS TAB</button>
		
       </div>
   
   </body>
</html>
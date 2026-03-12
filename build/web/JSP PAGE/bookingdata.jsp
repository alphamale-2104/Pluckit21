<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.sql.*" %>

<%

String name1 = request.getParameter("name");
String email1 = request.getParameter("email");
String mobile1 = request.getParameter("mobile");
String date1 = request.getParameter("date");
String people1 = request.getParameter("people");

String adults1 = request.getParameter("adults");
String children1 = request.getParameter("children");
String timeslot1 = request.getParameter("timeslot");

String submit = request.getParameter("btn");

if(submit != null && submit.equals("Book"))
{
try
{

// DATABASE CONNECTION
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://sql12.freesqldatabase.com:3306/sql12819535?useSSL=false&allowPublicKeyRetrieval=true",
"sql12819535",
"pZ4mgQ6Z11");

Statement st = con.createStatement();

String query = "INSERT INTO book(name1,email1,mobile1,date1,people1,adults,children,timeslot) VALUES('"
+ name1 + "','"
+ email1 + "','"
+ mobile1 + "','"
+ date1 + "','"
+ people1 + "','"
+ adults1 + "','"
+ children1 + "','"
+ timeslot1 + "')";

st.executeUpdate(query);


// TICKET LINK
String ticketLink = "https://pluckit21-13.onrender.com/ticket.jsp?name=" 
+ java.net.URLEncoder.encode(name1,"UTF-8")
+ "&date=" + java.net.URLEncoder.encode(date1,"UTF-8")
+ "&time=" + java.net.URLEncoder.encode(timeslot1,"UTF-8")
+ "&adults=" + adults1
+ "&children=" + children1;


// EMAIL SENDING
try
{

final String to = email1;
final String from = "biramanepranav04@gmail.com";
final String password = System.getenv("BREVO_SMTP_KEY");
Properties props = new Properties();
props.put("mail.smtp.host","smtp-relay.brevo.com");
props.put("mail.smtp.port","2525");
props.put("mail.smtp.auth","true");
props.put("mail.smtp.starttls.enable","true");
props.put("mail.smtp.connectiontimeout","20000");
props.put("mail.smtp.timeout","20000");
props.put("mail.smtp.writetimeout","20000");

Session mailSession = Session.getInstance(props,
new javax.mail.Authenticator()
{
protected PasswordAuthentication getPasswordAuthentication()
{
return new PasswordAuthentication(from,password);
}
});

//

MimeMessage message = new MimeMessage(mailSession);

message.setFrom(new InternetAddress(from));
message.setRecipient(Message.RecipientType.TO,new InternetAddress(to));

message.setSubject("Strawberry Farm Booking Confirmation","UTF-8");

message.setContent(

"<h2>Strawberry Farm Booking Confirmation</h2>"

+ "<p>Hello <b>"+name1+"</b>,</p>"
+ "<p>Your Strawberry Farm visit is confirmed.</p>"

+ "<p>"
+ "<b>Date:</b> "+date1+"<br>"
+ "<b>Time Slot:</b> "+timeslot1+"<br>"
+ "<b>Adults:</b> "+adults1+"<br>"
+ "<b>Children:</b> "+children1
+ "</p>"

+ "<p>"
+ "<a href='"+ticketLink+"' "
+ "style='background:#ff4d6d;color:white;padding:10px 15px;text-decoration:none;border-radius:5px;'>"
+ "Download Your Ticket"
+ "</a>"
+ "</p>"

+ "<p>Please arrive 10 minutes before your slot.</p>"
+ "<p>Thank you for booking with us.</p>"

,"text/html");

Transport.send(message);

}
catch(Exception mailError)
{
out.println("Mail Error: " + mailError.getMessage());
}


// SUCCESS MESSAGE
out.println("<script>");
out.println("alert('Farm visit booked successfully. Confirmation email sent.');");
out.println("window.location='../booking.html';");
out.println("</script>");

con.close();

}
catch(Exception e)
{
out.println("Error = " + e.getMessage());
}

}

%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>

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
        // ------------------------
        // DATABASE CONNECTION
        // ------------------------
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12819535?useSSL=false&allowPublicKeyRetrieval=true",
            "sql12819535",
            "pZ4mgQ6Z11"
        );

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

        // ------------------------
        // TICKET LINK
        // ------------------------
       String ticketLink = request.getScheme() + "://" 
    + request.getServerName() 
    + request.getContextPath() 
    + "/ticket.jsp?name=" 
    + URLEncoder.encode(name1,"UTF-8")
    + "&date=" + URLEncoder.encode(date1,"UTF-8")
    + "&time=" + URLEncoder.encode(timeslot1,"UTF-8")
    + "&adults=" + adults1
    + "&children=" + children1;

        // ------------------------
        // EMAIL SENDING (BREVO API)
        // ------------------------
        try
        {
            final String to = email1;
            final String apiKey = System.getenv("BREVO_API_KEY"); // Your API key in Render

            URL url = new URL("https://api.brevo.com/v3/smtp/email");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("accept","application/json");
            conn.setRequestProperty("content-type","application/json");
            conn.setRequestProperty("api-key", apiKey);

            String jsonPayload = "{"
                + "\"sender\":{\"name\":\"Strawberry Farm\",\"email\":\"biramanepranav04@gmail.com\"},"
                + "\"to\":[{\"email\":\"" + to + "\"}],"
                + "\"subject\":\"Strawberry Farm Booking Confirmation\","
                + "\"htmlContent\":\"<h2>Strawberry Farm Booking Confirmation</h2>"
                + "<p>Hello <b>" + name1 + "</b>,</p>"
                + "<p>Your Strawberry Farm visit is confirmed.</p>"
                + "<p><b>Date:</b> " + date1 + "<br>"
                + "<b>Time Slot:</b> " + timeslot1 + "<br>"
                + "<b>Adults:</b> " + adults1 + "<br>"
                + "<b>Children:</b> " + children1 + "</p>"
                + "<p><a href='" + ticketLink + "' style='background:#ff4d6d;color:white;padding:10px 15px;text-decoration:none;border-radius:5px;'>Download Your Ticket</a></p>"
                + "<p>Please arrive 10 minutes before your slot.</p>"
                + "<p>Thank you for booking with us.</p>\""
                + "}";

            OutputStream os = conn.getOutputStream();
            os.write(jsonPayload.getBytes("UTF-8"));
            os.flush();
            os.close();

            int responseCode = conn.getResponseCode();
            if(responseCode >= 200 && responseCode < 300){
                System.out.println("Email sent successfully via Brevo API.");
            } else {
                System.out.println("Email failed via Brevo API. Response code: " + responseCode);
            }

        }
        catch(Exception mailError)
        {
            System.out.println("Email Error: " + mailError.getMessage());
        }

        // ------------------------
        // SUCCESS MESSAGE
        // ------------------------
        out.println("<script>");
        out.println("alert('Farm visit booked successfully.');");
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String name = request.getParameter("name");
String date = request.getParameter("date");
String time = request.getParameter("time");
String adults = request.getParameter("adults");
String children = request.getParameter("children");
%>

<!DOCTYPE html>
<html>
<head>
<title>Strawberry Farm Ticket</title>

<style>

body{
font-family: 'Segoe UI', Arial;
background: linear-gradient(135deg,#ff9a9e,#fad0c4);
height:100vh;
display:flex;
justify-content:center;
align-items:center;
margin:0;
}

.ticket{
width:420px;
background:white;
border-radius:15px;
overflow:hidden;
box-shadow:0px 8px 25px rgba(0,0,0,0.3);
}

.header{
background:#ff4d6d;
color:white;
padding:20px;
font-size:22px;
font-weight:bold;
letter-spacing:1px;
}

.ticket-body{
padding:25px;
}

.details p{
font-size:18px;
margin:10px 0;
border-bottom:1px dashed #ccc;
padding-bottom:5px;
}

.note{
margin-top:15px;
background:#fff3cd;
padding:10px;
border-left:5px solid #ffc107;
font-size:15px;
}

.footer{
text-align:center;
padding:20px;
}

button{
padding:12px 25px;
background:#ff4d6d;
color:white;
border:none;
border-radius:6px;
font-size:16px;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#e63956;
transform:scale(1.05);
}

</style>

<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<script>

function downloadTicket(){

html2canvas(document.querySelector(".ticket")).then(canvas => {

var link=document.createElement("a");
link.download="StrawberryFarmTicket.jpg";
link.href=canvas.toDataURL();
link.click();

});

}

</script>

</head>

<body>

<div class="ticket">

<div class="header">
🍓 Strawberry Farm Entry Ticket
</div>

<div class="ticket-body">

<div class="details">

<p><b>Name :</b> <%=name%></p>
<p><b>Date :</b> <%=date%></p>
<p><b>Time :</b> <%=time%></p>
<p><b>Adults :</b> <%=adults%></p>
<p><b>Children :</b> <%=children%></p>

</div>

<div class="note">
<b>Important Note:</b> A child below 12 years has free entry in the farm.
</div>

</div>

<div class="footer">
<button onclick="downloadTicket()">Download Ticket</button>
</div>

</div>

</body>
</html>
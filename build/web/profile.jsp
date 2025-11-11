<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="dbconnect.jsp" %> <!-- DB connection included -->
<%@ page import="java.sql.*" %>

<%
String userEmail = (String) session.getAttribute("userEmail");
if(userEmail == null){
    response.sendRedirect("signin.jsp");
    return;
}

String dbuserName = "";
String profile = null;

// Fetch user data from DB
try {
    
    PreparedStatement ps = conn.prepareStatement("SELECT name, profile FROM users WHERE email=?");
    ps.setString(1, userEmail);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        dbuserName = rs.getString("name");
        profile = rs.getString("profile"); // may be null
    }
    rs.close();
    ps.close();
} catch(Exception e) {
    e.printStackTrace();
}
%>

<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<style>
body {
    margin:0;
    padding:0;
    background:#f0f4f8;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    display:flex;
    flex-direction:column;  /* Stack content vertically */
    min-height:100vh;
}

.main-wrapper {
    flex:1;                 /* Take remaining space */
    display:flex;
    justify-content:center;
    align-items:center;
    margin-top:10%;
    margin-bottom:10%;
}

.card {
    width:380px;
    background:#fff;
    text-align:center;
    padding:30px 20px;
    border-radius:20px;
    box-shadow:0 8px 20px rgba(0,0,0,0.1);
    transition:transform 0.3s, box-shadow 0.3s;
}

.card:hover {
    transform:translateY(-5px);
    box-shadow:0 12px 25px rgba(0,0,0,0.15);
}

.title {
    font-size:28px;
    font-weight:700;
    color:#1a3e72;
    margin-bottom:8px;
}

.email {
    color:#3b5998;
    font-size:16px;
    margin-bottom:25px;
}

.photo-box {
    width:260px;
    height:260px;
    margin:0 auto 20px;
    background:#f9f9f9;
    border-radius:15px;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
    overflow:hidden;
    position:relative;
    cursor:pointer;
    transition:transform 0.3s;
}

.photo-box img {
    width:100%;
    height:100%;
    object-fit:cover;
    border-radius:12px;
    transition:transform 0.3s;
}

.photo-box:hover img {
    transform:scale(1.05);
}

.overlay {
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.4);
    color:white;
    font-size:18px;
    display:flex;
    justify-content:center;
    align-items:center;
    border-radius:12px;
    opacity:0;
    transition:opacity 0.3s;
}

.photo-box:hover .overlay {
    opacity:1;
}

.update-btn {
    margin-top:10px;
    padding:12px 30px;
    background-color:#007bff;
    color:#fff;
    font-size:16px;
    font-weight:600;
    border-radius:10px;
    border:none;
    cursor:pointer;
    transition:background 0.3s;
}

.update-btn:hover {
    background-color:#0056b3;
}

input[type=file] {
    display:none;
}
</style>
</head>
<body>
<div class="main-wrapper">
<div class="card">
    <div class="title">Hey! I'm <%= userName %></div>
    <div class="email"><%= userEmail %></div>

    
        <div class="photo-box">
           <img id="profileImg" 
     src="images/p.png" 
     alt="Profile Photo">
        </div>
     
</div>
</div>
<script>
const imgBox = document.querySelector('.photo-box');
const input = document.getElementById('profilePicInput');
const img = document.getElementById('profileImg');

imgBox.addEventListener('click', () => input.click());

input.addEventListener('change', function(){
    const file = this.files[0];
    if(file){
        const reader = new FileReader();
        reader.onload = function(e){ img.src = e.target.result; }
        reader.readAsDataURL(file);
    }
});
</script>

<!-- Include Footer -->
<%@ include file="Footer.jsp" %>

</body>
</html>

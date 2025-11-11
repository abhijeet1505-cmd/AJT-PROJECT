<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if(email != null && password != null){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            // ✅ Updated DB name
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/mainproject?useSSL=false&allowPublicKeyRetrieval=true",
                "root", ""   // your MySQL password
            );

            // ✅ Updated table name: reg
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM reg WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                session.setAttribute("userEmail", email);
                session.setAttribute("userName", rs.getString("name"));
%>
<script>alert('Login Successful!'); window.location.href='index.jsp';</script>
<%
            } else {
%>
<script>alert('Invalid Email or Password!');</script>
<%
            }

            rs.close();
            ps.close();
            conn.close();
        }catch(Exception e){
%>
<script>alert('Database Error: <%= e.getMessage() %>');</script>
<%
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign In - Cyber Security</title>
<style> /* Reset */ * { margin:0; padding:0; box-sizing:border-box; } body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; min-height: 100vh; display: flex; justify-content: center; align-items: center; /* New gradient background */ background: linear-gradient( to bottom right, #e8e3f5 0%, /* Light lavender */ #e3ecf7 50%, /* Soft blue */ #dff0fa 100% /* Very light blue */ ); /* Optional: overlay a darker color (#263675) */ /* background: linear-gradient(to bottom right, #263675, #e8e3f5, #dff0fa); */ } /* Container */ .auth-container { background:#fff; border-radius:16px; box-shadow:0 20px 50px rgba(0,0,0,0.2); width:100%; max-width:420px; padding:40px; } h2 { text-align:center; font-size:28px; color:#333; margin-bottom:25px; } p { text-align:center; color:#666; font-size:14px; margin-bottom:30px; } /* Form */ form { display:flex; flex-direction:column; gap:15px; } input { padding:14px 18px; border-radius:12px; border:1px solid #ccc; font-size:15px; transition:0.3s; } input:focus { border-color:#667eea; outline:none; box-shadow:0 0 8px rgba(102,126,234,0.2); } button { padding:14px; background:#667eea; color:#fff; font-size:16px; font-weight:600; border:none; border-radius:12px; cursor:pointer; transition:0.3s; } button:hover { background:#5a67d8; transform:translateY(-2px); box-shadow:0 8px 20px rgba(102,126,234,0.3); } /* Links */ .redirect { text-align:center; margin-top:20px; font-size:14px; color:#666; } .redirect a { color:#667eea; text-decoration:none; font-weight:600; transition:0.3s; } .redirect a:hover { color:#5a67d8; } /* Responsive */ @media(max-width:480px){ .auth-container { padding:30px; } h2{ font-size:24px; } } </style>
</head>

<body>
    <div class="auth-container">
        <h2>Sign In</h2>
        <p>Welcome back! Enter your credentials to access your account.</p>

        <form method="post">
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Sign In</button>
        </form>

        <div class="redirect">
            Don't have an account? <a href="signup.jsp">Sign Up</a>
        </div>
    </div>
</body>
</html>

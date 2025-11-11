<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirm = request.getParameter("confirm_password");

    if(name != null && email != null && password != null && confirm != null){
        if(password.equals(confirm)){
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");

                // ✅ Updated database name
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mainproject?useSSL=false&allowPublicKeyRetrieval=true",
                    "root", ""
                );

                // ✅ Updated table name to reg
                PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO reg(name, email, password) VALUES(?,?,?)"
                );

                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, password);

                ps.executeUpdate();
                ps.close();
                conn.close();
%>
<script>
    alert('Signup successful! Please sign in.');
    window.location.href='signin.jsp';
</script>
<%
            } catch(Exception e){
%>
<script>alert('Database Error: <%= e.getMessage() %>');</script>
<%
            }
        } else {
%>
<script>alert('Passwords do not match!');</script>
<%
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up - Cyber Security</title>

<style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(to bottom right, #e8e3f5, #e3ecf7, #dff0fa);
    }
    .auth-container {
        background:#fff;
        border-radius:16px;
        box-shadow:0 20px 50px rgba(0,0,0,0.2);
        width:100%; max-width:420px;
        padding:40px;
    }
    h2 { text-align:center; font-size:28px; color:#333; margin-bottom:25px; }
    p { text-align:center; color:#666; font-size:14px; margin-bottom:30px; }
    form { display:flex; flex-direction:column; gap:15px; }
    input {
        padding:14px 18px; border-radius:12px; border:1px solid #ccc;
        font-size:15px; transition:0.3s;
    }
    input:focus {
        border-color:#667eea; outline:none;
        box-shadow:0 0 8px rgba(102,126,234,0.2);
    }
    button {
        padding:14px; background:#667eea; color:#fff;
        font-size:16px; font-weight:600; border:none;
        border-radius:12px; cursor:pointer; transition:0.3s;
    }
    button:hover {
        background:#5a67d8; transform:translateY(-2px);
        box-shadow:0 8px 20px rgba(102,126,234,0.3);
    }
    .redirect { text-align:center; margin-top:20px; font-size:14px; color:#666; }
    .redirect a { color:#667eea; text-decoration:none; font-weight:600; }
    .redirect a:hover { color:#5a67d8; }
</style>

</head>
<body>
    <div class="auth-container">
        <h2>Sign Up</h2>
        <p>Create your account and start your cybersecurity journey.</p>

        <!-- ✅ Form posts to same JSP -->
        <form method="post">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="password" name="confirm_password" placeholder="Confirm Password" required>
            <button type="submit">Sign Up</button>
        </form>

        <div class="redirect">
            Already have an account? <a href="signin.jsp">Sign In</a>
        </div>
    </div>
</body>
</html>

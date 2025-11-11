<%-- 
    Document   : register
    Created on : 05-Nov-2025, 7:11:25 pm
    Author     : Aman
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register - Cyber Awareness Portal</title>

  <!-- FontAwesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

  <!-- Embedded CSS -->
  <style>
    /* Global styles */
    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background: #f0f4f8;
    }

    /* Sidebar overlay */
    #overlay {
        position: fixed;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: rgba(0,0,0,0.5);
        display: none;
        z-index: 9;
    }

    #overlay.show {
        display: block;
    }

   

    /* Register container */
    .register-container {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
    }

    .form-box {
        width: 400px;
        background: #fff;
        border-radius: 12px;
        padding: 35px 30px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        text-align: center;
    }

    .form-box h1 {
        font-size: 28px;
        color: #1a3e72;
        margin-bottom: 10px;
    }

    .form-box h1 i {
        margin-right: 8px;
        color: #007bff;
    }

    .form-box p {
        color: #555;
        margin-bottom: 25px;
    }

    .input-group {
        margin-bottom: 18px;
        text-align: left;
    }

    .input-group label {
        font-weight: 600;
        margin-bottom: 6px;
        display: block;
        color: #1a3e72;
    }

    .input-group i {
        margin-right: 5px;
        color: #007bff;
    }

    .input-group input {
        width: 100%;
        padding: 12px;
        border-radius: 8px;
        border: 1px solid #ccc;
        outline: none;
        transition: 0.3s;
    }

    .input-group input:focus {
        border-color: #007bff;
    }

    .register-btn {
        width: 100%;
        padding: 12px;
        background: #007bff;
        border: none;
        border-radius: 8px;
        color: #fff;
        font-size: 17px;
        font-weight: 600;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 10px;
    }

    .register-btn:hover {
        background: #0056b3;
    }

    .login-link {
        margin-top: 18px;
        font-size: 15px;
    }

    .login-link a {
        color: #007bff;
        font-weight: bold;
    }

    /* Alert message */
    .alert {
        background: #ffdddd;
        color: #d8000c;
        padding: 10px 15px;
        border-radius: 6px;
        margin-bottom: 15px;
        text-align: center;
        font-weight: 600;
    }

    /* Responsive */
    @media (max-width:768px) {
        .form-box {
            width: 100%;
            padding: 30px 20px;
        }
    }

  </style>
</head>

<body>


    <!-- Overlay -->
    <div id="overlay"></div>

    <div class="register-container">
        <div class="form-box">
            <h1><i class="fa-solid fa-user-shield"></i> Register</h1>
            <p>Create your account to access Cyber Awareness Portal</p>

            <% 
                String message = (String) request.getAttribute("message");
                if (message != null) { 
            %>
                <div class="alert"><%= message %></div>
            <% } %>

            <form action="RegisterServlet" method="post">
                <div class="input-group">
                    <label><i class="fa-solid fa-user"></i> Full Name</label>
                    <input type="text" name="name" required>
                </div>

                <div class="input-group">
                    <label><i class="fa-solid fa-envelope"></i> Email</label>
                    <input type="email" name="email" required>
                </div>

                <div class="input-group">
                    <label><i class="fa-solid fa-lock"></i> Password</label>
                    <input type="password" name="password" required>
                </div>

                <button type="submit" class="register-btn">Register</button>

                <p class="login-link">
                    Already have an account? <a href="login.jsp">Login here</a>
                </p>
            </form>
        </div>
    </div>


    <!-- Sidebar script -->
    <script>
      const sidebar = document.getElementById("sidebar");
      const toggleBtn = document.getElementById("toggle-btn");
      const overlay = document.getElementById("overlay");

      toggleBtn.addEventListener("click", () => {
        sidebar.classList.toggle("open");
        overlay.classList.toggle("show");
      });

      overlay.addEventListener("click", () => {
        sidebar.classList.remove("open");
        overlay.classList.remove("show");
      });
    </script>

</body>
</html>

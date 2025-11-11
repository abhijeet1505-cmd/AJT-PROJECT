<%-- 
    Document   : login
    Created on : 05-Nov-2025, 7:11:03 pm
    Author     : Aman
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - SecureIntel</title>

    <!-- ✅ FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <!-- ✅ FULL CSS ADDED -->
    <style>

        /* ----------- GLOBAL ----------- */
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f0f4f8;
        }

        .page-content {
            padding: 40px;
        }

        /* Overlay for sidebar in mobile */
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

        /* ----------- AUTH BOX ----------- */
        .auth-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 80px);
        }

        .auth-box {
            width: 380px;
            background: #fff;
            padding: 35px 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            text-align: center;
        }

        .auth-box h2 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 10px;
            color: #1a3e72;
        }

        .auth-subtext {
            color: #555;
            margin-bottom: 25px;
        }

        .auth-form {
            text-align: left;
        }

        .input-group {
            margin-bottom: 18px;
        }

        .input-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
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

        .btn-primary {
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
        }

        .btn-primary:hover {
            background: #0056b3;
        }

        .auth-alt {
            margin-top: 18px;
            font-size: 15px;
        }

        .auth-alt .link {
            color: #007bff;
            font-weight: bold;
        }

       
    </style>
</head>

<body>


    <!-- ✅ MAIN PAGE CONTENT -->
    <main class="page-content">
        <section class="auth-container">
            <div class="auth-box">
                <h2>Login to Your Account</h2>
                <p class="auth-subtext">Welcome back! Please log in to continue learning securely.</p>

<form action="LoginServlet" method="post" class="auth-form">
                    <div class="input-group">
                        <label for="email"><i class="fa-solid fa-envelope"></i> Email</label>
                        <input type="email" id="email" name="email" placeholder="Enter your email" required>
                    </div>

                    <div class="input-group">
                        <label for="password"><i class="fa-solid fa-lock"></i> Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your password" required>
                    </div>

                    <button type="submit" class="btn-primary">Login</button>
                </form>

                <p class="auth-alt">
                    Don’t have an account?
                    <a href="register.jsp" class="link">Register here</a>
                </p>
            </div>
        </section>
    </main>


    <!-- ✅ SIDEBAR SCRIPT -->
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

<%@ page import="java.sql.*, com.cyberportal.util.DBConnection" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Session check
    String userEmail = (String) session.getAttribute("userEmail");
    String userName = (String) session.getAttribute("userName");
    if (userEmail == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int totalUsers = 0;
    int totalResources = 0;

    try (Connection conn = DBConnection.getConnection()) {
        Statement stmtUsers = conn.createStatement();
        ResultSet rsUsers = stmtUsers.executeQuery("SELECT COUNT(*) AS total FROM reg");
        if (rsUsers.next()) totalUsers = rsUsers.getInt("total");
        rsUsers.close();
        stmtUsers.close();

        Statement stmtResources = conn.createStatement();
        ResultSet rsResources = stmtResources.executeQuery("SELECT COUNT(*) AS total FROM video");
        if (rsResources.next()) totalResources = rsResources.getInt("total");
        rsResources.close();
        stmtResources.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f0f4f8; color: #2d3748; }
        main.dashboard { margin-left: 260px; padding: 40px; min-height: 100vh; }
        .dashboard-header h1 { font-size: 32px; color: #1a3e72; margin-bottom: 8px; }
        .dashboard-header p { color: #718096; font-size: 16px; margin-bottom: 30px; }
        .dashboard-cards { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 25px; }
        .card { background: #fff; border-radius: 16px; padding: 25px; display: flex; align-items: center; justify-content: space-between; box-shadow: 0 4px 20px rgba(0,0,0,0.08); border: 1px solid #e2e8f0; position: relative; }
        .card::before { content: ''; position: absolute; top: 0; left: 0; width: 4px; height: 100%; background: linear-gradient(180deg, #4aa6ff, #6ec1ff); }
        .card-content { flex: 1; }
        .card-info h4 { margin: 0; color: #718096; font-size: 14px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; }
        .card-info h2 { margin: 10px 0 0 0; font-size: 36px; color: #1a3e72; font-weight: 700; }
        .card-icon { width: 70px; height: 70px; border-radius: 16px; display: flex; align-items: center; justify-content: center; font-size: 32px; background: linear-gradient(135deg, rgba(74, 166, 255, 0.1), rgba(110, 193, 255, 0.15)); color: #4aa6ff; }
    </style>
</head>
<body>

    <!-- Sidebar Include -->
    <jsp:include page="sidebar.jsp" />

    <!-- Dashboard Content -->
    <main class="dashboard">
        <section class="dashboard-header">
            <h1>Welcome back, <%= userName %>! 👋</h1>
            <p>Here's an overview of your portal.</p>
        </section>

        <section class="dashboard-cards">
            <!-- Total Users -->
            <div class="card">
                <div class="card-content">
                    <div class="card-info">
                        <h4>Total Users</h4>
                        <h2><%= totalUsers %></h2>
                    </div>
                </div>
                <div class="card-icon"><i class="fa-solid fa-users"></i></div>
            </div>

            <!-- Total Videos/Resources -->
            <div class="card">
                <div class="card-content">
                    <div class="card-info">
                        <h4>Total Videos</h4>
                        <h2><%= totalResources %></h2>
                    </div>
                </div>
                <div class="card-icon"><i class="fa-solid fa-video"></i></div>
            </div>
        </section>
    </main>

</body>
</html>

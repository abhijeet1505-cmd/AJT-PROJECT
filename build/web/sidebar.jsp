<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Prevent direct access if not logged in
    if(session.getAttribute("userName") == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<style>
    /* ===== SIDEBAR ===== */
    .sidebar { 
      width: 240px; 
      position: fixed; 
      height: 100%; 
      background: #1a3e72; 
      color: #fff; 
      padding: 20px 0; 
      box-shadow: 4px 0 20px rgba(0,0,0,0.1);
      overflow-y: auto;
    }

    .sidebar-header { 
      text-align: center; 
      padding-bottom: 20px; 
      border-bottom: 1px solid rgba(255,255,255,0.2);
    }

    .sidebar-header h2 { 
      font-size: 22px; 
      display: flex; 
      justify-content: center; 
      align-items: center; 
      gap: 10px; 
    }

    .sidebar-header i { color: #4aa6ff; }

    .sidebar-menu { margin-top: 30px; }
    .sidebar-menu ul { list-style: none; padding: 0; }
    .sidebar-menu ul li { margin: 10px 0; }
    .sidebar-menu ul li a { 
      color: rgba(255,255,255,0.85); 
      text-decoration: none; 
      padding: 10px 20px; 
      display: flex; 
      align-items: center; 
      gap: 10px; 
      border-radius: 8px;
      transition: all 0.3s;
    }
    .sidebar-menu ul li a i { width: 20px; text-align: center; }
    .sidebar-menu ul li a.active, .sidebar-menu ul li a:hover { 
      background: rgba(74, 166, 255, 0.2);
      color: #fff;
    }
</style>

<aside class="sidebar">
  <div class="sidebar-header">
                          <img src="images/logomain.png" alt="Political News Hub Logo" class="logo-img"style="width:80%;">
  </div>

  <nav class="sidebar-menu">
    <ul>
      <li><a href="admin.jsp"><i class="fas fa-gauge"></i> Dashboard</a></li>
      <li><a href="users.jsp"><i class="fas fa-users"></i> Users</a></li>
      <li><a href="resources.jsp"><i class="fas fa-layer-group"></i> Resources</a></li>
      <li><a href="logout2.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
  </nav>
</aside>

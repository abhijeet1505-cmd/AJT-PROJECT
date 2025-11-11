<%-- 
    Document   : users
    Author     : Aman
--%>

<%@ page import="java.sql.*, com.cyberportal.util.DBConnection" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Manage Users - Admin Panel</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    body { 
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
      background: #f0f4f8; 
      margin: 0; 
      color: #2d3748;
    }

    /* ===== DASHBOARD ===== */
    .dashboard { margin-left: 260px; padding: 40px; }
    .dashboard-header h1 { font-size: 28px; color: #1a3e72; margin-bottom: 5px; }
    .dashboard-header p { color: #555; margin-bottom: 25px; }

    .table-wrapper { overflow-x: auto; background: #fff; border-radius: 12px; box-shadow: 0 6px 20px rgba(0,0,0,0.05); }
    .cyber-table { width: 100%; border-collapse: collapse; }
    .cyber-table th, .cyber-table td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
    .cyber-table th { background-color: #1a3e72; color: #fff; }
    .delete-btn { background: #dc3545; color: #fff; border: none; padding: 6px 12px; border-radius: 5px; cursor: pointer; }
    .delete-btn:hover { background: #a71d2a; }
  </style>
</head>
<body>

<%
  // Prevent caching
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setHeader("Expires", "0");

  // Session check
  if (session.getAttribute("userName") == null) {
      response.sendRedirect("login.jsp");
      return;
  }
%>

<!-- ===== SIDEBAR ===== -->
<jsp:include page="sidebar.jsp" />

<!-- ===== DASHBOARD ===== -->
<main class="dashboard">
  <section class="dashboard-header">
    <h1>All Registered Users</h1>
    <p>Manage all registered users of your portal.</p>
  </section>

  <div class="table-wrapper">
    <table class="cyber-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <%
          try {
              Connection conn = DBConnection.getConnection();
              PreparedStatement ps = conn.prepareStatement("SELECT * FROM reg"); // fetch from reg table
              ResultSet rs = ps.executeQuery();

              while (rs.next()) {
                  int id = rs.getInt("id");
                  String name = rs.getString("name");
                  String email = rs.getString("email");
        %>
        <tr>
          <td><%= id %></td>
          <td><%= name %></td>
          <td><%= email %></td>
          <td>
            <form action="DeleteUserServlet" method="post" style="display:inline;">
              <input type="hidden" name="id" value="<%= id %>">
              <button type="submit" class="delete-btn">Delete</button>
            </form>
          </td>
        </tr>
        <%
              }
              rs.close();
              ps.close();
              conn.close();
          } catch(Exception e){
              e.printStackTrace();
          }
        %>
      </tbody>
    </table>
  </div>
</main>

</body>
</html>

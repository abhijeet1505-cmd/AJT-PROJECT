<%@ page import="java.sql.*, com.cyberportal.util.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin | Resource Management</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
body { font-family: 'Segoe UI', sans-serif; margin: 0; background: #f0f4f8; }
.dashboard { margin-left: 260px; padding: 40px; min-height: 100vh; }

.dashboard-header h2 { color: #1a3e72; margin-bottom: 10px; }
.dashboard-header p { color: #555; margin-bottom: 25px; }

.resource-form { background: #fff; padding: 25px; border-radius: 12px; box-shadow: 0 6px 20px rgba(0,0,0,0.05); margin-bottom: 40px; }
.resource-form input, .resource-form button { width: 100%; padding: 12px; margin-bottom: 15px; border-radius: 8px; border: 1px solid #ccc; }
.resource-form button { background: #4aa6ff; color: #fff; border: none; cursor: pointer; font-size: 16px; font-weight: 600; transition: 0.3s; }
.resource-form button:hover { background: #3b82f6; }

.video-container { display: flex; flex-wrap: wrap; gap: 20px; }
.video-card { background: #fff; padding: 15px; border-radius: 12px; box-shadow: 0 6px 20px rgba(0,0,0,0.05); width: 300px; }
.video-card h4 { font-size: 16px; margin-bottom: 4px; color: #1a3e72; }
.video-card h5 { font-size: 14px; margin-bottom: 10px; color: #555; }
.video-card iframe, .video-card video { width: 100%; border-radius: 8px; margin-bottom: 8px; }
.delete-btn { background: #dc3545; color: #fff; border: none; padding: 6px 12px; border-radius: 5px; cursor: pointer; }
.delete-btn:hover { background: #a71d2a; }
</style>
</head>
<body>

<%
String userName = (String) session.getAttribute("userName");
if(userName == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<jsp:include page="sidebar.jsp" />

<main class="dashboard">
<section class="dashboard-header">
<h2>Resources Management</h2>
<p>Add new videos or tutorials for users. You can also delete existing videos.</p>
</section>

<!-- Add Video Form -->
<div class="resource-form">
<form action="VideoManagerServlet" method="post">
<input type="text" name="heading1" placeholder="Heading 1" required>
<input type="text" name="heading2" placeholder="Heading 2" required>
<input type="url" name="videoLink" placeholder="Video Link (YouTube or MP4 URL)" required>
<button type="submit">Add Video</button>
</form>
</div>

<!-- Video List from Database -->
<div class="video-container">
<%
try {
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM video ORDER BY id DESC");
    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
        int id = rs.getInt("id");
        String heading1 = rs.getString("heading1");
        String heading2 = rs.getString("heading2");
        String videoLink = rs.getString("video_link");

        String embedLink = videoLink;
        if(videoLink.contains("youtube.com") || videoLink.contains("youtu.be")) {
            embedLink = videoLink.replace("watch?v=", "embed/").replace("youtu.be/", "www.youtube.com/embed/");
        }
%>
<div class="video-card">
<h4><%= heading1 %></h4>
<h5><%= heading2 %></h5>

<% if(videoLink.contains("youtube.com") || videoLink.contains("youtu.be")) { %>
<iframe src="<%= embedLink %>" frameborder="0" allowfullscreen></iframe>
<% } else { %>
<video controls>
<source src="<%= videoLink %>" type="video/mp4">
Your browser does not support the video tag.
</video>
<% } %>


</div>
<%
    }
    rs.close();
    ps.close();
    conn.close();
} catch(Exception e) {
    e.printStackTrace();
}
%>
</div>
</main>
</body>
</html>

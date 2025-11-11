package com.cyberportal.servlet;

import com.cyberportal.util.DBConnection;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VideoManagerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String heading1 = request.getParameter("heading1");
        String heading2 = request.getParameter("heading2");
        String videoLink = request.getParameter("videoLink");

        if (heading1 == null || heading2 == null || videoLink == null || 
            heading1.isEmpty() || heading2.isEmpty() || videoLink.isEmpty()) {
            response.sendRedirect("resources.jsp?error=All fields are required");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO video (heading1, heading2, video_link) VALUES (?, ?, ?)"
            );
            ps.setString(1, heading1);
            ps.setString(2, heading2);
            ps.setString(3, videoLink);
            ps.executeUpdate();
            ps.close();

            response.sendRedirect("resources.jsp?success=Video added successfully");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("resources.jsp?error=" + e.getMessage());
        }
    }
}

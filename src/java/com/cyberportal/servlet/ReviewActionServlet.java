/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cyberportal.servlet;

import java.io.IOException;
import java.sql.*;

import com.cyberportal.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewActionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps;
            if ("approve".equals(action)) {
                ps = conn.prepareStatement("UPDATE review SET status='approved' WHERE id=?");
            } else if ("reject".equals(action) || "delete".equals(action)) {
                ps = conn.prepareStatement("DELETE FROM review WHERE id=?");
            } else {
                return;
            }
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("adminReviews.jsp");
    }
}

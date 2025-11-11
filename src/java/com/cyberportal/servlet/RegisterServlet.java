package com.cyberportal.servlet;

import com.cyberportal.util.DBConnection;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {

            // ✅ Check if email already exists in adminreg
            PreparedStatement checkUser = conn.prepareStatement("SELECT * FROM adminreg WHERE email=?");
            checkUser.setString(1, email);
            ResultSet rs = checkUser.executeQuery();

            if (rs.next()) {
                request.setAttribute("message", "⚠️ Email already registered!");
                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                rd.forward(request, response);
                return;
            }

            // ✅ Insert new record into adminreg
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO adminreg(name, email, password, created_at, profile) VALUES (?, ?, ?, ?, ?)"
            );
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);

            LocalDateTime now = LocalDateTime.now();
            ps.setString(4, now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

            ps.setString(5, "profile2.png");

            int rows = ps.executeUpdate();

            if (rows > 0) {
                request.setAttribute("message", "✅ Registration successful! Please login now.");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("message", "❌ Something went wrong. Please try again!");
                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                rd.forward(request, response);
            }

            ps.close();
            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

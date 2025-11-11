/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


/**
 *
 * @author Aman
 */




package com.cyberportal.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection conn = null;

    public static Connection getConnection() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/mainproject?useSSL=false&allowPublicKeyRetrieval=true",
                    "root",  // MySQL username
                    ""       // MySQL password — leave blank if none
                );
                System.out.println("✅ Database Connected");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}




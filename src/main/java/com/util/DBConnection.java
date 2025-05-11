package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // Method to get the connection
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        
        String username = "root";
        String password = "lasitha";
        Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_gaming_system?characterEncoding=UTF-8", username, password);
        
        return con;
    }

}

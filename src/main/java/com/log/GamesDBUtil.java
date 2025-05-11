package com.log;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GamesDBUtil {
    
    public static class InsertResult {
        private boolean success;
        private String errorMessage;

        public InsertResult(boolean success, String errorMessage) {
            this.success = success;
            this.errorMessage = errorMessage;
        }

        public boolean isSuccess() {
            return success;
        }

        public String getErrorMessage() {
            return errorMessage;
        }
    }

    public static class UserResult {
        private boolean success;
        private String errorMessage;
        private int userId;
        private String username;
        private String role;

        public UserResult(boolean success, String errorMessage, int userId, String username, String role) {
            this.success = success;
            this.errorMessage = errorMessage;
            this.userId = userId;
            this.username = username;
            this.role = role;
        }

        public boolean isSuccess() {
            return success;
        }

        public String getErrorMessage() {
            return errorMessage;
        }

        public int getUserId() {
            return userId;
        }

        public String getUsername() {
            return username;
        }

        public String getRole() {
            return role;
        }
    }

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        String url = "jdbc:mysql://localhost:3306/online_gaming_system?useSSL=false";
        String user = "root";
        String password = "lasitha";
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("MySQL JDBC Driver loaded");
        return DriverManager.getConnection(url, user, password);
    }

    public static UserResult authenticateUser(String email, String password) {
        String sql = "SELECT id, username, role FROM users WHERE email = ? AND password = ?";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            System.out.println("Executing SQL: " + sql);
            System.out.println("Values: email=" + email + ", password=" + password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int userId = rs.getInt("id");
                    String username = rs.getString("username");
                    String role = rs.getString("role");
                    System.out.println("User authenticated: ID=" + userId + ", username=" + username + ", role=" + role);
                    return new UserResult(true, null, userId, username, role);
                } else {
                    System.out.println("No user found for email: " + email);
                    return new UserResult(false, "Invalid email or password.", 0, null, null);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error in authenticateUser: " + e.getMessage());
            e.printStackTrace();
            return new UserResult(false, "Database error: " + e.getMessage(), 0, null, null);
        }
    }

    public static InsertResult registerUser(String username, String email, String password) {
        String sql = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, "user");
            System.out.println("Executing SQL: " + sql);
            System.out.println("Values: username=" + username + ", email=" + email + ", password=" + password + ", role=user");
            int rs = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rs);
            return rs > 0 ? new InsertResult(true, null) : new InsertResult(false, "No rows inserted.");
        } catch (SQLException e) {
            System.out.println("Error in registerUser: " + e.getMessage());
            e.printStackTrace();
            if (e.getMessage().contains("Duplicate entry")) {
                return new InsertResult(false, "Username or email already exists.");
            }
            return new InsertResult(false, "Database error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("Error in registerUser: " + e.getMessage());
            e.printStackTrace();
            return new InsertResult(false, "Database driver error: " + e.getMessage());
        }
    }
}
package com.feedback;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDBUtil {
    
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

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        String url = "jdbc:mysql://localhost:3306/online_gaming_system?useSSL=false";
        String user = "root";
        String password = "lasitha";
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("MySQL JDBC Driver loaded");
        return DriverManager.getConnection(url, user, password);
    }

    public static InsertResult insertFeedback(String username, String comment, int rating) {
        String sql = "INSERT INTO feedback (username, comment, rating) VALUES (?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, comment);
            pstmt.setInt(3, rating);
            
            System.out.println("Executing SQL: " + sql);
            System.out.println("Values: username=" + username + ", comment=" + comment + ", rating=" + rating);
            
            int rs = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rs);
            
            return rs > 0 ? new InsertResult(true, null) : new InsertResult(false, "No rows inserted.");
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error in insertFeedback: " + e.getMessage());
            e.printStackTrace();
            return new InsertResult(false, "Database error: " + e.getMessage());
        }
    }

    public static InsertResult updateFeedback(int id, String username, String comment, int rating) {
        String sql = "UPDATE feedback SET username = ?, comment = ?, rating = ? WHERE feedback_id = ?";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, comment);
            pstmt.setInt(3, rating);
            pstmt.setInt(4, id);
            
            System.out.println("Executing SQL: " + sql);
            System.out.println("Values: id=" + id + ", username=" + username + ", comment=" + comment + ", rating=" + rating);
            
            int rs = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rs);
            
            return rs > 0 ? new InsertResult(true, null) : new InsertResult(false, "No rows updated.");
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error in updateFeedback: " + e.getMessage());
            e.printStackTrace();
            return new InsertResult(false, "Database error: " + e.getMessage());
        }
    }

    public static InsertResult deleteFeedback(int id) {
        String sql = "DELETE FROM feedback WHERE feedback_id = ?";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            
            System.out.println("Executing SQL: " + sql);
            System.out.println("Values: id=" + id);
            
            int rs = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rs);
            
            return rs > 0 ? new InsertResult(true, null) : new InsertResult(false, "No rows deleted.");
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error in deleteFeedback: " + e.getMessage());
            e.printStackTrace();
            return new InsertResult(false, "Database error: " + e.getMessage());
        }
    }

    public static List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT feedback_id, username, comment, rating FROM feedback ORDER BY feedback_id DESC";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("feedback_id");
                String username = rs.getString("username");
                String comment = rs.getString("comment");
                int rating = rs.getInt("rating");
                feedbackList.add(new Feedback(id, username, comment, rating));
            }
            System.out.println("Retrieved " + feedbackList.size() + " feedback entries");
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error in getAllFeedback: " + e.getMessage());
            e.printStackTrace();
        }
        return feedbackList;
    }
    
    public static Feedback getFeedbackById(int id) {
        String sql = "SELECT feedback_id, username, comment, rating FROM feedback WHERE feedback_id = ?";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String username = rs.getString("username");
                    String comment = rs.getString("comment");
                    int rating = rs.getInt("rating");
                    System.out.println("Fetched feedback: ID=" + id + ", username=" + username);
                    return new Feedback(id, username, comment, rating);
                } else {
                    System.out.println("No feedback found for ID: " + id);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error in getFeedbackById: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
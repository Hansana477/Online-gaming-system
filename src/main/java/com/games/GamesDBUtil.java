package com.games;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public static InsertResult insertgame(String title, String description, float price, String category) {
        String url = "jdbc:mysql://localhost:3306/online_gaming_system?useSSL=false";
        String user = "root";
        String password = "lasitha";

        String sql = "INSERT INTO games (title, description, price, category) VALUES (?, ?, ?, ?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySQL JDBC Driver loaded successfully");

            try (Connection con = DriverManager.getConnection(url, user, password);
                 PreparedStatement pstmt = con.prepareStatement(sql)) {

                pstmt.setString(1, title);
                pstmt.setString(2, description);
                pstmt.setFloat(3, price);
                pstmt.setString(4, category);

                System.out.println("Executing SQL: " + sql);
                System.out.println("Values: title=" + title + ", description=" + description + ", price=" + price + ", category=" + category);
                int rs = pstmt.executeUpdate();
                System.out.println("Rows affected: " + rs);

                if (rs > 0) {
                    return new InsertResult(true, null);
                } else {
                    return new InsertResult(false, "No rows were inserted. Check the database schema or constraints.");
                }

            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("SQL Error: " + e.getMessage());
                return new InsertResult(false, "Database error: " + e.getMessage());
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Driver Load Error: " + e.getMessage());
            return new InsertResult(false, "Failed to load MySQL JDBC driver: " + e.getMessage());
        }
    }

    public static List<Games> getAllGames() {
        List<Games> games = new ArrayList<>();
        String url = "jdbc:mysql://localhost:3306/online_gaming_system?useSSL=false";
        String user = "root";
        String password = "lasitha";

        String sql = "SELECT id, title, category, price FROM games";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySQL JDBC Driver loaded successfully for query");

            try (Connection con = DriverManager.getConnection(url, user, password);
                 PreparedStatement pstmt = con.prepareStatement(sql);
                 ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String category = rs.getString("category");
                    float price = rs.getFloat("price");
                    String status = "Active"; // Default status; adjust based on your needs
                    games.add(new Games(id, title, category, price, status));
                }
                System.out.println("Retrieved " + games.size() + " games from the database");

            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("SQL Error during query: " + e.getMessage());
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Driver Load Error during query: " + e.getMessage());
        }

        return games;
    }
}
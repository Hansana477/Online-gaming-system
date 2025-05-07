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

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        String url = "jdbc:mysql://localhost:3306/online_gaming_system?useSSL=false";
        String user = "root";
        String password = "lasitha";
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("MySQL JDBC Driver loaded");
        return DriverManager.getConnection(url, user, password);
    }

    public static InsertResult insertgame(String title, String description, float price, String category) {
        String sql = "INSERT INTO games (title, description, price, category) VALUES (?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, description);
            pstmt.setFloat(3, price);
            pstmt.setString(4, category);
            System.out.println("Executing SQL: " + sql);
            System.out.println("Values: title=" + title + ", description=" + description + ", price=" + price + ", category=" + category);
            int rs = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rs);
            return rs > 0 ? new InsertResult(true, null) : new InsertResult(false, "No rows inserted.");
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error in insertgame: " + e.getMessage());
            e.printStackTrace();
            return new InsertResult(false, "Database error: " + e.getMessage());
        }
    }

    public static List<Games> getAllGames() {
        List<Games> games = new ArrayList<>();
        String sql = "SELECT id, title, description, category, price FROM games";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String category = rs.getString("category");
                float price = rs.getFloat("price");
                games.add(new Games(id, title, description, category, price, "Active"));
            }
            System.out.println("Retrieved " + games.size() + " games");
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error in getAllGames: " + e.getMessage());
            e.printStackTrace();
        }
        return games;
    }
    
    public static Games getGameById(int id) {
        String sql = "SELECT id, title, description, category, price FROM games WHERE id = ?";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    String category = rs.getString("category");
                    float price = rs.getFloat("price");
                    System.out.println("Fetched game: ID=" + id + ", title=" + title);
                    return new Games(id, title, description, category, price, "Active");
                } else {
                    System.out.println("No game found for ID: " + id);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error in getGameById: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
    
    public static InsertResult updategames(int id, String title, String description, float price, String category) {
        String sql = "UPDATE games SET title = ?, description = ?, price = ?, category = ? WHERE id = ?";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, description);
            pstmt.setFloat(3, price);
            pstmt.setString(4, category);
            pstmt.setInt(5, id);
            System.out.println("Executing update: id=" + id + ", title=" + title + 
                              ", description=" + description + ", price=" + price + 
                              ", category=" + category);
            int rs = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rs);
            return rs > 0 ? new InsertResult(true, null) : new InsertResult(false, "No game found with id=" + id);
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error in updategames: " + e.getMessage());
            e.printStackTrace();
            return new InsertResult(false, "Database error: " + e.getMessage());
        }
    }
    
    public static InsertResult deleteGame(int id) {
        String sql = "DELETE FROM games WHERE id = ?";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            System.out.println("Executing delete: id=" + id);
            int rs = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rs);
            return rs > 0 ? new InsertResult(true, null) : new InsertResult(false, "No game found with id=" + id);
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error in deleteGame: " + e.getMessage());
            e.printStackTrace();
            return new InsertResult(false, "Database error: " + e.getMessage());
        }
    }
}
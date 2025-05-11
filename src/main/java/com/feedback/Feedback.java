package com.feedback;

public class Feedback {
    private int id;
    private String username;
    private String comment;
    private int rating;

    public Feedback(int id, String username, String comment, int rating) {
        this.id = id;
        this.username = username;
        this.comment = comment;
        this.rating = rating;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }
    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }
}
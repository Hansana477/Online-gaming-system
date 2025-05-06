package com.games;

public class Games {
    private int id;
    private String title;
    private String category;
    private float price;
    private String status;

    public Games(int id, String title, String category, float price, String status) {
        this.id = id;
        this.title = title;
        this.category = category;
        this.price = price;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getCategory() {
        return category;
    }

    public float getPrice() {
        return price;
    }

    public String getStatus() {
        return status;
    }
}
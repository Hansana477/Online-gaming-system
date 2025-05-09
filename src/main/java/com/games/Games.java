package com.games;

public class Games {
    private int id;
    private String title;
    private String description;
    private String category;
    private float price;
    private String status;

    public Games(int id, String title, String description, String category, float price, String status) {
        this.id = id;
        this.title = title;
        this.description = description;
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
    
    public String getDescription() {
    	return description;
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
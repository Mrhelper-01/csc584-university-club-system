package model;

public class Club {
    private int clubId;
    private String name;
    private String description;
    private String category;
    private int createdBy;
    
    // Constructors
    public Club() {}
    
    public Club(String name, String description, String category, int createdBy) {
        this.name = name;
        this.description = description;
        this.category = category;
        this.createdBy = createdBy;
    }
    
    // Getters and Setters
    public int getClubId() {
        return clubId;
    }
    
    public void setClubId(int clubId) {
        this.clubId = clubId;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getCategory() {
        return category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    
    public int getCreatedBy() {
        return createdBy;
    }
    
    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }
}
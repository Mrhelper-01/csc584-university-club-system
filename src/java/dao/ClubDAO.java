package dao;

import model.Club;
import model.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClubDAO {
    
    // Test method - سادەترین
    public List<Club> getAllClubs() {
        List<Club> clubs = new ArrayList<>();
        
        System.out.println("🔄 getAllClubs() called");
        
        // داتای نەخشە (hardcoded) بۆ تێست
        Club club1 = new Club("Computer Science Club", "Programming club", "Academic", 1);
        club1.setClubId(1);
        
        Club club2 = new Club("Photography Club", "Art and photography", "Arts", 2);
        club2.setClubId(2);
        
        clubs.add(club1);
        clubs.add(club2);
        
        System.out.println("✅ Returned " + clubs.size() + " clubs");
        return clubs;
    }
    
    // Create new club - سادە
    public boolean createClub(Club club) {
        System.out.println("🔄 createClub() called: " + club.getName());
        return true; // هەمیشە سەرکەوتووە
    }
    
    // Get club by ID - سادە
    public Club getClubById(int clubId) {
        System.out.println("🔄 getClubById() called: " + clubId);
        
        Club club = new Club("Test Club", "Test Description", "Test Category", 1);
        club.setClubId(clubId);
        return club;
    }
    
    // Update club - سادە
    public boolean updateClub(Club club) {
        System.out.println("🔄 updateClub() called: " + club.getName());
        return true;
    }
    
    // Delete club - سادە
    public boolean deleteClub(int clubId) {
        System.out.println("🔄 deleteClub() called: " + clubId);
        return true;
    }
    
    // Count clubs - سادە
    public int countClubs() {
        System.out.println("🔄 countClubs() called");
        return 2; // 2 کڵاب
    }
}
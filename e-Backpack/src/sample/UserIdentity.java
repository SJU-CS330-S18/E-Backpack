package sample;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import apec.DatabaseConnection;

/**
 * DO NOT PLACE ANY METHODS INSIDE THIS CLASS!!!!!!
 * Used to hold properties about any user in the system
 * @author apec
 */
@SuppressWarnings("serial")
public class UserIdentity implements Serializable{
	protected String username;
	protected String password;
	protected int isAdmin;
	
	/**
	 * The default constructor
	 */
	public UserIdentity() {
		
	}
	
	/**
	 * Get the username
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	
	/**
	 * Set the username
	 * @param username the new username
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	
	/**
	 * Get the password
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	
	/**
	 * Set the password
	 * @param password the new password
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * Get the privealage of the user
	 * @return 1 for admin and 0 for customer
	 */
	public int getIsAdmin() {
		return isAdmin;
	}
	
	/**
	 * Set the privealage for the user
	 * @param isAdmin 1=admin 0=customer
	 */
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	/**
	 * quick way to determine whether or not a user is an admin
	 * @return true if the user is an admin
	 */
	public boolean isAdmin() {
		return getIsAdmin() == 1;
	}
	
	/**
	 * Set the users properties
	 * @param user the object containitn the users properties
	 */
	protected void setUser(UserIdentity user) {
		this.username = user.username;
		this.password = user.password;
		this.isAdmin = user.isAdmin;
	}
	
	/**
	 * login method used for all users of the system
	 * @return whether or not the user is an admin
	 */
    public int login() {
        Connection con = DatabaseConnection.openDBConnection();
        this.isAdmin = -1;
        try {
            ResultSet rs;
            String queryString = "Select * from user_identity u where u.username=? and u.password = ?";
            PreparedStatement preparedStmt = con.prepareStatement(queryString);
            preparedStmt.clearParameters();
            preparedStmt.setString(1, this.getUsername());
            preparedStmt.setString(2, this.getPassword());
            rs = preparedStmt.executeQuery();
            if(rs.next()) {
            	this.isAdmin = rs.getInt("isAdmin");
            }
        } catch (Exception E) {
            E.printStackTrace();
        }
        DatabaseConnection.closeDBConnection();
        return this.isAdmin;
    }
    
    /**
     * set all fields to empty strings upon logout
     */
    public void logout(){
    	this.username="";
    	this.password="";
    	this.isAdmin=-1;
    }
}

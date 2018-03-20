package entity;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import ebackpack.DatabaseConnection;

/**
 * DO NOT PLACE ANY METHODS INSIDE THIS CLASS!!!!!!
 * Used to hold properties about any user in the system
 * @author apec
 */
@SuppressWarnings("serial")
public class StudentIdentity implements Serializable{
	protected String username;
	protected String password;
	protected int isAdmin;
	
	/**
	 * The default constructor
	 */
	public StudentIdentity() {
		
	}
	protected void setStudentIdentity(StudentIdentity user) {
		this.username = user.username;
		this.password = user.password;
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
     * set all fields to empty strings upon logout
     */
    public void logout(){
    	this.username="";
    	this.password="";
    	this.isAdmin=-1;
    }
}

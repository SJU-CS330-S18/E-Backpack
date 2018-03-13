package sample;

/**
 * DO NOT PLACE ANY METHODS INSIDE THIS CLASS!!!!!!
 * This class holds the properties of a customer
 * @author apec
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import apec.DatabaseConnection;

@SuppressWarnings("serial")
public class CustomerIdentity extends UserIdentity{
	protected int customerID;
	protected String email;
	protected String first_name;
	protected String last_name;
	protected String phone_number;
	
	/**
	 * Default Constructor
	 */
	public CustomerIdentity() {
		super();
	}
	
	/**
	 * Constructor for customer identities that have known properties
	 * @param username the customers username
	 * @param password the customers password
	 * @param customerID the id for the customer
	 * @param first_name the customers first name
	 * @param last_name the customers last name
	 * @param phone_number the customers phone number
	 * @param email the customers email
	 */
	public CustomerIdentity(String username, String password, int customerID, String first_name, String last_name, String phone_number, String email) {
		this.username = username;
		this.password = password;
		this.customerID = customerID;
		this.first_name = first_name;
		this.last_name = last_name;
		this.phone_number = phone_number;
		this.email = email;
	}
	
	/**
	 * Set the username and password for the customer
	 * @param user  the object holding the username and password
	 */
	protected void setCustomerIdentity(UserIdentity user) {
		setUser(user);
	}
	
	/**
	 * Gets the customers ID
	 * @return the customers ID
	 */
	public int getCustomerID() {
		return customerID;
	}
	
	/**
	 * Sets the customers ID
	 * @param customerID the customers ID
	 */
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}

	/**
	 * Gets the customers Email
	 * @return the customers Email
	 */
	public String getEmail() {
		return email;
	}
	
	/**
	 * Sets the customers Email
	 * @param email the customers new email
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * Gets the customers first name
	 * @return the customers First name
	 */
	public String getFirst_name() {
		return first_name;
	}

	/**
	 * Sets the customers first name
	 * @param first_name the new first name for the customer
	 */
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	/**
	 * Gets the customers last name
	 * @return the customers last name
	 */
	public String getLast_name() {
		return last_name;
	}

	/**
	 * Sets the customers laste name
	 * @param last_name the customers last name
	 */
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	/**
	 * Gets the customers phone number
	 * @return the customers phone number
	 */
	public String getPhone_number() {
		return phone_number;
	}

	/**
	 * Sets the customers Phone number
	 * @param phone_number the customers Phone number
	 */
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	

	/**
	 * This login method will gather all the customers information to store in the customer bean
	 * @return an integer that means absolutely nothing
	 */
	@Override
	public int login() {
        Connection con = DatabaseConnection.openDBConnection();
        try {
            ResultSet rs;
            String queryString = "Select * from user_identity u,customer c where u.username=? and u.password = ? and u.username = c.username";
            PreparedStatement preparedStmt = con.prepareStatement(queryString);
            preparedStmt.clearParameters();
            preparedStmt.setString(1, this.getUsername());
            preparedStmt.setString(2, this.getPassword());
            rs = preparedStmt.executeQuery();
            rs.next();
            this.first_name = rs.getString("first_name");
            this.last_name = rs.getString("last_name");
            this.phone_number = rs.getString("phone_number");
            this.customerID = rs.getInt("customerID");
            this.email = rs.getString("email");
        } catch (Exception E) {
            E.printStackTrace();
        }
        DatabaseConnection.closeDBConnection();
		return 0;
	}
	
	/**
	 * Resets all the values for the customer
	 */
	public void logout() {
		super.logout();
		this.first_name="";
		this.last_name="";
		this.email="";
		this.phone_number="";
		this.customerID=-1;
	}
	
	/**
	 * Used to check whether all the fields have been completely filled out.
	 * @return true if everything is filled out
	 */
	public boolean noNulls() {
		return this.username != null &&
				this.password != null &&
				this.email != null &&
				this.first_name != null &&
				this.last_name != null;
	}
}

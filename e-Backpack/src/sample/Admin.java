package sample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

import apec.DatabaseConnection;

/**
 * All the database calls for the Admins
 * @author APEC
 */

@SuppressWarnings("serial")
public class Admin extends UserIdentity {

	/**
	 * set the admin 
	 * @param user the password and username for the user
	 */
	public void setAdmin(UserIdentity user) {
		this.setUser(user);
	}

	/**
	 * View Users Functionality Place the customers in an array list so we can close
	 * 	the connection here If the user doesnt have the proper access rights return null
	 * @return an array of customers
	 */
	public ArrayList<CustomerIdentity> getCustomers() {
		if (isAdmin != 1)
			return null;
		Connection con = DatabaseConnection.openDBConnection();
		ArrayList<CustomerIdentity> customers = new ArrayList<CustomerIdentity>();
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt
					.executeQuery("SELECT * FROM user_identity u,customer c WHERE u.username=c.username AND isAdmin=0");
			while (rs.next()) {
				customers.add(new CustomerIdentity(rs.getString("username"), rs.getString("password"),
						rs.getInt("customerID"), rs.getString("first_name"), rs.getString("last_name"),
						rs.getString("phone_number"), rs.getString("email")));
			}
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		DatabaseConnection.closeDBConnection();
		return customers;
	}

	/**
	 * Add a customer to the database
	 * @param customer the object holding the customers credentials
	 * @return whether or not the update occured
	 */
	public boolean addCustomer(CustomerIdentity customer) {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		boolean updated = true;
		try {

			String user_insert = "INSERT INTO user_identity (username, password, isAdmin) VALUES (?, ?, ?)";
			stmt = con.prepareStatement(user_insert);
			stmt.setString(1, customer.getUsername());
			stmt.setString(2, customer.getPassword());
			stmt.setInt(3, 0);
			if (stmt.executeUpdate() == 0) {
				updated = false;
			}

			String customer_insert = "INSERT INTO customer (username, customerID, email, first_name, last_name, phone_number) VALUES (?, customer_id_seq.nextval, ?, ?, ?, ?)";
			stmt = con.prepareStatement(customer_insert);
			stmt.setString(1, customer.getUsername());
			stmt.setString(2, customer.getEmail());
			stmt.setString(3, customer.getFirst_name());
			stmt.setString(4, customer.getLast_name());
			stmt.setString(5, customer.getPhone_number());
			if (updated && stmt.executeUpdate() == 0) {
				updated = false;
				Statement ende = con.createStatement();
				ende.executeUpdate("DELETE FROM user_identity WHERE username='" + customer.getUsername() + "'");
				ende.close();
			}
			stmt.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			updated = false;
		}
		DatabaseConnection.closeDBConnection();
		return updated;
	}

	/*
	 * This method queries the database and gets all the item information and its
	 * selling price and commission earned
	 * 
	 * @return returns the resultset containing the data
	 */
	public ArrayList<SSRItem> getSalesSummaryReport() {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		ResultSet rs = null;
		ArrayList<SSRItem> output = new ArrayList<SSRItem>();
		try {
			String query = "Select i.category, i.ItemID, i.item_name, Current_Winning_Bid_Func(i.ItemID) as Final_selling_price, Current_Winning_Bid_Func(I.ItemID)*.05 as commission\n"
					+ "from Item i\n" + "where i.ENDDATE < SYSDATE\n"
					+ "Group by i.category, i.ItemID, i.item_name, Current_Winning_Bid_Func(i.ItemID), Current_Winning_Bid_Func(I.ItemID)*.05\n"
					+ "having Current_winning_bid_func(i.itemID)>0" + "order by category, i.itemid";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while(rs.next()) {
				SSRItem it = new SSRItem(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getDouble(5));
				output.add(it);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return output;
		}
		
		return output;
	}

	/*
	 * This method queries the database and adds up all the final selling prices and
	 * commission earned for each item in each category
	 * 
	 * @return returns the result set containing the data
	 */
	public ArrayList<SSRTotals> getSalesSummaryTotals() {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		ResultSet rs = null;
		ArrayList<SSRTotals> output = new ArrayList<SSRTotals>();
		try {
			String query = "Select category, Sum(Current_winning_bid_func(i.itemID)) as final_selling_total, Sum(Current_winning_bid_func(i.itemID)*.05) as Commision_total\n"
					+ "from item i\n" + "where i.enddate < SYSDATE\n" + "group by category\n"
					+ "having Sum(Current_winning_bid_func(i.itemID))>0" + "order by category";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while(rs.next()) {
				SSRTotals to = new SSRTotals(rs.getString(1),rs.getInt(2),rs.getDouble(3));
				output.add(to);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return output;
		}
		return output;
	}
	
	/**
	 * this fancy little method creates objects that hold the necessary info for every user that's sold items.
	 * @return list of all OCRUser objects
	 */
	public ArrayList<OCRUser> getOverallCommissionReport() {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		ResultSet rs = null;
		ArrayList<OCRUser> output = new ArrayList<OCRUser>();
		try {
			String query = "Select c.customerid, c.username, c.first_name, c.last_name, c.email, Overall_Rating_Func(c.username) as Seller_Rating ,Number_Rating_Func(c.username) as total_ratings, SOLDPRICE_BY_USER_FUNC(c.username) *.05 as commission\n" + 
					"    from customer c\n" + 
					"    order by c.customerid";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				OCRUser u = new OCRUser(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDouble(6),rs.getInt(7),rs.getDouble(8));
				output.add(u);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return output;
		}
		return output;
	}
	
	/**
	 * Ensure that the proper search has been executed, if the parameters are not valid then
	 * 	return the proper error code in accordance with Error.java
	 * @param ci object holding the values entered for the search
	 * @return an integer representing the correctness of the search 0=valid !0=Invalid
	 */
	public int checkSearchParams(CustomerIdentity ci) {
		boolean usFilled = ci.getUsername().length() > 0;
		boolean emFilled = ci.getEmail().length() > 0;
		boolean filaFilled = ci.getFirst_name().length()>0 || ci.getLast_name().length()>0;
		boolean cuFilled = ci.getCustomerID() != 0;
		
		if(!(usFilled || emFilled || filaFilled || cuFilled)) {
			return 1;
		}else if(usFilled && (emFilled || filaFilled || cuFilled)) {
			return 3;
		}else if(cuFilled && (emFilled || filaFilled)) {
			return 2;
		}else if(filaFilled && emFilled) {
			return 4;
		}
		return 0;
	}
	
	/**
	 * Search the system for users mathing the credentials
	 * @param ci the customerIdentity with the values entered for the search
	 * @return an arraylist of customers matching the search
	 */
	public ArrayList<CustomerIdentity> search(CustomerIdentity ci) {
		ArrayList<CustomerIdentity> customers = new ArrayList<CustomerIdentity>();
		Connection con = DatabaseConnection.openDBConnection();
		String query = "SELECT * FROM user_identity u,customer c WHERE u.username=c.username AND isAdmin=0 ";
		PreparedStatement stmt = null;
		ResultSet rs;
		try {
			if(ci.getUsername().length()>0) {
				query += "AND SOUNDEX(u.username)=SOUNDEX(?)";
				stmt = con.prepareStatement(query);
				stmt.setString(1,ci.getUsername());
			}else if(ci.getEmail().length()>0) {
				query += "AND c.email=?";
				stmt = con.prepareStatement(query);
				stmt.setString(1,ci.getEmail());
			}else if(ci.getFirst_name().length()>0) {
				query += "AND ( SOUNDEX(c.first_name)=SOUNDEX(?) OR SOUNDEX(c.last_name)=SOUNDEX(?) )";
				stmt = con.prepareStatement(query);
				stmt.setString(1,ci.getFirst_name());
				stmt.setString(2,ci.getLast_name());
			}else {
				query += "AND customerID=?";
				stmt = con.prepareStatement(query);
				stmt.setInt(1,ci.getCustomerID());
			}
			System.out.println(query);
			rs = stmt.executeQuery();
			while(rs.next()) {
				customers.add(new CustomerIdentity(rs.getString("username"), rs.getString("password"),
						rs.getInt("customerID"), rs.getString("first_name"), rs.getString("last_name"),
						rs.getString("phone_number"), rs.getString("email")));
				
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DatabaseConnection.closeDBConnection();
		return customers;
	}
}

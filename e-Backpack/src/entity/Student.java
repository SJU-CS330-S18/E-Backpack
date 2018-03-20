package entity;


import java.io.*;


import java.sql.*;
import java.util.Date;



/**
 * Use the SQL script file provided in this folder to create a NEW (slightly different) 
 * version of the ProductDeals database on Oracle and insert data into all tables. The 
 * script also creates an SQL function.
 */
public class Student extends StudentIdentity {
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
/**
   * The following fields correspond to the ADMINS table in the Oracle database
   */
  private String phoneno;
  private String emailad;
  private String fname;
  private String lname;
  private String username;
  private String password;
  private PreparedStatement pstmt;
  private Statement stmt;
  private ResultSet result;
  private Connection con;
  private CallableStatement callStmt;
  /**
   * The following stores whether or not the customer has successfully logged
   * to the System
   */    
  private boolean loggedIn = false;
  
  /**
   * A default constructor ... no need for other constructors
   */
  public Student(){
	  
  }
	public void setStudent(StudentIdentity user) {
		setStudentIdentity(user);
	}
  
  /**
   * This method and creates and returns a Connection object to the database. 
   * All other methods that need database access should call this method.
   * @return a Connection object to Oracle
   */
  public Connection openDBConnection() {
    try {
      // Load driver and link to driver manager
      Class.forName("oracle.jdbc.OracleDriver");
      // Create a connection to the specified database
      Connection myConnection = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclesrv.ad.csbsju.edu:1521/" +
                                                            "csci.cscioraclesrv.ad.csbsju.edu","TEAM5", "mnz");
      return myConnection;
    } catch (Exception E) {
      E.printStackTrace();
    }
    return null;
  }
  /**
   * A getter for class field loggedIn
   * @return whether the Customer is logged in or not
   */
  public Boolean isLoggedIn() {
    return this.loggedIn;
  }
 

/**
 * A getter for class field phoneno
 */ 
 public String getPhoneno() {
	return phoneno;
}
 /**
  * A setter for class field phoneno
  * @param phoneno the phoneno to set
  */

public void setPhoneno(String phoneno) {
	this.phoneno = phoneno;
}
/**
 * A getter for class field emailad
 */
public String getEmailad() {
	return emailad;
}
/**
 * A setter for class field emailad
 * @param emailad the emailad to set
 */

public void setEmailad(String emailad) {
	this.emailad = emailad;
}
/**
 * A getter for class field fname
 */
public String getFname() {
	return fname;
}
/**
 * A setter for class field fname
 * @param fname the first name to set
 */

public void setFname(String fname) {
	this.fname = fname;
}
/**
 * A getter for class field lname
 */
public String getLname() {
	return lname;
}
/**
 * A setter for class field lname
 * @param plname the last name to set
 */

public void setLname(String lname) {
	this.lname = lname;
}

/**
 * A getter for class field username
 */
public String getUsername() {
	return username;
}
/**
 * A setter for class field  username
 * @param username the username to set
 */
public void setUsername(String username) {
	this.username = username;
}
/**
 * A getter for class field password
 */
public String getPassword() {
	return password;
}
/**
 * A setter for class field  password
 * @param password the password to set
 */
public void setPassword(String password) {
	this.password = password;
}


/* This method uses a CallStatement object to call an SQL stored procedure
 * Procedure team5.CUSTOMER_REGISTER_PROC  to  register a customer.**/
 public void registerCustomer() {
	   
	   try{
		    con = openDBConnection();
		    callStmt = con.prepareCall(" {call team5.CUSTOMER_REGISTER_PROC(?,?,?,?,?,?,?)}");
		    callStmt.setString(1,this.phoneno);
		    callStmt.setString(2,this.emailad);
		    callStmt.setString(3,this.fname);
		    callStmt.setString(4,this.lname);
		    callStmt.setString(5,this.username);
		    callStmt.setString(6,this.password);
		    callStmt.execute();
		    callStmt.close();
	   } catch (Exception E) {
	             E.printStackTrace();
	   }
}
 

 
 /**
  * When called, this method uses a Statement object to query table CUSTOMER
  * for the customer whose username and password exists in the database
  * If a match is found, the method sets loggedIn class field to true and 
  * returns true; otherwise, loggedIn class field is set to false and false is returned 
  * 
  * @return true or false based on whether the login information of the customer
  * stored in class fields  username and password exist in Table Customer
  */
 public boolean login() {

	     con = openDBConnection();
	     try{
	     pstmt=  con.prepareStatement("select * from student where username = ? and pass = ?");
         pstmt.clearParameters();
         pstmt.setString(1,this.username);
         pstmt.setString(2, this.password);
         result = pstmt.executeQuery();
	     System.out.println(result);
	     if(result.next()) {
	    	   this.setUsername(result.getString("username")); 
	    	   this.setPassword(result.getString("pass")); 
	    	   this.loggedIn = true;  
	     }
	      return this.loggedIn;
	     }
	     catch (Exception E) {
	            E.printStackTrace();
	            return false;
	        }
	    }  
 
 /**
  * sets loggedIn class field to false
  * @throws IllegalStateException if then method is called when loggedIn = false
  */
 public void logout() throws IllegalStateException {
   if(!isLoggedIn())
     throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
   
   this.loggedIn = false;
 }
  
}
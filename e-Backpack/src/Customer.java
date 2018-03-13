

import java.io.*;
import java.sql.*;
import java.util.Date;

import oracle.jdbc.*;


/**
 * Use the SQL script file provided in this folder to create a NEW (slightly different) 
 * version of the ProductDeals database on Oracle and insert data into all tables. The 
 * script also creates an SQL function.
 */
public class Customer implements Serializable {
  /**
   * The following fields correspond to the ADMINS table in the Oracle database
   */
  private String phoneno;
  private String emailad;
  private String fname;
  private String lname;
  private char isSeller;
  private char isBidder;
  private String username;
  private String password;
  private String adminUsername;
  private int id;
  private int commission;
  private int sumratings;
  private int noofratings;
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
  public Customer(){
	  
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
  
  /* This method uses a CallStatement object to call an SQL stored procedure
   * Procedure team5.CUSTOMER_REGISTER_PROC  to  add a customer.**/
  
  public void addCustomer() {
	   
	   try{
		    con = openDBConnection();
		    callStmt = con.prepareCall(" {call team5.CUSTOMER_ADD_PROC(?,?,?,?,?,?,?)}");
		    callStmt.setString(1,this.emailad);
		    callStmt.setString(2,this.fname);
		    callStmt.setString(3,this.lname);
		    callStmt.setString(4,this.username);
		    callStmt.setString(5,this.password);
		    callStmt.setString(6,this.adminUsername);
		    callStmt.setInt(7, this.id);
		    callStmt.execute();
		    callStmt.close();
	   } catch (Exception E) {
	             E.printStackTrace();
	   }
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
		    callStmt.setInt(7, this.id);
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
	     pstmt=  con.prepareStatement("SELECT ID FROM TEAM5.CUSTOMER WHERE USERNAME =? AND PASSWORD=?");
         pstmt.clearParameters();
         pstmt.setString(1,this.username);
         pstmt.setString(2, this.password);
	     result= pstmt.executeQuery();
	     if(result.next()) {
	    	   this.setId(result.getInt("id")); 
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
  

  /**

   * This method uses a Statement object to query the CUSTOMER table
   * for the customer whose id matches the provided id
   * 
   * @return a ResultSet object containing the record for the matching customer from 
   * the CUSTOMER table
   * 
   * @throws IllegalStateException if then method is called when loggedIn = false**/
  public ResultSet getCustomerInfo()  throws IllegalStateException{
	   
      if(!isLoggedIn())
      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
       try{
    	   stmt = con.createStatement();
          String queryString = "Select username,fname,lname,emailad,phoneno,sumofratings,noofratings,password FROM CUSTOMER where"
          		+ " id='" + this.id +"'";
          result = stmt.executeQuery(queryString);
       }       
       catch (Exception E) {
    	   E.printStackTrace();
       }
       return  result;
  	}
  
  public ResultSet getCustomerInfo2()  throws IllegalStateException{
	   
      if(!isLoggedIn())
      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
       try{
    	   stmt = con.createStatement();
          String queryString = "Select username,isBidder, isSeller FROM CUSTOMER where"
          		+ " username='" + this.username +"'";
          result = stmt.executeQuery(queryString);
       }       
       catch (Exception E) {
    	   E.printStackTrace();
       }
       return  result;
  	}
  

  public void updateProfile() throws IllegalStateException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	       try{
          Statement stmt = con.createStatement();
          String queryString = "update customer set" 
        		  + " username='" + this.username + "',"
                  + " fname='" + this.fname + "',"
                  + " lname='" + this.lname + "',"
                  + " email='" + this.emailad + "',"
                  + " phoneno='" + this.phoneno + "',"
                  + " password='" + this.password + "',"
                  + " where username='" + this.username+ "'";
          stmt.executeUpdate(queryString);
          stmt.close();         
      } catch (Exception E) {
          E.printStackTrace();
      }       
  }
  
  public void editProfile(String username, String fname, String lname, String email, String phoneno, String newpw) throws SQLException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");  
	    callStmt = con.prepareCall(" {call team5.customer_updateProfile_Proc(?,?,?,?,?,?,?,?,?)}");
	    callStmt.setString(1,phoneno);
	    callStmt.setString(2,email);
	    callStmt.setString(3,fname);
	    callStmt.setString(4,lname);
	    callStmt.setString(5,"Y");
	    callStmt.setString(6,"Y");
	    callStmt.setString(7,username);
	    callStmt.setString(8,newpw);
	    callStmt.setInt(9,this.id);
	    callStmt.execute();
	    
	    callStmt.close();
	  }  
  
/**
 * Get the list of items (sold and on auction) the seller posted in the past and show brief information
 * 
 * @return a resultset that data retrieved from the database.
 * @throw if the seller does not log in or query cannot run well
 */
  
public ResultSet getItemList()  throws IllegalStateException{
	  
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	       try{
	    	   stmt = con.createStatement();
          String queryString = "SELECT INUMBER , INAME , CATEG, auc_start, auc_end_date , startbid , currentbid,status " 
          		+ "FROM ITEM "
                + " WHERE SELLERNO = '" + this.id +"' ";

          result = stmt.executeQuery(queryString);
          
	       }
	       catch (Exception E) {
	         E.printStackTrace();
	       }
	        return result; 
	     }
/**
 * Get the list of items the seller posted in the past which have sold 
 * and show the profit every sales
 * 
 * @return a resultset that data retrieved from the database.
 * @throw if the seller does not log in or query cannot run well
 */

public ResultSet getItemListForSold()  throws IllegalStateException{
	  
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	       try{
	    	   stmt = con.createStatement();
        String queryString = "SELECT INUMBER , INAME ,  auc_start, auc_end_date , startbid , currentbid , CURRENTBID-STARTBID " 
        		+ "FROM ITEM "
              + " WHERE SELLERNO = '" + this.id +"' AND STATUS = 'SOLD' "
              	+"GROUP BY SELLERNO, INUMBER, INAME, auc_start, auc_end_date,"+ 
              		" startbid, currentbid, CURRENTBID-STARTBID";

        result = stmt.executeQuery(queryString);
        
	       }
	       catch (Exception E) {
	         E.printStackTrace();
	       }
	        return result; 
	     }

public ResultSet getItemsOnAuction()  throws IllegalStateException{
	  
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	       try{
	    	   stmt = con.createStatement();
        String queryString = "SELECT INUMBER , INAME , CATEG, auc_start, auc_end_date , startbid , currentbid " 
        		+ "FROM ITEM "
              + " WHERE status = 'ON AUCTION'";

        result = stmt.executeQuery(queryString);
        
	       }
	       catch (Exception E) {
	         E.printStackTrace();
	       }
	        return result; 
	     }
/**
 * Get the detailed information of an specific item with item number and show to seller
 * 
 * @param inumber of an item
 * @return a resultset that data retrieved from the database.
 * @throw if the seller does not log in or query cannot run well
 */

public ResultSet getItemInfo(int ino) throws IllegalStateException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	 try {
		 con = openDBConnection();
	 String queryString = "SELECT * " 
       		+ "FROM ITEM "
			 + " where INUMBER = '"+ino+"'";
	 stmt = con.createStatement();
	 result = stmt.executeQuery(queryString);
	 } catch (Exception e) {
		 e.printStackTrace();
	 }
	 return result;
}

/**
 * Get the information of a customer with known customer id
 * 
 * @param cid the id of a customer
 * @return a resultset that data retrieved from the database.
 * @throw if the seller does not log in or query cannot run well
 */

public ResultSet getCustomerInfo(int cid)  throws IllegalStateException{
	   
    if(!isLoggedIn())
    throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
     try{
  	   stmt = con.createStatement();
        String queryString = "Select * FROM CUSTOMER where"
        		+ " id= '" + cid +"'";
        result = stmt.executeQuery(queryString);
     }       
     catch (Exception E) {
  	   E.printStackTrace();
     }
     return  result;
	}

/**
 * Get the list of bidders bidding on an specific item with item number and show to seller
 * 
 * @param inumber of an item
 * @return a resultset that data retrieved from the database.
 * @throw if the seller does not log in or query cannot run well
 */

public ResultSet getBidderList(int ino) throws IllegalStateException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	 try {
		 con = openDBConnection();
	 String queryString = "SELECT biddate , username , maximumbidlimit " 
     		+ "FROM BIDS, CUSTOMER "
			 + " where id = bidderid and isbidder = 'Y' and itemid = '"+ino+"'";
	 stmt = con.createStatement();
	 result = stmt.executeQuery(queryString);
	 } catch (Exception e) {
		 e.printStackTrace();
	 }
	 return result;
}
  
/**
 * post a new item to the system
 * 
 * 
 * @param name the name of the item adding
 * @param desc the description of the item
 * @param cate the category of the item
 * @param aucE the end date of the auction of the item
 * @param priceS the start price the seller sets to this item
 * 
 * @throw if the seller does not log in or query cannot run well
 */

public void addItem(String name, String desc, String cate, Date aucE,String priceS) throws SQLException{
	 if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	 java.util.Date utilDate = new java.util.Date();
	 //java.sql.Date cur = new java.sql.Date(utilDate.getTime());
	 if(aucE.before(utilDate)){
		 System.out.println(aucE.before(utilDate));
		 throw new IllegalStateException("Auction ending time should be later than starting time");
	 }
	 
	callStmt = con.prepareCall(" {call team5.item_add_Proc(?,?,?,?,?,?)}");
    callStmt.setString(1,name);
    callStmt.setString(2,desc);
    callStmt.setString(3,cate);
    callStmt.setDate(4,(java.sql.Date) aucE);
    callStmt.setInt(5,this.id);
    callStmt.setInt(6,Integer.parseInt(priceS));
    callStmt.execute();
    callStmt.close();
  }  

      	
/**
 * Search a list of relevant items with the category and item name information
 * which are ordered by relevance
 * 
 * @param cat the category the seller wants to search
 * @param inm the item name the seller wants to search
 * @return a resultset that data retrieved from the database.
 * @throws IllegalStateException
 */
public ResultSet getRelevantProducts(String cat, String inm) throws IllegalStateException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	 try {
		 con = openDBConnection();
		 String sc = cat.substring(0, 1);
		 String si = inm.substring(0, 1);
	 String queryString = "SELECT * " 
   		+ "FROM ITEM "
			 + "WHERE  UPPER(CATEG)" + 
			 " LIKE '%' || UPPER('"+sc+"') || '%' and UPPER(INAME) LIKE '%' || UPPER('"+si+"') || '%'"
			 +" ORDER BY CASE WHEN STATUS = 'ON AUCTION' THEN 12" + 
			 "            WHEN STATUS = 'SOLD' THEN 11" + 
			 "            ELSE 0" + 
			 "        END DESC" + 
			 "        , CASE"
			 +" 	WHEN UPPER(INAME) = UPPER('"+inm+"')     THEN 10 " + 
			 "              WHEN UPPER(INAME) LIKE UPPER('"+inm+"') || '%' THEN 9" + 
			 "              WHEN UPPER(INAME) LIKE '%'|| UPPER('"+inm+"') ||'%'     THEN 8" + 
			 "              ELSE 0" + 
			 "          END DESC "+
			 "  , CASE "
			 + "	    WHEN UPPER(CATEG) = UPPER('ELECTRONIC') THEN 7" + 
			 "                WHEN UPPER(CATEG) LIKE UPPER('ELECTRONIC') ||'%'       THEN 6 " + 
			 "                WHEN UPPER(CATEG) LIKE '%'|| UPPER('Iphone') ||'%' THEN 5" + 
			 "                ELSE 0" + 
			 "           END DESC" + 
			 "            , CASE" + 
			 "                WHEN SOUNDEX(INAME) = SOUNDEX('IPHONE') THEN 4" + 
			 "                WHEN SOUNDEX(CATEG) = SOUNDEX('ELECTRONIC') THEN 3" + 
			 "                ELSE 0" + 
			 "                END DESC";
	 stmt = con.createStatement();
	 result = stmt.executeQuery(queryString);
	 } catch (Exception e) {
		 e.printStackTrace();
	 }
	 return result;
}

/**
 * Search a list of relevant items with the category and item name information
 * which are ordered by date and relevance
 * 
 * @param cat the category the seller wants to search
 * @param inm the item name the seller wants to search
 * @return a resultset that data retrieved from the database.
 * @throws IllegalStateException
 */

public ResultSet getRelevantProductsByDate(String cat, String inm) throws IllegalStateException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	 try {
		 con = openDBConnection();
		 String sc = cat.substring(0, 1);
		 String si = inm.substring(0, 1);
	 String queryString = "SELECT * " 
 		+ "FROM ITEM "
			 + "WHERE  UPPER(CATEG)" + " LIKE '%' || UPPER('"+sc+"') || '%' and UPPER(INAME) LIKE '%' || UPPER('"+si+"') || '%'"
			 +" ORDER BY AUC_END_DATE DESC" + 
			 "        , CASE"
			 +" 	WHEN UPPER(INAME) = UPPER('"+inm+"')     THEN 10 " + 
			 "              WHEN UPPER(INAME) LIKE UPPER('"+inm+"') || '%' THEN 9" + 
			 "              WHEN UPPER(INAME) LIKE '%'|| UPPER('"+inm+"') ||'%'     THEN 8" + 
			 "              ELSE 0" + 
			 "          END DESC "+
			 "  , CASE "
			 + "	    WHEN UPPER(CATEG) = UPPER('ELECTRONIC') THEN 7" + 
			 "                WHEN UPPER(CATEG) LIKE UPPER('ELECTRONIC') ||'%'       THEN 6 " + 
			 "                WHEN UPPER(CATEG) LIKE '%'|| UPPER('Iphone') ||'%' THEN 5" + 
			 "                ELSE 0" + 
			 "           END DESC" + 
			 "            , CASE" + 
			 "                WHEN SOUNDEX(INAME) = SOUNDEX('IPHONE') THEN 4" + 
			 "                WHEN SOUNDEX(CATEG) = SOUNDEX('ELECTRONIC') THEN 3" + 
			 "                ELSE 0" + 
			 "                END DESC";
	 stmt = con.createStatement();
	 result = stmt.executeQuery(queryString);
	 } catch (Exception e) {
		 e.printStackTrace();
	 }
	 return result;
}

public ResultSet viewFeedback() throws IllegalStateException{

	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	    try{
	    	stmt = con.createStatement();
	        String queryString = "SELECT bidderno,itemno,rating,quality,delivery,comments" + 
	        		" FROM Rates, Item" + 
	        		" WHERE sellerno = '" + this.getId()+ "' and itemno = INUMBER";
	        result = stmt.executeQuery(queryString);
	    }
	    catch (Exception E) {
	        E.printStackTrace();
	    }
	    return result; 
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
 * A getter for class field isseller
 */
public char getIsSeller() {
	return isSeller;
}
/**
 * A setter for class field isseller
 * @param isSeller the character to set
 */

public void setIsSeller(char isSeller) {
	this.isSeller = isSeller;
}
/**
 * A getter for class field isbidder
 */
public char getIsBidder() {
	return isBidder;
}
/**
 * A setter for class field isbidder
 * @param isbidder the character to set 
 */

public void setIsBidder(char isBidder) {
	this.isBidder = isBidder;
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
/**
 * A getter for class field adminusername
 */
public String getAdminUsername() {
	return adminUsername;
}
/**
 * A setter for class field  adminusername
 * @param adminusername the admin username to set
 */
public void setAdminUsername(String adminUsername) {
	this.adminUsername = adminUsername;
}
/**
 * A getter for class field id
 */
public int getId() {
	return id;
}
/**
 * A setter for class field  password
 * @param id the id to set
 */
public void setId(int id) {
	this.id = id;
}
/**
 * A getter for class field commission
 */
public int getCommission() {
	return commission;
}
/**
 * A setter for class field  commission
 * @param  commision the commision to set
 */
public void setCommission(int commission) {
	this.commission = commission;
}
/**
 * A getter for class field sum ratings
 */
public int getSumratings() {
	return sumratings;
}
/**
 * A setter for class field  sumratings
 * @param  sumratings the sumratings to set
 */
public void setSumratings(int sumratings) {
	this.sumratings = sumratings;
}
/**
 * A getter for class field getNoOfRatings
 */
public int getNoOfratings() {
	return noofratings;
}
/**
 * A setter for class field  noratings
 * @param  sumratings the noratings to set
 */
public void setNoofratings(int noofratings) {
	this.noofratings = noofratings;
}


  
}
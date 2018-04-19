package entity;


import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;


public class notebook implements Serializable{
	
	 private String courseTitle;
	  private String stuUsername;
	  private boolean isRetired;
	  private String username;
	  private String password;
	  
	  
	  private PreparedStatement pstmt;
	  private Statement stmt;
	  private ResultSet result;
	  private Connection con;
	  private CallableStatement callStmt;
	
	
	 public notebook(String courseTitle, boolean isRetired, String Username, ArrayList Notes){
		  
	  
			this.username = username;
			this.password = password;
			this.isRetired = isRetired;
			this.courseTitle = courseTitle;
	 }
		

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
}


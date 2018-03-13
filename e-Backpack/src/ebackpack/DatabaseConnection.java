package ebackpack;

import java.io.*;
import java.sql.*;

/**
 *
 * @author APEC
*/

@SuppressWarnings("serial")
public class DatabaseConnection implements Serializable {
	private static Connection  myConnection;
 
	public static Connection openDBConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			myConnection = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclesrv.ad.csbsju.edu:1521/csci.cscioraclesrv.ad.csbsju.edu","team3", "bccdw");
			return myConnection;
		} catch (SQLException | ClassNotFoundException E) { }
		return null;
}
 
public static void closeDBConnection() {
	 try {
		 myConnection.close();
	 } catch (SQLException E) { }
} 
}

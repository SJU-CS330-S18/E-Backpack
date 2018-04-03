package entity;

import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.*;

/**
 * A class representing a specific Event to be added to the Users personal planner calender
 * 
 * @author k1moua
 *
 */

public class Event implements Serializable {
	  /**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		private String eventtitle;
		private String eventdescription;
		private String location;
		private Date eventdate;
		private Timestamp starttime;
		private Timestamp endtime;
		private String username;
	
	/**
	 * Constructor of the event class to create an instance of Event comprised of the 
	 * specific information provided in the parameters.
	 * @param title: the name of the event
	 * @param location: the location the event is being held
	 * @param description: a small description of what the event is for
	 * @param date: the calendar date the event is happening
	 * @param courseRelation: the course associated with the event, if there is one
	 * @param scheudledTime: the specific start time of the event
	 */
	
	public Event(String eventtitle, String eventdescription, String location, Date eventdate, Timestamp starttime, Timestamp endtime, String username) {
		
		this.eventtitle = eventtitle;
		this.eventdescription = eventdescription;
		this.location = location;
		this.eventdate = eventdate;
		this.starttime = starttime;
		this.endtime = endtime;
		this.username = username;
	}
	
	
	private PreparedStatement pstmt;
	  private Statement stmt;
	  private ResultSet result;
	  private Connection con;
	  private CallableStatement callStmt;
	  
	  
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
	 * returns the title of the event
	 * @returns string title
	 */
	
	public String getEventTitle() {
		return eventtitle;
	}
	
	/**
	 * sets the title of the event
	 * @return void 
	 */
	
	public void setEventTitle(String newTitle) {
		this.eventtitle = newTitle;
	}
	
	/**
	 * returns the location of the event
	 * @return String location
	 */
	
	public String getLocation() {
		return location;
	}
	
	/**
	 * sets the location of the event
	 * @return void 
	 */
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	/**
	 * returns the description of the event
	 * @return String description
	 */
	
	public String getEventDescription() {
		return eventdescription;
	}
	
	/**
	 * sets the description of the event
	 * @return void 
	 */
	
	public void setEventDescription(String eventdescription) {
		this.eventdescription = eventdescription;
	}
	
	/**
	 * returns the date of the event
	 * @return String date
	 */
	
	public Date getEventDate() {
		return eventdate;
	}
	
	/**
	 * sets the date of the event
	 * @return void 
	 */
	
	public void setEventDate(Date eventdate) {
		this.eventdate = eventdate;
	}
	
	
	/**
	 * returns the scheduled start time of the event
	 * @return int scheduledTime
	 */
	
	public Timestamp getStarttime() {
		return starttime;
	}
	
	/**
	 * sets the scheduled start time of the event
	 * @return void 
	 */
	
	public void setStarttime(Timestamp starttime) {
		this.starttime = starttime;
	}
	
	/**
	 * returns the scheduled start time of the event
	 * @return int scheduledTime
	 */
	
	public Timestamp getEndtime() {
		return endtime;
	}
	
	/**
	 * sets the scheduled start time of the event
	 * @return void 
	 */
	
	public void setEndtime(Timestamp endtime) {
		this.endtime = endtime;
	}
	

	 /* This method uses a CallStatement object to call an SQL stored procedure
	  * Procedure team5.STUDENT_ADD_EVENT  to  add a event to the calendar.**/
	 
	 public void addEvent(Date eventdate, Timestamp starttime, Timestamp endtime) {
		   
		   try{
			    con = openDBConnection();
			    callStmt = con.prepareCall(" {call team5.STUDENT_ADD_EVENT(?,?,?,?,?,?,?)}");
			    callStmt.setString(1,this.eventtitle);
			    callStmt.setString(2,this.eventdescription);
			    callStmt.setString(3,this.location);
			    callStmt.setDate(4,(java.sql.Date) eventdate);
			    callStmt.setTimestamp(5,(java.sql.Timestamp) starttime);
			    callStmt.setTimestamp(6,(java.sql.Timestamp) endtime);
			    callStmt.setString(7,this.username);
			    callStmt.execute();
			    callStmt.close();
		   } catch (Exception E) {
		             E.printStackTrace();
		   }
	}
}

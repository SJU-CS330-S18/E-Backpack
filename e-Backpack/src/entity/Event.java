package entity;

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
		private static final long serialVersionUID = 1L;{

	private String title, location, description, date, courseRelation;
	private int scheduledTime;
	
	
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
	
	/**
	 * returns the title of the event
	 * @returns string title
	 */
	
	public String getEventTitle() {
		return title;
	}
	
	/**
	 * sets the title of the event
	 * @return void 
	 */
	
	public void setEventTitle(String newTitle) {
		this.title = newTitle;
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
	
	public String getEventDate() {
		return eventdate;
	}
	
	/**
	 * sets the date of the event
	 * @return void 
	 */
	
	public void setEventDate(String eventdate) {
		this.eventdate = eventdate;
	}
	
	
	/**
	 * returns the scheduled start time of the event
	 * @return int scheduledTime
	 */
	
	public int getStarttime() {
		return starttime;
	}
	
	/**
	 * sets the scheduled start time of the event
	 * @return void 
	 */
	
	public void setStarttime(int starttime) {
		this.starttime = starttime;
	}
	
	/**
	 * returns the scheduled start time of the event
	 * @return int scheduledTime
	 */
	
	public int getEndtime() {
		return endtime;
	}
	
	/**
	 * sets the scheduled start time of the event
	 * @return void 
	 */
	
	public void setEndtime(int endtime) {
		this.endtime = endtime;
	}
	

	 /* This method uses a CallStatement object to call an SQL stored procedure
	  * Procedure team5.STUDENT_ADD_EVENT  to  add a event to the calendar.**/
	 
	 public void addEvent() {
		   
		   try{
			    con = openDBConnection();
			    callStmt = con.prepareCall(" {call team5.STUDENT_ADD_EVENT(?,?,?,?,?,?,?)}");
			    callStmt.setString(1,this.eventtitle);
			    callStmt.setString(2,this.eventdescription);
			    callStmt.setString(3,this.location);
			    callStmt.setDate(4,(java.sql.Date) this.eventdate);
			    callStmt.setTimestamp(5,(java.sql.Timestamp) this.starttime);
			    callStmt.setTimestamp(6,(java.sql.Timestamp) this.endtime);
			    callStmt.setString(7,this.username);
			    callStmt.execute();
			    callStmt.close();
		   } catch (Exception E) {
		             E.printStackTrace();
		   }
	}
}

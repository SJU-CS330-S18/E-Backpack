package Entity;

import java.util.*;

/**
 * A class representing a specific Event to be added to the Users personal planner calender
 * 
 * @author sjhalloran
 *
 */

public class Event {

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
	
	public Event(String title, String location, String description, String date, String courseRelation, int scheduledTime) {
		
		this.title = title;
		this.location = location;
		this.description = description;
		this.date = date;
		this.courseRelation = courseRelation;
		this.scheduledTime = scheduledTime;
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
	
	public String getEventLocation() {
		return location;
	}
	
	/**
	 * sets the location of the event
	 * @return void 
	 */
	
	public void setEventLocation(String newLoc) {
		this.location = newLoc;
	}
	
	/**
	 * returns the description of the event
	 * @return String description
	 */
	
	public String getEventDescription() {
		return description;
	}
	
	/**
	 * sets the description of the event
	 * @return void 
	 */
	
	public void setEventDescription(String newDesc) {
		this.description = newDesc;
	}
	
	/**
	 * returns the date of the event
	 * @return String date
	 */
	
	public String getEventDate() {
		return date;
	}
	
	/**
	 * sets the date of the event
	 * @return void 
	 */
	
	public void setEventDate(String newDate) {
		this.date = newDate;
	}
	
	/**
	 * returns the course the event is related too
	 * @return String course name
	 */
	
	public String getEventCourse() {
		return courseRelation;
	}
	
	/**
	 * sets the course the event is related too
	 * @return void 
	 */
	
	public void setEventCourse(String newCourse) {
		this.courseRelation = newCourse;
	}
	
	/**
	 * returns the scheduled start time of the event
	 * @return int scheduledTime
	 */
	
	public int getEventTime() {
		return scheduledTime;
	}
	
	/**
	 * sets the scheduled start time of the event
	 * @return void 
	 */
	
	public void setEventTime(int newTime) {
		this.scheduledTime = newTime;
	}
}

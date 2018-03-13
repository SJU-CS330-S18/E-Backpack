package sample;

import java.io.Serializable;

import java.util.Calendar;

/**
 * Class used to hold information pertaining to an item
 * @author tnweiss
 */
@SuppressWarnings("serial")
public class Item implements Serializable{
	private int itemID;
	private String itemName;
	private String description;
	private double startingBid;
	private Calendar startDate;
	private Calendar endDate;
	private String category;
	private double currentBid;
	private String status;
	
	/**
	 * Default Constructor
	 */
	public Item() {
		
	}
	
	/**
	 * Get the item ID
	 * @return the item ID
	 */
	public int getItemID() {
		return itemID;
	}
	
	/**
	 * Set the item ID
	 * @param itemID the new item ID
	 */
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	
	/**
	 * Get the item name
	 * @return the item name
	 */
	public String getItemName() {
		return itemName;
	}
	
	/**
	 * Set the item name
	 * @param itemName the new item name
	 */
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	/**
	 * Get the item description
	 * @return the item description
	 */
	public String getDescription() {
		return description;
	}
	
	/**
	 * Set the item description
	 * @param description the new Description
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
	/**
	 * Get the starting bid
	 * @return the starting bid
	 */
	public double getStartingBid() {
		return startingBid;
	}
	
	/**
	 * Set the starting bid
	 * @param startingBid the new starting bid
	 */
	public void setStartingBid(double startingBid) {
		this.startingBid = startingBid;
	}
	
	/**
	 * Get the start date
	 * @return the start date
	 */
	public Calendar getStartDate() {
		return startDate;
	}
	
	/**
	 * Set the start date
	 * @param startDate the new start date
	 */
	public void setStartDate(Calendar startDate) {
		this.startDate = startDate;
	}
	
	/**
	 * Get the end date
	 * @return the end date
	 */
	public Calendar getEndDate() {
		return endDate;
	}
	
	/**
	 * Set the end date
	 * @param endDate the end date
	 */
	public void setEndDate(Calendar endDate) {
		this.endDate = endDate;
	}
	
	/**
	 * Get the category
	 * @return the category for the item
	 */
	public String getCategory() {
		return category;
	}
	
	/**
	 * Set the category for the item
	 * @param category the new category
	 */
	public void setCategory(String category) {
		this.category = category;
	}
	
	/**
	 * Get the current bid
	 * @return the current bid
	 */
	public double getCurrentBid() {
		return currentBid;
	}
	
	/**
	 * Set the current bid
	 * @param currentBid the new current bid
	 */
	public void setCurrentBid(double currentBid) {
		this.currentBid=currentBid;
	}
	
	/**
	 * Get the status
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	
	/**
	 * Set the status
	 * @param status the new status
	 */
	public void setStatus(String status) {
		this.status=status;
	}

	/**
	 * @return get all the information for the item
	 */
	@Override
	public String toString() {
		return "Item [itemID=" + itemID + ", itemName=" + itemName + ", description=" + description + ", startingBid="
				+ startingBid + ", startDate=" + startDate + ", endDate=" + endDate + ", category=" + category
				+ ", currentBid=" + currentBid + ", status=" + status + "]";
	}
	
	/**
	 * check the parameters for the add item functionality
	 * @param startingBid the starting bid
	 * @param endDate the end date
	 * @return an int representing the validity for the params
	 */
	public int checkAddItemParams(String startingBid, String endDate, Calendar current) {
		if(this.itemName == null || this.itemName.length()==0) {
			return 1;
		}else if(this.description == null || this.description.length()==0) {
			return 4;
		}
		try{Double.parseDouble(startingBid);}catch(Exception ex){return 2;}
		try{
			if(current.after(Customer.stringToCalendar(endDate))){
				return 5;
			}
		}catch(Exception ex){return 3;}

		return 0;
	}
}

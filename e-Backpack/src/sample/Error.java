package sample;

import java.io.Serializable;
/**
 * used to hold and throw system errors
 * @author apec
 *
 */
@SuppressWarnings("serial")
public class Error implements Serializable{
	private String error;

	/**
	 * default constructor, initialize the error to an empty string
	 */
	public Error() {
		this.error = "";
	}
	
	/**
	 * Get the error and then clear the system error
	 * @return a string representation of the error
	 */
	public String getError() {
		String retVal = this.error;
		this.error="";
		return retVal;
	}

	/**
	 * set the System error
	 * @param error the new system error
	 */
	public void setError(String error) {
		this.error = error;
	}
	
	/**
	 * Get error messages for the search functionality
	 * @param error the error code
	 * @return a string represention of the error code
	 */
	public static String getSearchErrorMessage(int error) {
		switch(error) {
			case 1:
				return "You can only search by itemID alone";
			case 2:
				return "You can only search by Item Name alone";
			case 3:
				return "Low bid Should be less than High bid";
			case 4:
				return "Start date should be before end date";
			case 5:
				return "You need to enter search criteria";
			case 6:
				return "Improper Date Format";
			case 7:
				return "Auction Ends After AND Ends Before must both be submitted";
			case 8:
				return "BOTH high and low value's must be submitted for current bid";
			case 9:
				return "There was a formatting error";
			case 10:
				return "You must enter a keyword";
		}
		return "Did not recognize error code " + error;
	}
	
	/**
	 * Get the error messages associated with the login page
	 * @param error the login error code
	 * @return a string representation of the error code
	 */
	public static String getLoginErrorMessage(int error) {
		switch(error) {
			case 0:
				return "";
			case 1:
				return "You must login to access the system";
			case 2:
				return "You are not an admin";
			case 3:
				return "You are not a Customer";
			
		}
		return "Did not recognize error code " + error;
	}
	
	/**
	 * Get the error message for the add user functionality
	 * @param error the error code
	 * @return the string representation for the error code
	 */
	public static String getAddUserErrorMessage(int error) {
		switch(error) {
			case 0:
				return "";
			case 1:
				return "Password Mismatch";
			case 2:
				return "You must enter a Username";
			case 3:
				return "You must enter BOTH a First and Last name";
			case 4:
				return "You must enter an Email Address";
			
		}
		return "Did not recognize error code " + error;
	}
	
	/**
	 * Get the error messages associate with the searc user functionality
	 * @param error the error code
	 * @return the string representation for the error code
	 */
	public static String getSearchUserErrorMessage(int error) {
		switch(error) {
			case 0:
				return "";
			case 1:
				return "You must enter search criteria";
			case 2:
				return "You can ONLY search by customer ID";
			case 3:
				return "You can ONLY search by Username";
			case 4:
				return "You can ONLY search by First and Last name";
			
		}
		return "Did not recognize error code " + error;
	}
	
	/**
	 * Get the error message associated with the add items functionality
	 * @param error the error code
	 * @return the string associated with the error code
	 */
	public static String getAddItemErrorMessage(int error) {
		switch(error) {
			case 0:
				return "";
			case 1:
				return "Item name required";
			case 2:
				return "Starting bid must be a number";
			case 3:
				return "End date must be in the format YYYY-MM-DD";
			case 4:
				return "Please Describe the item";
			case 5:
				return "The end date must be after the current date";
		}
		return "Did not recognize error code " + error;
	}
}

package Entity;

public class User extends Account{
	
	/**
	 * List of School name that user has been saved
	 */
	//private ArrayList<Notes> Notebook;
	
	/**
	 * User Constructor sets all the basic information
     * Call constructor of the superclass Account
	 * 
	 * @param firstname first name of the user
	 * @param lastname last name of the user
	 * @param username user name of the user
	 * @param password password of the user
	 * @param status status of the user whether the account is activated or not
	 * @param loggedIn status of the user whether the account is loggedIn
	 */
	public User(String firstname, String lastname, String username, String password, String status,
			boolean loggedIn) {
		super(firstname, lastname, username, password, "u", status, loggedIn);
	}
	
	/**
	 * Method which will return list of saved school of user
	 * 
	 * @return list of savedSchool of user
	 */
}

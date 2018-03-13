package sample;

/**
 * Used for search results to set the default parameters
 * @author apec
 */
@SuppressWarnings("serial")
public class CustomerSearchObject extends CustomerIdentity{
	/**
	 * Default constructor that sets the fields to an empty string to avoid null pointer exceptions
	 */
	public CustomerSearchObject() {
		this.username = "";
		this.first_name = "";
		this.last_name = "";
		this.email = "";
		this.customerID=0;
	}
}

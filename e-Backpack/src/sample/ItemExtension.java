package sample;

/**
 * Variant of Item. the current bid is a string to allow for ' - ' entries in the list items table
 * @author apec
 */
@SuppressWarnings("serial")
public class ItemExtension extends Item{
	private String currentBidString;

	/**
	 * Default constructor
	 */
	public ItemExtension() {
		
	}
	
	/**
	 * Get the current bid as a string
	 * @return the current bid
	 */
	public String getCurrentBidString() {
		return currentBidString;
	}

	/**
	 * Set the current bid as a string and attempt to parse the string as a double and pass it 
	 * to the current bid in the item class
	 * @param currentBid the new current bid
	 */
	public void setCurrentBidString(String currentBid) {
		try {this.setCurrentBid(Double.parseDouble(currentBid));}catch(Exception ex) {}
		this.currentBidString = currentBid;
	}
}

package sample;

public class SSRItem {
	private String category;
	private int itemID;
	private String itemName;
	private int final_selling_price;
	private double commission;
	
	
	
	public SSRItem(String category, int itemID, String itemName, int final_selling_price, double commission) {
		super();
		this.category = category;
		this.itemID = itemID;
		this.itemName = itemName;
		this.final_selling_price = final_selling_price;
		this.commission = commission;
	}
	
	public SSRItem() {
		
	}
	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}
	/**
	 * @return the itemID
	 */
	public int getItemID() {
		return itemID;
	}
	/**
	 * @param itemID the itemID to set
	 */
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	/**
	 * @return the itemName
	 */
	public String getItemName() {
		return itemName;
	}
	/**
	 * @param itemName the itemName to set
	 */
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	/**
	 * @return the final_selling_price
	 */
	public int getFinal_selling_price() {
		return final_selling_price;
	}
	/**
	 * @param final_selling_price the final_selling_price to set
	 */
	public void setFinal_selling_price(int final_selling_price) {
		this.final_selling_price = final_selling_price;
	}
	/**
	 * @return the commission
	 */
	public double getCommission() {
		return commission;
	}
	/**
	 * @param commission the commission to set
	 */
	public void setCommission(double commission) {
		this.commission = commission;
	}
}

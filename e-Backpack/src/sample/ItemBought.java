package sample;

public class ItemBought {
	private int itemID;
	private String itemName;
	private String category;
	private double startingBid;
	private double winningBid;
	private String startDate;
	private String endDate;
	private String username;
	private String email;
	
	public int getItemID() {
		return itemID;
	}
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public double getWinningBid() {
		return winningBid;
	}
	public void setWinningBid(double winningBid) {
		this.winningBid = winningBid;
	}
	public double getStartingBid() {
		return startingBid;
	}
	public void setStartingBid(double startingBid) {
		this.startingBid = startingBid;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}

package sample;

public class Rating {
	private int itemID;
	private String itemName;
	private int overallRating;
	private int quality;
	private int delivery;
	private String comment;
	private String bidderUsername;
	
	public Rating(int itemID, String itemName, int overallRating, int quality, 
			int delivery, String ratingComment, String bidderUsername) {
		this.itemID = itemID;
		this.itemName = itemName;
		this.overallRating = overallRating;
		this.quality = quality;
		this.delivery = delivery;
		this.comment = ratingComment;
		this.bidderUsername = bidderUsername;
	}
	
	public Rating() {
		
	}
	
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
	public int getOverallRating() {
		return overallRating;
	}
	public void setOverallRating(int overallRating) {
		this.overallRating = overallRating;
	}
	public int getQuality() {
		return quality;
	}
	public void setQuality(int quality) {
		this.quality = quality;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public String getRatingComment() {
		return comment;
	}
	public void setRatingComment(String ratingComment) {
		this.comment = ratingComment;
	}
	public String getBidderUsername() {
		return bidderUsername;
	}
	public void setBidderUsername(String bidderUsername) {
		this.bidderUsername = bidderUsername;
	}
}

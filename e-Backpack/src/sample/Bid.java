package sample;
/**
 * Bid class used to hold data pertaining to bids
 * @author apec
 *
 */
public class Bid {
	private String bidding_time, bidder_username, max_bid;

	/**
	 * Get the bidding time
	 * @return the bidding time
	 */
	public String getBidding_time() {
		return bidding_time;
	}

	/**
	 * Set the bidding time
	 * @param bidding_time the new bidding time
	 */
	public void setBidding_time(String bidding_time) {
		this.bidding_time = bidding_time;
	}

	/**
	 * Get the Bidder username
	 * @return the bidder username
	 */
	public String getBidder_username() {
		return bidder_username;
	}

	/**
	 * Set the bidder username
	 * @param bidder_username the new bidder username
	 */
	public void setBidder_username(String bidder_username) {
		this.bidder_username = bidder_username;
	}

	/**
	 * Get the max bid
	 * @return the max bid
	 */
	public String getMax_bid() {
		return max_bid;
	}

	/**
	 * Set the max bid
	 * @param max_bid the new max bid
	 */
	public void setMax_bid(String max_bid) {
		this.max_bid = max_bid;
	}
	
}

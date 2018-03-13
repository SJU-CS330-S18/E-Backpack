package sample;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import apec.DatabaseConnection;

/**
 * used to handle all the method calls for the customer
 * @author apec
 */
@SuppressWarnings("serial")
public class Customer extends CustomerIdentity{
	int searchError;
	
	/**
	 * default Constructor, set error to 0 because there are no errors present
	 */
	public Customer() {
		super();
		this.searchError = 0;
	}
	
	/**
	 * Set the customers property fields
	 * @param user the object holding the username and password for the user
	 */
	public void setCustomer(UserIdentity user) {
		setCustomerIdentity(user);
	}
	
	/**
	 * Gets the rating of the specific customer along with the count.
	 * @return the ratings for this particular customer
	 */
	public int[] getSellerRating() {
		int[] rating = new int[2];
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		try {
			String query = "SELECT AVG(overall_rating) AS rating, Count(*) AS numratings"+
						   " FROM  rating r, item i"+
						   " WHERE r.itemid=i.itemid AND seller_username=?"+
						   " GROUP BY seller_username";
			stmt = con.prepareStatement(query);
			stmt.setString(1,this.username);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				rating[0] = rs.getInt("rating");
				rating[1] = rs.getInt("numratings");
			}
			rs.close();
			stmt.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DatabaseConnection.closeDBConnection();
		return rating;
	}
	
	/**
	 * Updates the users profile
	 */
	public void updateProfile() {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		try {
			String query = "UPDATE user_identity SET password=? WHERE username=?";
			stmt = con.prepareStatement(query);
			stmt.setString(1, this.password);
			stmt.setString(2, this.username);
			if(stmt.executeUpdate() == 0) {
				//error handling
			}
			
			query = "UPDATE customer SET "+
					"email=?, "+
					"first_name=?, "+
					"last_name=?, "+
					"phone_number=? "+
					"WHERE username=?";
			stmt = con.prepareStatement(query);
			stmt.clearParameters();
			stmt.setString(1, this.email);
			stmt.setString(2, this.first_name);
			stmt.setString(3, this.last_name);
			stmt.setString(4, this.phone_number);
			stmt.setString(5, this.username);
			if(stmt.executeUpdate() == 0) {
				//error handling
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DatabaseConnection.closeDBConnection();
	}
	
	/**
	 * Used for List Items Functionality
	 * @return an array of all the items sold by a customer
	 */
	public ArrayList<ItemExtension> getItemList() {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		ArrayList<ItemExtension> items = new ArrayList<ItemExtension>();
		try {
			String query = "SELECT itemid,item_name,category,startdate, enddate, startingbid, Status,CASE WHEN Winning_Bid=0 THEN '-' ELSE TO_CHAR(Winning_Bid) END AS winning_bid "+
					"FROM ( " + 
					"SELECT it.itemid, it.item_name,it.category, it.startdate, it.enddate, it.startingbid, Current_Winning_Bid_Func(it.itemID) as Winning_Bid, determine_Status_func(it.itemID) as Status "+
					"FROM item it where it.seller_username=? order by it.itemid) ";
			
			stmt = con.prepareStatement(query);
			stmt.setString(1, this.username);
			ResultSet rs = stmt.executeQuery();
			ItemExtension temp;
			
			while(rs.next()) {
				Calendar cal = new GregorianCalendar();
				Calendar cal2 = new GregorianCalendar();
				temp=new ItemExtension();
				temp.setCategory(rs.getString("category"));
				temp.setItemName(rs.getString("item_name"));
				temp.setItemID(rs.getInt("itemID"));
				cal.setTime(rs.getDate("startdate"));
				temp.setStartDate(cal);
				cal2.setTime(rs.getDate("enddate"));
				temp.setEndDate(cal2);
				temp.setStartingBid(rs.getDouble("startingbid"));
				temp.setCurrentBidString(rs.getString("Winning_Bid"));
				temp.setStatus(rs.getString("status"));
				items.add(temp);
			}
			rs.close();
			stmt.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DatabaseConnection.closeDBConnection();
		return items;
	}
	
	/**
	 * used to determine the next ItemID
	 * @return the highest itemID
	 */
	public int getHighestItemID() {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		String query = "select itemID from item where itemID = (select Max(itemID) from item)";
		int out = -1;
		try {
			stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				out = rs.getInt(1);
			}
			rs.close();
			stmt.close();
			con.close();
		}catch(SQLException e) {
			e.printStackTrace();
			DatabaseConnection.closeDBConnection();
			return out;
		}
		return out+1;
	}
	
	/**
	 * Used to display item info
	 * @param itemID the id of the item 
	 * @return information about the item
	 */
	public Item getItemInfo(String itemID) {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		Item item = new Item();
		try {
			String query = "SELECT * FROM item WHERE itemid=?";
			stmt = con.prepareStatement(query);
			stmt.clearParameters();
			stmt.setString(1, itemID);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				Calendar cal = new GregorianCalendar();
				Calendar cal2 = new GregorianCalendar();
				item.setCategory(rs.getString("category"));
				item.setItemID(rs.getInt("itemID"));
				cal.setTime(rs.getDate("startdate"));
				item.setStartDate(cal);
				cal2.setTime(rs.getDate("enddate"));
				item.setEndDate(cal2);
				item.setStartingBid(rs.getDouble("startingbid"));
				item.setDescription(rs.getString("description"));
				item.setItemName(rs.getString("item_name"));
			}

			rs.close();
			stmt.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DatabaseConnection.closeDBConnection();
		return item;
	}
	
	/**
	 * Used to display the List of bidders
	 * @param itemid the itemid 
	 * @return a resultset containing information about those who bid on this item.
	 */
	public ResultSet getListOfBidders(String itemid) {
		String query = "Select bidding_time,bidder_username, max_bid "+
				"FROM BID b, item it "+
				"where b.itemID=? and it.itemid = b.itemid "+
				"order by bidding_time ";
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(query);
			stmt.setString(1, itemid);
			rs = stmt.executeQuery();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * get the list of bidders
	 * @param itemid the item id for the particular item
	 * @return an array list of bid objects containing informaiton about the bids
	 */
	public ArrayList<Bid> getListOfBidderss(String itemid) {
		ArrayList<Bid> bids = new ArrayList<Bid>();
		String query = "Select bidding_time,bidder_username, max_bid "+
				"FROM BID b, item it "+
				"where b.itemID=? and it.itemid = b.itemid "+
				"order by bidding_time ";
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(query);
			stmt.clearParameters();
			stmt.setString(1, itemid);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Bid bid = new Bid();
				bid.setBidder_username(rs.getString("bidder_username"));
				bid.setBidding_time(rs.getString("bidding_time"));
				bid.setMax_bid(rs.getString("max_bid"));
				bids.add(bid);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return bids;
	}
	
	/**
	 *  used to get the current date
	 * @return gets the current date for the databse
	 */
	public Calendar getCurrentDBDate() {
		String query = "select sys_extract_utc(systimestamp) from dual";
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		ResultSet rs = null;
		Calendar date = new GregorianCalendar();
		try {
			stmt = con.prepareStatement(query);
			stmt.clearParameters();
			rs = stmt.executeQuery();
			if(rs.next()) {
				date.setTime(rs.getDate(1));
			}
			
			con.close();
		}catch(SQLException e) {
			e.printStackTrace();
			return date;
		}
		return date;
	}
	
	/**
	 * used to search for items
	 * @param so the object containing the search parameters
	 * @return an arraylist of items matching the search
	 */
	public ArrayList<Item> search(SearchObject so){
		ArrayList<Item> results = new ArrayList<Item>();
		Connection con = DatabaseConnection.openDBConnection();
		String query = "SELECT itemid, item_name, category, startdate, enddate, current_winning_bid_func(itemid) as current_bid FROM item WHERE ";
		PreparedStatement stmt = null;
		Calendar cal;
		Item item;
		ResultSet rs;
		
		try {
			if(so.getItemid().length()>0) {
				//itemid search
				query += "itemid=?";
				stmt = con.prepareStatement(query);
				stmt.setString(1, so.getItemid());
			}else if(so.getItemname().length()>0) {
				//itemname search
				query += " SOUNDEX(item_name)=SOUNDEX(?) ";
				stmt = con.prepareStatement(query);
				stmt.setString(1, so.getItemname());
			}else {
				//rest search
				ArrayList<String> data = new ArrayList<String>();
				if(so.getStart().length()>0) {
					query += " (enddate>? AND enddate<?) ";
					data.add("~"+so.getStart());
					data.add("~"+so.getEnd());
				}
				if(so.getCategory().length()>0) {
					if(data.size() > 0) {
						query += " AND ";
					}
					query += "category=?";
					data.add(so.getCategory());
				}
				if(so.getKeyword().length()>0) {
					if(data.size() > 0) {
						query += " AND ";
					}
					query += "description LIKE ?";
					data.add("%"+so.getKeyword()+"%");
				}
				if(so.getLowbid().length()>0) {
					query = " SELECT * FROM ( " + query;
					if(data.size()==0) {
						query += " 1=1 "; ;
					}
					query += ") WHERE current_bid<=? AND current_bid>=?";
					data.add(so.getHighbid());
					data.add(so.getLowbid());
				}
				stmt = con.prepareStatement(query);
				for(int i=0; i<data.size(); i++) {
					if(data.get(i).charAt(0) == '~') {
						stmt.setDate(i+1, java.sql.Date.valueOf(data.get(i).substring(1)));
					}else {
						stmt.setString(i+1, data.get(i));
					}
				}
			}
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				item = new Item();
				item.setItemID(rs.getInt("itemid"));
				item.setItemName(rs.getString("item_name"));
				item.setCategory(rs.getString("category"));
				cal= new GregorianCalendar();
				cal.setTime(rs.getDate("startdate"));
				item.setStartDate(cal);
				cal= new GregorianCalendar();
				cal.setTime(rs.getDate("enddate"));
				item.setEndDate(cal);
				item.setCurrentBid(rs.getDouble("current_bid"));
				results.add(item);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DatabaseConnection.closeDBConnection();
		return results;
	}
	
	/**
	 * 0 = no errors
	 * 1 = itemID should be alone
	 * 2 = itemname should be alone
	 * 3 = lowbid should be less than highbid
	 * 4 = startdate should be before enddate
	 * 5 = nothing has been filled out
	 * 6 = improper date format
	 * 7 = start and end must be specified for date
	 * 8 = high and low must be specified
	 * 9 = format exception
	 * 10 = need to fill out keyword
	 * @param so the object holding the search parameters
	 * @return an int determining whether the parameters are valid 0=good !0=bad
	 */
	public int checkSearchParams(SearchObject so) {
		boolean itemidFilled = so.getItemid().length() > 0;
		//keyword along with all other variables grouped into one boolean
		boolean klhseFilled = so.getKeyword().length() > 0 || 
				so.getCategory().length() >0 || 
				so.getLowbid().length() >0 
				|| so.getHighbid().length()>0 
				|| so.getStart().length()>0 || 
				so.getEnd().length()>0;
		boolean itemnameFilled = so.getItemname().length()>0;
		boolean startFilled = so.getStart().length()>0;
		boolean endFilled = so.getEnd().length()>0;

		if(startFilled && endFilled) {
			try {
				String[] start = so.getStart().split("-");

				String[] end = so.getEnd().split("-");
				Calendar startCal = Calendar.getInstance();
				startCal.set(Integer.parseInt(start[0]), Integer.parseInt(start[1]), Integer.parseInt(start[2]));
				Calendar endCal = Calendar.getInstance();
				endCal.set(Integer.parseInt(end[0]), Integer.parseInt(end[1]), Integer.parseInt(end[2]));
				if(startCal.after(endCal)) {
					return 4;
				}
			}catch(Exception ex) {
				return 6;
			}
		}else if(startFilled || endFilled){
			return 7;
		}
		
		try {
			if(itemidFilled && (klhseFilled || itemnameFilled)) {
				return 1;
			}else if(itemnameFilled && klhseFilled) {
				return 2;
			}else if(so.getLowbid().length() > 0 && so.getHighbid().length()>0 && Double.parseDouble(so.getLowbid()) > Double.parseDouble(so.getHighbid())) {
				return 3;
			}else if(!itemidFilled && !klhseFilled && !itemnameFilled){
				return 5;
			}else if(klhseFilled && so.getKeyword().length()==0){
				return 10;
			}else if((so.getHighbid().length()>0 && so.getLowbid().length()==0) || (so.getHighbid().length()==0 && so.getLowbid().length()>0)) {
				return 8;
			}else {
				return 0;
			}
		}catch(Exception ex) {
			return 9;
		}
	}
	
	/**
	 * used to set the search error
	 * @param error the error code
	 */
	public void setSearchError(int error) {
		this.searchError = error;
	}
	
	/**
	 * return the search error and clear it
	 * @return the error code
	 */
	public int getSearchError() {
		int error = this.searchError;
		this.searchError = 0;
		return error;
	}
	
	/**
	 * used to add an item to the database
	 * @param item the item object we are adding to the database
	 * @return true or false based on the insert
	 */
	public boolean addItem(Item item) {
		try {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		String item_insert = "INSERT INTO item (itemID, item_name, description, startingBid, startDate, endDate, category, seller_username) VALUES (itemID_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
		stmt = con.prepareStatement(item_insert);
		stmt.setString(1, item.getItemName());
		stmt.setString(2, item.getDescription());
		stmt.setDouble(3, item.getStartingBid());
		stmt.setDate(4, new Date(item.getStartDate().getTimeInMillis()));
		stmt.setDate(5, new Date(item.getEndDate().getTimeInMillis()));
		stmt.setString(6, item.getCategory());
		stmt.setString(7, this.username);
		stmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return true;
	}
	
	/**
	 * bid on an item
	 * @param item the item to bid on
	 * @param maxBid the bid to place on the item
	 * @return true or false based on the insert
	 */
	public boolean bidOn(Item item, double maxBid) {
		boolean retVal = true;
		try {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		String item_bid = "INSERT INTO bid (itemID, bidder_username, max_bid, bidding_time) VALUES (?, ?, ?, sys_extract_utc(systimestamp))";
		stmt = con.prepareStatement(item_bid);
		stmt.setInt(1, item.getItemID());
		stmt.setString(2, this.username);
		stmt.setDouble(3, maxBid);
		if(stmt.executeUpdate() == 0) {
			retVal = false;
		}
		}catch(Exception ex) {
			ex.printStackTrace();
			retVal = false;
		}
		DatabaseConnection.closeDBConnection();
		return retVal;
	}
	
	/**
	 * used to convert a string to a calendar
	 * @param cal the string to convert
	 * @return the calendar obect for the string
	 * @throws ParseException if the format of the string is incorrect
	 */
	public static Calendar stringToCalendar(String cal) throws ParseException {
		Calendar c = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		c.setTime(sdf.parse(cal));
		return c;
	}
	
	/**
	 * convert a calendar object to a string
	 * @param cal the object to convert
	 * @return a string representation of the calendar
	 */
	public String CalendarToString(Calendar cal) {
		SimpleDateFormat sd1 = new SimpleDateFormat("yyyy-MM-dd");
		String d= sd1.format(cal.getTime());
		return d;
	}
	
	/**
	 * used to show the list of items bid on
	 * @return an arraylist of items
	 */
	public ArrayList<Item> getListBidOn() {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		ArrayList<Item> items = new ArrayList<Item>();
		try {
			String query = "SELECT it.itemid, it.item_name,it.category, it.startdate, it.enddate, it.startingbid, Current_Winning_Bid_Func(it.itemID) as Winning_Bid, Winning_user_func(it.itemid)\n" + 
					" FROM bid b, item it" + 
					" where b.itemID = it.itemID and"+
					" b.bidder_username = ?" + 
					" order by b.itemid";
			stmt = con.prepareStatement(query);
			stmt.clearParameters();
			stmt.setString(1, this.username);
			ResultSet rs = stmt.executeQuery();
			Item temp;
			while(rs.next()) {
				Calendar cal = new GregorianCalendar();
				Calendar cal2 = new GregorianCalendar();
				cal.setTime(rs.getDate("startdate"));
				cal2.setTime(rs.getDate("enddate"));
				temp=new Item();
				temp.setCategory(rs.getString("category"));
				temp.setItemName(rs.getString("item_name"));
				temp.setItemID(rs.getInt("itemID"));
				temp.setStartDate(cal);
				temp.setEndDate(cal2);
				temp.setStartingBid(rs.getDouble("startingbid"));
				temp.setCurrentBid(rs.getInt(7));
				temp.setStatus(rs.getString(8));
				items.add(temp);
			}
			rs.close();
			stmt.close();
			con.close();
		}catch(Exception ex) {
			ex.printStackTrace();
			return items;
		}
		return items;
	}
	
	/**
	 * used to get the list of items bought
	 * @return an arraylist of items
	 */
	public ArrayList<ItemBought> getListOfItemsBought() {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		ArrayList<ItemBought> itemsBought = new ArrayList<ItemBought>();
		try {
			// non-working WITH statement
			//with two as (select max(b2.max_bid) from bid b, bid b2 where b.bidder_username='smcarik' and b.itemid = b2.itemid),
			//three as (select min(b3.bidding_time) from bid b, bid b3 where b.bidder_username='smcarik' and b.itemid = b3.itemid and b3.max_bid = (select * from two))
			//select i.itemid, i.item_name, i.category, i.startdate, i.enddate,i.startingbid, current_winning_bid_func(i.itemid)as Sold_price, i.seller_username, c.email
								//from bid b, item i, customer c 
							//	where b.bidder_username='smcarik' and b.itemid = i.itemid and i.enddate < sys_extract_utc(systimestamp) and c.username = i.seller_username 
			                  //  and b.bidding_time = (select * from three);
			String query = "select i.itemid, i.item_name, i.category, i.startdate, i.enddate,i.startingbid, current_winning_bid_func(i.itemid)as Sold_price, i.seller_username, c.email " +
					"from bid b, item i, customer c "+
					"where b.bidder_username=? and b.itemid = i.itemid and i.enddate < sys_extract_utc(systimestamp) and c.username = i.seller_username "+
					"and bidding_time = (select min(bidding_time) from bid b3 where b.itemid = b3.itemid and max_bid = (select max(max_bid) from bid b2 where b.itemid = b2.itemid))";
			stmt = con.prepareStatement(query);
			//System.out.println(this.username);
			stmt.setString(1,this.username);
			ResultSet rs = stmt.executeQuery();
			ItemBought temp;
			while(rs.next()) {
				temp=new ItemBought();
				temp.setItemID(rs.getInt("itemid"));
				temp.setItemName(rs.getString("item_name"));
				temp.setCategory(rs.getString("category"));
				temp.setStartDate(rs.getString("startdate"));
				temp.setEndDate(rs.getString("enddate"));
				temp.setStartingBid(rs.getDouble("startingbid"));
				temp.setWinningBid(rs.getDouble("Sold_price"));
				temp.setUsername(rs.getString("seller_username"));
				temp.setEmail(rs.getString("email"));
				itemsBought.add(temp);
			}
			rs.close();
			stmt.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DatabaseConnection.closeDBConnection();
		return itemsBought;
	}
	
	/**
	 * used to create a rating for a user
	 * @param itemID the item you are rating
	 */
	public void updateRating(String itemID, int overallRating, int quality, int delivery, String ratingComment) {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		//Rating rating = new Rating();
		try {
			String check="select * from rating where itemid=?";
			PreparedStatement s = con.prepareStatement(check);
			s.clearParameters();
			s.setString(1, itemID);
			ResultSet rs = s.executeQuery();
			if(!rs.next()) {
			String realQuery ="insert into rating (itemid, overall_rating, quality, delivery, rating_comment, bidder_username) values (?,?,?,?,?,?)";
			String query = "UPDATE rating " + "SET "+
					"overall_rating=?, "+
					"quality=?, "+
					"delivery =?, "+
					"rating_comment=? "+
					"where itemId =? ";
			stmt = con.prepareStatement(realQuery);
			stmt.clearParameters();
			stmt.setString(1, itemID);
			stmt.setInt(2, overallRating);
			stmt.setInt(3, quality);
			stmt.setInt(4, delivery);
			stmt.setString(5, ratingComment);
			stmt.setString(6, this.username);
			
			stmt.executeQuery();
			stmt.close();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DatabaseConnection.closeDBConnection();
	}
	
	/**
	 * get the feedback for a particular user
	 * @return an arraylist of ratings
	 */
	public ArrayList<Rating> getMyFeedback() {
		Connection con = DatabaseConnection.openDBConnection();
		PreparedStatement stmt;
		ArrayList<Rating> rating = new ArrayList<Rating>();
		try {						
			String query = "select r.bidder_username, r.itemid, r.overall_rating, r.quality, r.delivery, r.rating_comment "+
					"from rating r, item i "+
					"where seller_username=? and i.itemid = r.itemid ";
			stmt = con.prepareStatement(query);
			//System.out.println(this.username);
			stmt.setString(1,this.username);
			ResultSet rs = stmt.executeQuery();
			Rating temp;
			while(rs.next()) {
				temp=new Rating();
				temp.setBidderUsername(rs.getString("bidder_username"));
				temp.setItemID(rs.getInt("itemid"));
				temp.setOverallRating(rs.getInt("overall_rating"));
				temp.setQuality(rs.getInt("quality"));
				temp.setDelivery(rs.getInt("delivery"));
				temp.setRatingComment(rs.getString("rating_comment"));
				//System.out.println(temp.getBidderUsername()); 
				//System.out.println(temp.getItemID());
				//System.out.println(temp.getOverallRating());
				rating.add(temp);
			}
			rs.close();
			stmt.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DatabaseConnection.closeDBConnection();
		return rating;
	}
}

package sample;


public class OCRUser {
	private int cid;
	private String username;
	private String fname;
	private String lname;
	private String email;
	private double seller_rating;
	private int num_rating;
	private double commission;
	
	
	
	/**
	 * @param cid
	 * @param username
	 * @param fname
	 * @param lname
	 * @param email
	 * @param seller_rating
	 * @param num_rating
	 * @param commission
	 */
	public OCRUser(int cid, String username, String fname, String lname, String email, double seller_rating,
			int num_rating, double commission) {
		super();
		this.cid = cid;
		this.username = username;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.seller_rating = seller_rating;
		this.num_rating = num_rating;
		this.commission = commission;
	}
	
	public OCRUser() {
		
	}
	
	
	/**
	 * @return the cid
	 */
	public int getCid() {
		return cid;
	}
	/**
	 * @param cid the cid to set
	 */
	public void setCid(int cid) {
		this.cid = cid;
	}
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the fname
	 */
	public String getFname() {
		return fname;
	}
	/**
	 * @param fname the fname to set
	 */
	public void setFname(String fname) {
		this.fname = fname;
	}
	/**
	 * @return the lname
	 */
	public String getLname() {
		return lname;
	}
	/**
	 * @param lname the lname to set
	 */
	public void setLname(String lname) {
		this.lname = lname;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the seller_rating
	 */
	public double getSeller_rating() {
		return seller_rating;
	}
	/**
	 * @param seller_rating the seller_rating to set
	 */
	public void setSeller_rating(double seller_rating) {
		this.seller_rating = seller_rating;
	}
	/**
	 * @return the num_rating
	 */
	public int getNum_rating() {
		return num_rating;
	}
	/**
	 * @param num_rating the num_rating to set
	 */
	public void setNum_rating(int num_rating) {
		this.num_rating = num_rating;
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

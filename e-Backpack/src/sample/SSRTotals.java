package sample;

public class SSRTotals {
	private String category;
	private int final_selling_total;
	private double commission;
	
	
	
	/**
	 * @param category
	 * @param final_selling_total
	 * @param commission
	 */
	public SSRTotals(String category, int final_selling_total, double commission) {
		super();
		this.category = category;
		this.final_selling_total = final_selling_total;
		this.commission = commission;
	}
	
	public SSRTotals() {
		
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
	 * @return the final_selling_total
	 */
	public int getFinal_selling_total() {
		return final_selling_total;
	}
	/**
	 * @param final_selling_total the final_selling_total to set
	 */
	public void setFinal_selling_total(int final_selling_total) {
		this.final_selling_total = final_selling_total;
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

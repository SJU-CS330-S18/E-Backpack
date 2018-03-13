package sample;

import java.io.Serializable;

@SuppressWarnings("serial")
public class SearchObject implements Serializable{
	private String itemid, keyword, itemname, lowbid, highbid, start, end, category;

	public SearchObject() {
		this.itemid = "";
		this.keyword = "";
		this.itemname = "";
		this.lowbid ="";
		this.highbid ="";
		this.start = "";
		this.end = "";
		this.category ="";
	}

	public String getItemid() {
		return itemid;
	}

	public void setItemid(String itemid) {
		this.itemid = itemid;
		if(itemid == null) {
			this.itemid = "";
		}
	}

	public String getKeyword() {
		return keyword;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
		if(keyword == null) {
			this.keyword = "";
		}
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
		if(itemname == null) {
			this.itemname = "";
		}
	}

	public String getLowbid() {
		return lowbid;
	}

	public void setLowbid(String lowbid) {
		this.lowbid = lowbid;
		if(lowbid == null) {
			this.lowbid = "";
		}
	}

	public String getHighbid() {
		return highbid;
	}

	public void setHighbid(String highbid) {
		this.highbid = highbid;
		if(highbid == null) {
			this.highbid = "";
		}
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
		if(start == null) {
			this.start = "";
		}
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
		if(end == null) {
			this.end = "";
		}
	}
}

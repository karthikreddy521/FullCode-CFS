package serviceLayer;

import java.util.ArrayList;

public class Branch {
	private String branchName;
	private ArrayList<Year> year=new ArrayList<Year>();
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public ArrayList<Year> getYear() {
		return year;
	}
	public void setYear(ArrayList<Year> year) {
		this.year = year;
	}
	

}

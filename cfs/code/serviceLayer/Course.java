package serviceLayer;

import java.util.ArrayList;

public class Course {
	 private String name;
	 private int duration;
	 private int noOfBranches;
	 ArrayList<Branch> branch=new ArrayList<Branch>();
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setNoOfBranches(int noOfBranches) {
		this.noOfBranches = noOfBranches;
	}
	
	public int getDuration() {
		return duration;
	}
	
	
	public ArrayList<Branch> getBranch() {
		return branch;
	}
	public void setBranch(ArrayList<Branch> branch) {
		this.branch = branch;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public int getNoOfBranches() {
		return noOfBranches;
	}
	public void setNoOfBrancheAndYear(int noOfBranches) {
		this.noOfBranches = noOfBranches;
	}
	
	 
	 

}

package serviceLayer;

import java.util.ArrayList;

public class Year {

	private int year;
	private int noOfSubjects;
	private ArrayList<String> subjects= new ArrayList<String>();
	private int sections;
	public int getSections() {
		return sections;
	}
	public void setSections(int sections) {
		this.sections = sections;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public ArrayList<String> getSubjects() {
		return subjects;
	}
	public void setSubjects(ArrayList<String> subjects) {
		this.subjects = subjects;
	}
	public int getNoOfSubjects() {
		return noOfSubjects;
	}
	public void setNoOfSubjects(int noOfSubjects) {
		this.noOfSubjects = noOfSubjects;
	}
	
	
}

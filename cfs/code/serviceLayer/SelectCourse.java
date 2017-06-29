package serviceLayer;

import java.util.ArrayList;

import dataAccessLayer.CourseDAO;
import dataAccessLayer.FeedBackDAO;

public class SelectCourse {
	String courseName;
	int year;
	String branch;
	String section;
	int Strength;
    
	
	
	


	public int getStrength() {
		return Strength;
	}



	public void setStrength(int strength) {
		Strength = strength;
	}



	public String getCourseName() {
		return courseName;
	}



	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}



	public int getYear() {
		return year;
	}



	public void setYear(int year) {
		this.year = year;
	}



	public String getBranch() {
		return branch;
	}



	public void setBranch(String branch) {
		this.branch = branch;
	}



	public String getSection() {
		return section;
	}



	public void setSection(String section) {
		this.section = section;
		
	}

	

	






	public  ArrayList<String> getCourseNames()
	{
		ArrayList<String> courses= dataAccessLayer.CourseDAO.getCourseNames();
		return courses;
	}
	public ArrayList<String> getBranches() {
		ArrayList<String> branches= dataAccessLayer.CourseDAO.getBranchNames(courseName);
		return branches;
	}
	
	public int getCourseDuration()
	{
	int duration=dataAccessLayer.CourseDAO.getCourseDuration(courseName);	
	return duration;
	}
	public ArrayList<String> getSections()
	{
		return dataAccessLayer.CourseDAO.getSections(courseName, branch, year);
	}
	public boolean storeStudentDetails(ArrayList<Student> students)
	{
		boolean flag=false;
		flag=CourseDAO.addStudentDetailsToDB(courseName, branch, year,section,students);
		return flag;
	}
	public void storeRegistrationStudentDetails(String name,String rollNo,String password,String mailId,String contactNumber)
	{
		CourseDAO.addStudentRegistrationFormDetails(courseName, branch, year, section, name, rollNo, password, mailId, contactNumber);
	}
	public ArrayList<String> getSubjects()
	{
		return dataAccessLayer.CourseDAO.getSubjects(courseName,branch,year);
	}

     public ArrayList<Student> getStudents()
     {
         return dataAccessLayer.PromoteDAO.getStudents(courseName, branch, year, section);	 
     }

	
     public  boolean promoteStudents(ArrayList<PromoteStudents> promoteStudentsArrayList)
     {
	  return dataAccessLayer.PromoteDAO.promoteStudents(courseName,branch, year, section,promoteStudentsArrayList);
     }
     
     public int getTotalstudentsGivenFeedback(String dateFeedBackTaken)
     {
    	return  dataAccessLayer.FeedBackDAO.getTotalstudentsGivenFeedback(courseName,branch,year,section,dateFeedBackTaken);
    	 
     }
    public FaculityFeedBackStatistics getSubjectStatistics(String subject,String dataFeedBackTaken)
    {
    	return  dataAccessLayer.FeedBackDAO.getFaculityFeedBackStatistics(subject, courseName, branch, year, section, dataFeedBackTaken) ;
    }
      
    public CollegeFeedBackStatistics getCollegeStatistics(String dateFeedBackTaken)
    {
    	return dataAccessLayer.FeedBackDAO.getCollegeFeedBackStatistics(courseName, branch, year, section, dateFeedBackTaken);
    } 
    public String getTodaysDate()
    {
    	return dataAccessLayer.FeedBackDAO.getTodaysDate();
    } 
    public ArrayList<String> getFeedBackDates() {
		return FeedBackDAO.getFeedBackDates(courseName, branch, year, section);
	}
 }
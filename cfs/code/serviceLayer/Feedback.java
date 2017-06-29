package serviceLayer;

import java.util.ArrayList;

public class Feedback {

	private String studentId;
	private ArrayList<FaculityFeedBack> faculityFeedBackArrayList=new ArrayList<FaculityFeedBack>();
	private CollegeFeedBack collegeFeedBack;
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public ArrayList<FaculityFeedBack> getFaculityFeedBackArrayList() {
		return faculityFeedBackArrayList;
	}
	public void setFaculityFeedBackArrayList(
			ArrayList<FaculityFeedBack> faculityFeedBackArrayList) {
		this.faculityFeedBackArrayList = faculityFeedBackArrayList;
	}
	public CollegeFeedBack getCollegeFeedBack() {
		return collegeFeedBack;
	}
	public void setCollegeFeedBack(CollegeFeedBack collegeFeedBack) {
		this.collegeFeedBack = collegeFeedBack;
	}
	
 }

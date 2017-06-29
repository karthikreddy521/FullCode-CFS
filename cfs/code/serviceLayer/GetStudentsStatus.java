package serviceLayer;



import java.util.ArrayList;

public class GetStudentsStatus {
	private static ArrayList<StudentStatus> students;

	public static void makeNew() {
		students=new ArrayList<StudentStatus>();
	}
	
public static ArrayList<StudentStatus> getStudents() {
		return students;
	}


	public static void setStudents(ArrayList<StudentStatus> students) {
		GetStudentsStatus.students = students;
	}



	public static boolean initilizeStudentIds()
	{
		boolean flag=false;
		SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
		String course=selectCourse.getCourseName();
		String branch=selectCourse.getBranch();
		int year=selectCourse.getYear();
		String section=selectCourse.getSection();
		flag=dataAccessLayer.FeedBackDAO.setStudentIds(course, branch, year, section, students);
		return flag;
	}
	

}

package serviceLayer;

public class StoreCourse {
	
	public static boolean addCourse()
	{
		
	boolean flag=false;	
	flag=dataAccessLayer.CourseDAO.addCourse(CourseFactory.getCourse());
	return flag;
	}
	

}

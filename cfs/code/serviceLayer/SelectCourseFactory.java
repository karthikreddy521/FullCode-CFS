package serviceLayer;

public class SelectCourseFactory {
	private static SelectCourse selectCourse;

	
	public static SelectCourse getSelectCourse() {
		return selectCourse;
	}


	public static void setSelectCourse(SelectCourse selectCourse) {
		SelectCourseFactory.selectCourse = selectCourse;
	}


	public static void makeNew()
	{
		selectCourse=new SelectCourse();
	}

}

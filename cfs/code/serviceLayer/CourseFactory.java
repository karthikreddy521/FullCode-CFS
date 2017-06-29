package serviceLayer;

public class CourseFactory {
	private static Course course = new Course();

	public static Course getCourse() {
		return course;
	}

	public static void makeNew() {

		course = new Course();

	}

}

package dataAccessLayer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import serviceLayer.PromoteStudents;
import serviceLayer.SelectCourse;
import serviceLayer.SelectCourseFactory;
import serviceLayer.Student;
import serviceLayer.StudentStatus;

public class PromoteDAO {

	public static ArrayList<Student> getStudents(String courseName,
			String branch, int year, String section) {
		ArrayList<Student> studentsArrayList = new ArrayList<Student>();
		Connection connection = DBUtil.getConnection();
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("SELECT sectionid FROM COURSES C,BRANCHES B,SECTIONS S WHERE C.COURSEID=B.COURSEID AND B.BRANCHID=S.BRANCHID AND C.COURSENAME='"
							+ courseName
							+ "' AND B.BRANCHNAME='"
							+ branch
							+ "' AND B.YEAR="
							+ year
							+ "AND S.SECTION='"
							+ section + "'");
			resultSet.next();
			double sectionid = resultSet.getDouble("sectionid");
			System.out.println("in promotedao  sectionid" + sectionid);
			resultSet = statement
					.executeQuery("SELECT * FROM students WHERE sectionid="
							+ sectionid);
			while (resultSet.next()) {
				Student student = new Student();
				String studentId = resultSet.getString("STUDENTID");
				String name = resultSet.getString("NAME");
				String password = resultSet.getString("PASSWORD");
				System.out.println("in promotedao id" + studentId);
				student.setRollNo(studentId);
				student.setName(name);
				student.setPassword(password);
				studentsArrayList.add(student);
			}

		} catch (Exception e) {
			System.out.println("Exception in promoteDao.getStudent" + e);
			e.printStackTrace();
		}
		return studentsArrayList;
	}

	public static boolean promoteStudents(String courseName, String branch,
			int year, String section,
			ArrayList<PromoteStudents> promoteStudentsArrayList) {
		Connection connection = DBUtil.getConnection();
		boolean flag = false;
		try {
			Statement statement = connection.createStatement();

			SelectCourse selectCourse = SelectCourseFactory.getSelectCourse();
			int finalYear = selectCourse.getCourseDuration();
			int noOfStudents = promoteStudentsArrayList.size();
			if (finalYear == year) {
				for (int i = 0; i < noOfStudents; i++) {
					PromoteStudents student = promoteStudentsArrayList.get(i);
					if (student.getPromote() == 1)
						statement
								.executeUpdate("DELETE FROM students WHERE studentid='"
										+ student.getStudentId() + "'");
				}
			} else {

				for (int i = 0; i < noOfStudents; i++) {
					PromoteStudents student = promoteStudentsArrayList.get(i);

					if (student.getPromote() == 1) {
						long sectionId = CourseDAO.getSectionId(courseName,
								branch, year + 1, section);
						if (sectionId != -1) {
							// same section exist in next year
							statement
									.executeUpdate("UPDATE  students SET sectionid='"
											+ sectionId
											+ "' WHERE studentid='"
											+ student.getStudentId() + "'");
						} else {
							long branchId = statement
									.executeUpdate(" SELECT branchid FROM branches WHERE branchname='"
											+ branch
											+ "'AND year='"
											+ (year + 1)
											+ "'AND courseid=(SELECT courseid FROM courses WHERE coursename='"
											+ courseName + "')");
							ResultSet secidResultSet = statement
									.executeQuery("select sectionIdsequence.nextVal from dual");
							secidResultSet.next();
							long secId = secidResultSet.getLong("NEXTVAL");
							statement.executeUpdate("INSERT INTO sections VALUES("+branchId+","+secId+",'"+section+"')");
							
						
							
							
						}
					}
				}
				
			}
			connection.commit();
			flag=true;
		} catch (Exception e) {
			System.out.println("Exception in PromoteDAO.promotestudents" + e);
			e.printStackTrace();
		}
		return flag;
	}
		
}

package dataAccessLayer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import serviceLayer.Branch;
import serviceLayer.Course;
import serviceLayer.Student;
import serviceLayer.Year;

public class CourseDAO {

	public static boolean addCourse(Course course) {
		boolean flag = false;
		Connection connection = null;
		try {
			connection = DBUtil.getConnection();

			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("select courseIdsequence.nextVal from dual");
			resultSet.next();
			double cid = resultSet.getDouble("NEXTVAL");
			String courseName = course.getName();
			int noOfBranches = course.getNoOfBranches();
			int duration = course.getDuration();
			statement
					.executeUpdate("INSERT INTO courses (courseid,courseName,duration,noOfBranches) VALUES("
							+ cid
							+ ",'"
							+ courseName
							+ "',"
							+ duration
							+ ","
							+ noOfBranches + ")");
			PreparedStatement branchesPreparedStatement = connection
					.prepareStatement("INSERT INTO branches(courseid,branchid,branchname,year)VALUES(?,?,?,?)");
			PreparedStatement sectionsPreparedStatement = connection
					.prepareStatement("INSERT INTO sections(branchid,sectionid,section)VALUES(?,?,?)");
			PreparedStatement subjectsPreparedStatement = connection
					.prepareStatement("INSERT INTO subjects(branchid,subject,subjectid)VALUES(?,?,?)");
			ArrayList<Branch> branches = course.getBranch();
			for (int i = 0; i < noOfBranches; i++) {
				branchesPreparedStatement.setDouble(1, cid);

				Branch branch = branches.get(i);
				branchesPreparedStatement.setString(3, branch.getBranchName());
				ArrayList<Year> years = branch.getYear();
				for (int j = 0; j < duration; j++) {
					ResultSet bidResultSet = statement
							.executeQuery("select branchIdsequence.nextVal from dual");
					bidResultSet.next();
					double bid = bidResultSet.getDouble("NEXTVAL");
					branchesPreparedStatement.setDouble(2, bid);
					sectionsPreparedStatement.setDouble(1, bid);
					subjectsPreparedStatement.setDouble(1, bid);
					Year year = years.get(j);
					branchesPreparedStatement.setInt(4, year.getYear());
					branchesPreparedStatement.executeUpdate();
					int noOfSubjects = year.getNoOfSubjects();
					ArrayList<String> subjects = year.getSubjects();
					for (int x = 0; x < noOfSubjects; x++) {
						ResultSet sidResultSet = statement
								.executeQuery("select subjectIdsequence.nextVal from dual");
						sidResultSet.next();
						double sid = sidResultSet.getDouble("NEXTVAL");
						subjectsPreparedStatement.setDouble(3, sid);
						subjectsPreparedStatement.setString(2, subjects.get(x));
						subjectsPreparedStatement.executeUpdate();
					}
					int s = year.getSections();
					for (int k = 1; k <= s; k++) {
						ResultSet secidResultSet = statement
								.executeQuery("select sectionIdsequence.nextVal from dual");
						secidResultSet.next();
						double secid = secidResultSet.getDouble("NEXTVAL");
						sectionsPreparedStatement.setDouble(2, secid);
						sectionsPreparedStatement.setString(3, others.Spell
								.spellIntToSection(k));
						sectionsPreparedStatement.executeUpdate();

					}

				}
				connection.commit();
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("EXCEPTION IN COURSEDAO\n\n" + e);
			try {
				connection.rollback();
			} catch (Exception ex) {
				System.out.println("Error while rolling back" + ex);
				ex.printStackTrace();
			}

			flag = false;

		}

		return flag;

	}

	public static ArrayList<String> getCourseNames() {
		ArrayList<String> courses = new ArrayList<String>();
		Connection connection = DBUtil.getConnection();
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("SELECT * FROM courses");

			while (resultSet.next()) {
				String course = resultSet.getString("coursename");
				courses.add(course);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return courses;
	}

	public static ArrayList<String> getBranchNames(String course) {
		ArrayList<String> branches = new ArrayList<String>();
		Connection connection = DBUtil.getConnection();
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("SELECT branchname FROM branches b,courses c WHERE b.courseid=c.courseid and c.coursename='"
							+ course + "' AND year=1");

			while (resultSet.next()) {
				String branch = resultSet.getString("branchname");
				branches.add(branch);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return branches;
	}

	public static int getCourseDuration(String course) {
		Connection connection = DBUtil.getConnection();
		int duration = 0;
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("SELECT duration FROM COURSES WHERE coursename='"
							+ course + "'");
			resultSet.next();
			duration = resultSet.getInt("duration");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return duration;
	}

	public static ArrayList<String> getSections(String course, String branch,
			int year) {
		Connection connection = DBUtil.getConnection();
		ArrayList<String> sections = new ArrayList<String>();
		System.out.println("in coursedao getSections course" + course
				+ "branch" + branch + "year" + year);
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("SELECT section FROM COURSES C,BRANCHES B,SECTIONS S WHERE C.COURSEID=B.COURSEID AND B.BRANCHID=S.BRANCHID AND C.COURSENAME='"
							+ course
							+ "' AND B.BRANCHNAME='"
							+ branch
							+ "' AND B.YEAR=" + year);
			while (resultSet.next()) {
				System.out.println("in coursedao getSections  section"
						+ resultSet.getString("section"));
				sections.add(resultSet.getString("section"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sections;

	}

	public static boolean addStudentDetailsToDB(String course, String branch,
			int year, String section, ArrayList<Student> students) {
		boolean flag = false;
		Connection connection = DBUtil.getConnection();
		try {
			long sectionId=getSectionId(course, branch, year, section);
			int lenght = students.size();
			PreparedStatement studentspreparedStatement = connection
					.prepareStatement("INSERT INTO students(sectionid,studentid,password,name) VALUES(?,?,?,?)");
			for (int i = 0; i < lenght; i++) {
				Student student = students.get(i);
				String sid = student.getRollNo();
				String pwd = student.getPassword();
				String name = student.getName();
				System.out.println("in courseDAO.addStudentDEtails--- ");
				System.out.println("Sid"+sid);
				System.out.println("pwd"+pwd);
				System.out.println("name"+name);
				studentspreparedStatement.setDouble(1, sectionId);
				studentspreparedStatement.setString(2, sid);
				studentspreparedStatement.setString(3, pwd);
				studentspreparedStatement.setString(4, name);
				studentspreparedStatement.executeUpdate();
			}

			connection.commit();
			flag = true;

		} catch (Exception e) {
			System.out.println("Exception in CourseDao.addStudentDetailsToDB"
					+ e);
			e.printStackTrace();

			try {
				connection.rollback();
			} catch (Exception ex) {
				System.out.println("Error while rolling back" + ex);// TODO:
				// handle
				// exception
				ex.printStackTrace();
			}

		}
		return flag;

	}
	public static boolean  addStudentRegistrationFormDetails(String course, String branch,
			int year, String section,String name,String rollNo,String password,String mailId,String contactNumber) {
		Connection connection = DBUtil.getConnection();
		boolean flag=false;
		try {
			long sectionId=getSectionId(course, branch, year, section);
			
			PreparedStatement studentspreparedStatement = connection
					.prepareStatement("INSERT INTO students(sectionid,studentid,password,name) VALUES(?,?,?,?)");
			
			
				studentspreparedStatement.setDouble(1, sectionId);
				studentspreparedStatement.setString(2, rollNo);
				studentspreparedStatement.setString(3, password);
				studentspreparedStatement.setString(4, name);
				studentspreparedStatement.executeUpdate();
				Statement statement = connection.createStatement();
				statement.executeUpdate("INSERT INTO studentDetails(studentid,contactNumber,mailid) VALUES('"+rollNo+"','"+contactNumber+"','"+mailId+"')");

			connection.commit();
			flag=false;
			

		} catch (Exception e) {
			System.out.println("Exception in CourseDao.addStudentregistration"
					+ e);
			e.printStackTrace();

			try {
				connection.rollback();
			} catch (Exception ex) {
				System.out.println("Error while rolling back" + ex);// TODO:
				// handle
				// exception
				ex.printStackTrace();
			}

		}
		return flag;
	}

	public static ArrayList<String> getSubjects(String course, String branch,
			int year) {
		Connection connection = DBUtil.getConnection();
		ArrayList<String> subjects = new ArrayList<String>();
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery(" SELECT subject FROM COURSES C,BRANCHES B,SUBJECTS S WHERE C.COURSEID=B.COURSEID AND B.BRANCHID=S.BRANCHID AND C.COURSENAME='"
							+ course
							+ "'AND B.BRANCHNAME='"
							+ branch
							+ "'AND B.YEAR=" + year);
			while (resultSet.next()) {
				System.out.println("subject-->"
						+ resultSet.getString("subject"));
				subjects.add(resultSet.getString("subject"));

			}
		}

		catch (Exception e) {
			System.out.println("Exception in CourseDao.getSubjects" + e);
			e.printStackTrace();

		}
		return subjects;
	}

	public static long getSectionId(String course, String branch, int year,
			String section) {
		Connection connection = DBUtil.getConnection();
		long sectionId=-1;
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("SELECT sectionid FROM COURSES C,BRANCHES B,SECTIONS S WHERE C.COURSEID=B.COURSEID AND B.BRANCHID=S.BRANCHID AND C.COURSENAME='"
							+ course
							+ "' AND B.BRANCHNAME='"
							+ branch
							+ "' AND B.YEAR="
							+ year
							+ "AND S.SECTION='"
							+ section + "'");
			if(resultSet.next())
			 sectionId = resultSet.getLong("sectionid");
			
			 
		}

		catch (Exception e) {
			System.out.println("Exception in CourseDao.getSectionId" + e);
			e.printStackTrace();

		}
		return sectionId;
	}
}
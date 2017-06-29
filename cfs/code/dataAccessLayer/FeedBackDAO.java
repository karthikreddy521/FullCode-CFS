package dataAccessLayer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import serviceLayer.CollegeFeedBack;
import serviceLayer.CollegeFeedBackStatistics;
import serviceLayer.FaculityFeedBack;
import serviceLayer.FaculityFeedBackStatistics;
import serviceLayer.FeatureStatistics;
import serviceLayer.Feedback;
import serviceLayer.StudentStatus;

public class FeedBackDAO {

	public static Connection connection = DBUtil.getConnection();

	public static boolean saveFeedBackToDB(Feedback feedback) {
		boolean flag = false;
		String studentID = feedback.getStudentId();
		ArrayList<FaculityFeedBack> faculityFeedBackArrayList = feedback
				.getFaculityFeedBackArrayList();
		int noOfSubjects = faculityFeedBackArrayList.size();

		String date;
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("SELECT to_char(sysdate,'dd-mon-yy')today FROM dual");
			resultSet.next();
			date = resultSet.getString("today");
			System.out.println("in feedbackdao date" + date);

			for (int i = 0; i < noOfSubjects; i++) {
				FaculityFeedBack faculityFeedBack = faculityFeedBackArrayList
						.get(i);
				String subject = faculityFeedBack.getSubject();
				ArrayList<Integer> featuresArrayList = faculityFeedBack
						.getFeatures();

				resultSet = statement
						.executeQuery("SELECT SubjectID FROM Subjects WHERE  Subject='"
								+ subject + "'");
				resultSet.next();
				long subjectID = resultSet.getInt("SUBJECTID");

				PreparedStatement faculityPreparedStatement = connection
						.prepareStatement("INSERT INTO FaculityFeedBack VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				faculityPreparedStatement.setString(1, studentID);
				faculityPreparedStatement.setLong(3, subjectID);
				faculityPreparedStatement.setString(2, date);
				for (int j = 0; j < 15; j++) {
					int feature = featuresArrayList.get(j);
					faculityPreparedStatement.setInt(j + 4, feature);
				}
				faculityPreparedStatement.executeUpdate();
			}
			CollegeFeedBack collegeFeedBack = feedback.getCollegeFeedBack();
			collegeFeedBack.getFeatures();
			ArrayList<Integer> featuresArrayList = collegeFeedBack
					.getFeatures();
			PreparedStatement collegePreparedStatement = connection
					.prepareStatement("INSERT INTO CollegeFeedBack VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
			collegePreparedStatement.setString(1, studentID);
			collegePreparedStatement.setString(2, date);
			for (int i = 0; i < 10; i++) {
				int f = featuresArrayList.get(i);
				collegePreparedStatement.setInt(i + 3, f);

			}
			collegePreparedStatement.executeUpdate();
			connection.commit();
			flag = true;
		} catch (Exception e) {
			System.out.println("EXEPTION IN FEEDBACKDAO.SaveFeedBackToDB" + e);
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (Exception ex) {
				System.out.println("Error while rolling back" + ex);
				ex.printStackTrace();
			}
		}

		return flag;

	}

	public static boolean setStudentIds(String course, String branch, int year,
			String section, ArrayList<StudentStatus> students) {
		boolean flag = false;

		try {
			System.out.println(" dataaccesslayer.setstudentids  course-->"
					+ course + "branch" + branch + "year" + year + "section "
					+ section);
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
			resultSet.next();
			double sectionid = resultSet.getDouble("sectionid");

			resultSet = statement
					.executeQuery("SELECT * FROM students WHERE sectionid='"
							+ sectionid + "'");
			while (resultSet.next()) {
				StudentStatus studentStatus = new StudentStatus();
				String studentId = resultSet.getString("STUDENTID");
				String name = resultSet.getString("NAME");
				studentStatus.setStudentId(studentId);
				studentStatus.setName(name);
				students.add(studentStatus);
			}
		} catch (Exception e) {
			System.out.println("Exception in FeedbackDao.setStudentIds" + e);
			e.printStackTrace();
		}
		return flag;
	}

	public static String getTodaysDate() {
		String date = null;
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("SELECT to_char(sysdate,'dd-mon-yy')today FROM dual");
			resultSet.next();
			date = resultSet.getString("today");

		} catch (Exception e) {
			System.out.println("In FeedBackEDao.getTodaysDate" + e);
			e.printStackTrace();
		}
		return date;

	}

	public static int getTotalstudentsGivenFeedback(String course,
			String branch, int year, String section, String DataFeedBackTaken) {
		System.out.println("IN FeedBackDAO.getTotalStudentsGivenFeedback");
		System.out.println("course "+course);
        System.out.println("branch "+branch);
        System.out.println("year "+year);
        System.out.println("section "+section);
        System.out.println("date"+DataFeedBackTaken);
		int count = -1;
		long sectionid = CourseDAO.getSectionId(course, branch, year, section);
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("SELECT COUNT(*) NoOFStudents FROM collegefeedback WHERE dateTaken='"
							+ DataFeedBackTaken
							+ "'AND studentid IN(SELECT studentid FROM students WHERE sectionid="
							+ sectionid + ")");
			if (resultSet.next()) {
				count = resultSet.getInt("NoOFStudents");
			} else {
				System.out
						.println("ERROR IN FEEDBACKDAO.getTotalstudentsGivenFeedback--- NO ROWS RETURNED ");
			}
		} catch (Exception e) {
			System.out
					.println("EXCEPTION IN FEEDBACKDAO.getTotalstudentsGivenFeedback()"
							+ e);
			e.printStackTrace();
		}
		return count;

		

	}

	public static FaculityFeedBackStatistics getFaculityFeedBackStatistics(
			String subject, String course, String branch, int year,
			String section, String dataFeedBackTaken) {

		FaculityFeedBackStatistics faculityFeedBackStatistics = new FaculityFeedBackStatistics();
		for(int i=0;i<16;i++)
		{
			FeatureStatistics featureStatistics=new FeatureStatistics();
			faculityFeedBackStatistics.getFeatureStatisticsArrayList().add(featureStatistics);
		}	
		long sectionId = CourseDAO.getSectionId(course, branch, year, section);
		try {
			Statement statement = connection.createStatement();

			ResultSet resultSet = statement
					.executeQuery("SELECT * from faculityfeedback WHERE subjectid=(SELECT subjectid FROM subjects WHERE branchid=(SELECT branchid FROM branches WHERE courseid=(SELECT courseid FROM courses WHERE courseName='"
							+ course
							+ "') AND branchname='"
							+ branch
							+ "' AND year="
							+ year
							+ ") AND subject='"
							+ subject
							+ "' AND datetaken='"
							+ dataFeedBackTaken
							+ "'AND studentid IN(SELECT  studentid FROM students WHERE sectionid="
							+ sectionId + "))");
			int i = 0;
			/*
			 * Feature 1 is Stored in ArraList With index 1 Feature 15 is Stored
			 * in ArraList With index 15
			 */
			while (resultSet.next()) {
				i = 0;
				int f1 = resultSet.getInt("feature1");
				i++;
				incrementFaculityStatisticsFeatureCount(f1, i,
						faculityFeedBackStatistics);
				int f2 = resultSet.getInt("feature2");
				i++;
				incrementFaculityStatisticsFeatureCount(f2, i,
						faculityFeedBackStatistics);
				int f3 = resultSet.getInt("feature3");
				i++;
				incrementFaculityStatisticsFeatureCount(f3, i,
						faculityFeedBackStatistics);
				int f4 = resultSet.getInt("feature4");
				i++;
				incrementFaculityStatisticsFeatureCount(f4, i,
						faculityFeedBackStatistics);
				int f5 = resultSet.getInt("feature5");
				i++;
				incrementFaculityStatisticsFeatureCount(f5, i,
						faculityFeedBackStatistics);
				int f6 = resultSet.getInt("feature6");
				i++;
				incrementFaculityStatisticsFeatureCount(f6, i,
						faculityFeedBackStatistics);
				int f7 = resultSet.getInt("feature7");
				i++;
				incrementFaculityStatisticsFeatureCount(f7, i,
						faculityFeedBackStatistics);
				int f8 = resultSet.getInt("feature8");
				i++;
				incrementFaculityStatisticsFeatureCount(f8, i,
						faculityFeedBackStatistics);
				int f9 = resultSet.getInt("feature9");
				i++;
				incrementFaculityStatisticsFeatureCount(f9, i,
						faculityFeedBackStatistics);
				int f10 = resultSet.getInt("feature10");
				i++;
				incrementFaculityStatisticsFeatureCount(f10, i,
						faculityFeedBackStatistics);
				int f11 = resultSet.getInt("feature11");
				i++;
				incrementFaculityStatisticsFeatureCount(f11, i,
						faculityFeedBackStatistics);
				int f12 = resultSet.getInt("feature12");
				i++;
				incrementFaculityStatisticsFeatureCount(f12, i,
						faculityFeedBackStatistics);
				int f13 = resultSet.getInt("feature13");
				i++;
				incrementFaculityStatisticsFeatureCount(f13, i,
						faculityFeedBackStatistics);
				int f14 = resultSet.getInt("feature14");
				i++;
				incrementFaculityStatisticsFeatureCount(f14, i,
						faculityFeedBackStatistics);
				int f15 = resultSet.getInt("feature15");
				i++;
				incrementFaculityStatisticsFeatureCount(f15, i,
						faculityFeedBackStatistics);
			}
		} catch (Exception e) {
			System.out
					.println("EXCEPTION IN FeedBackDAO.getFaculityFeedBackStatistics"
							+ e);
			e.printStackTrace();
		}

		return faculityFeedBackStatistics;
	}

	static void incrementFaculityStatisticsFeatureCount(int feature, int i,
			FaculityFeedBackStatistics faculityFeedBackStatistics) {
		if (feature == 1) {
			faculityFeedBackStatistics.getFeatureStatisticsArrayList().get(i).averageCount++;
		}
		if (feature == 2) {
			faculityFeedBackStatistics.getFeatureStatisticsArrayList().get(i).goodCount++;
		}
		if (feature == 3) {
			faculityFeedBackStatistics.getFeatureStatisticsArrayList().get(i).veryGoodCount++;
		}
		if (feature == 4) {
			faculityFeedBackStatistics.getFeatureStatisticsArrayList().get(i).excellentCount++;
		}
	}

	public static void incrementCollegeStatisticsFeatureCount(int feature, int i,
			CollegeFeedBackStatistics collegeFeedBackStatistics) {
		if (feature == 1) {
			collegeFeedBackStatistics.getCollegeFeedBackArrayList().get(i).averageCount++;
		}
		if (feature == 2) {
			collegeFeedBackStatistics.getCollegeFeedBackArrayList().get(i).goodCount++;
		}
		if (feature == 3) {
			collegeFeedBackStatistics.getCollegeFeedBackArrayList().get(i).veryGoodCount++;
		}
		if (feature == 4) {
			collegeFeedBackStatistics.getCollegeFeedBackArrayList().get(i).excellentCount++;
		}
		
		/*System.out.println("in Feedback dao.increment College staticsstics");
       System.out.println("avg"+collegeFeedBackStatistics.getCollegeFeedBackArrayList().get(i).averageCount);		
       System.out.println("goodcount"+collegeFeedBackStatistics.getCollegeFeedBackArrayList().get(i).goodCount);
       System.out.println("verygoodcount"+collegeFeedBackStatistics.getCollegeFeedBackArrayList().get(i).veryGoodCount);
       System.out.println("excell"+collegeFeedBackStatistics.getCollegeFeedBackArrayList().get(i).excellentCount);*/
	}

	public static CollegeFeedBackStatistics getCollegeFeedBackStatistics(
			String course, String branch, int year, String section,
			String dateFeedBackTaken) {
		CollegeFeedBackStatistics collegeFeedBackStatistics = new CollegeFeedBackStatistics();
		for(int i=0;i<11;i++)
		{
			FeatureStatistics featureStatistics=new FeatureStatistics();
			collegeFeedBackStatistics.getCollegeFeedBackArrayList().add(featureStatistics);
		}
		try {
			Statement statement = connection.createStatement();
			long sectionId = CourseDAO.getSectionId(course, branch, year,
					section);
			ResultSet resultSet = statement
					.executeQuery("SELECT * FROM collegefeedback WHERE dateTaken='"
							+ dateFeedBackTaken
							+ "'AND studentid IN(SELECT  studentid FROM students WHERE sectionid="
							+ sectionId + ")");
			
				int i = 0;
				/*
				 * Feature 1 is Stored in ArraList With index 1 Feature 15 is
				 * Stored in ArraList With index 15
				 */
				while (resultSet.next()) {
					i = 0;
					int f1 = resultSet.getInt("feature1");
					i++;
					incrementCollegeStatisticsFeatureCount(f1, i,
							collegeFeedBackStatistics);
					int f2 = resultSet.getInt("feature2");
					i++;
					incrementCollegeStatisticsFeatureCount(f2, i,
							collegeFeedBackStatistics);
					int f3 = resultSet.getInt("feature3");
					i++;
					incrementCollegeStatisticsFeatureCount(f3, i,
							collegeFeedBackStatistics);
					int f4 = resultSet.getInt("feature4");
					i++;
					incrementCollegeStatisticsFeatureCount(f4, i,
							collegeFeedBackStatistics);
					int f5 = resultSet.getInt("feature5");
					i++;
					incrementCollegeStatisticsFeatureCount(f5, i,
							collegeFeedBackStatistics);
					int f6 = resultSet.getInt("feature6");
					i++;
					incrementCollegeStatisticsFeatureCount(f6, i,
							collegeFeedBackStatistics);
					int f7 = resultSet.getInt("feature7");
					i++;
					incrementCollegeStatisticsFeatureCount(f7, i,
							collegeFeedBackStatistics);
					int f8 = resultSet.getInt("feature8");
					i++;
					incrementCollegeStatisticsFeatureCount(f8, i,
							collegeFeedBackStatistics);
					int f9 = resultSet.getInt("feature9");
					i++;
					incrementCollegeStatisticsFeatureCount(f9, i,
							collegeFeedBackStatistics);
					int f10 = resultSet.getInt("feature10");
					i++;
					incrementCollegeStatisticsFeatureCount(f10, i,
							collegeFeedBackStatistics);
				}
			
		} catch (Exception e) {
			System.out
					.println("EXCEPTION IN FeedBackDAO.getCollegeFeedBackStatistics"
							+ e);
			e.printStackTrace();
		}

		return collegeFeedBackStatistics;
	}
	
	public static ArrayList<String> getFeedBackDates(String course,String branch,int year,String section )
	{
		ArrayList<String> dates=new ArrayList<String>();
		Connection connection=DBUtil.getConnection();
		long sectionId=CourseDAO.getSectionId(course, branch, year, section); 
		try {
			Statement statement=connection.createStatement();
			
			ResultSet resultSet=statement.executeQuery("SELECT DISTINCT to_char(dateTaken,'dd-mon-yy') dateTaken FROM	collegeFeedBack	WHERE 	studentid IN(SELECT studentid FROM students WHERE sectionid="+sectionId+")");
			while (resultSet.next()) {
				String date=resultSet.getString("DATETAKEN");
				dates.add(date);
				
			}
		} catch (Exception e) {
			System.out.println("Exception in promoteDao.getFeedBackDates" + e);
			e.printStackTrace();
		}
		
		
		return dates;
	}
	

}

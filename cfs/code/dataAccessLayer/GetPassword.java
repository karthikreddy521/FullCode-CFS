package dataAccessLayer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetPassword {

	public static String getAdminPassword(String userId) {
		String password = null;
		Connection connection = DBUtil.getConnection();
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("SELECT password FROM ADMIN WHERE userid='"
							+ userId+"'");
			if (resultSet.next()) {
				password = resultSet.getString("PASSWORD");
			}

			return password;

		} catch (Exception e) {
			System.out
					.println("ERROR in dataAccesslayer.GetPassword.getAdminPassword\n"
							+ e);
			return null;
		}

	}

	public static String getStudentPassword(String userId,String course,String branch,int year,String section)
	{
		String password=null;
		Connection connection=DBUtil.getConnection();
		try {
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery("SELECT password FROM courses c,branches b,sections se,students st WHERE c.courseid=b.courseid AND b.branchid=se.branchid AND se.sectionid=st.sectionid AND c.coursename='"+course+"' AND b.branchname='"+branch+"' AND b.year="+year+" AND se.section='"+section+"' AND st.studentid='"+userId+"'");
			if(resultSet.next())
			{
				password=resultSet.getString("PASSWORD");
			}
			
			return password;
			
			
		} catch (Exception e) {
			System.out.println("ERROR  in dataAccesslayer.GetPassword.getStudentpassword\n"+e);
			return null;
		}
		
		
		
		
	}
	public static boolean updatePassword(String userid,String newPassword) {
		boolean flag=false;
		Connection connection=DBUtil.getConnection();
		try {
			Statement statement=connection.createStatement();
			statement.executeUpdate("UPDATE  students SET password='"+newPassword+"' WHERE studentid='"+userid+"'");
			flag=true;
		} catch (Exception e) {
			System.out.println("Exception in GetPassword.updatePassword"+e);
			e.printStackTrace();
			
		}
		
		
		return flag;
	}
}

package serviceLayer;

import java.util.ArrayList;


public class Login
{
	static ArrayList<String> studentIds=new ArrayList<String>();
	public static int verify(String userId,String password)
	{
		/*return 0 for invalid user
		  return 1 for Admin
		  return 2 for student
		  return 3 for AlreadyLoggedIn
		  return 4  No feed back taking palce
		*/

			
		String pwd=null;
		
		pwd=dataAccessLayer.GetPassword.getAdminPassword(userId);
		if(password.equals(pwd))
		{
			System.out.println("in service layer.login admin block");
			return 1;
		}
		SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
		if(!others.Variables.isFeedBackInProgress())
		{
			
		return 4;	
		}
			
        int length=studentIds.size();
    
		for(int i=0;i<length;i++)
		{
			if(studentIds.get(i).equals(userId))
			{
				
				return 3;
			}
		}
		
		
			String course=selectCourse.getCourseName();
			String branch=selectCourse.getBranch();
			String section=selectCourse.getSection();
			int year=selectCourse.getYear();
			
			pwd=dataAccessLayer.GetPassword.getStudentPassword(userId,course,branch,year,section);
		
		  if(pwd.equals(password))
		  {
			  studentIds.add(userId);
			  ArrayList<StudentStatus> status=GetStudentsStatus.getStudents();
			  int statusLength=status.size();
			  for(int i=0;i<statusLength;i++)
			  {
				  StudentStatus studentStatus=new StudentStatus();
				  studentStatus=status.get(i);
				  String id=studentStatus.getStudentId();
				  if(id.equals(userId))
				  {
					  studentStatus.setStatus(1);
				  }
			  }
			  
			  return 2;
		  }
		       
		return 0;

	}

}
package serviceLayer;

import dataAccessLayer.GetPassword;

public class Password {
	public static boolean changePassword(String userid,String newPassword) {
		boolean flag=false;
		
		flag=GetPassword.updatePassword(userid, newPassword);
		return flag;
	}

}

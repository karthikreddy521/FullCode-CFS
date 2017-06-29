package serviceLayer;



public class RegistrationStudentDetails {
	String name;
	String rollNumber;
	String password;
	String mailId;
	String contactNumber;
	String storeStudentDetails;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRollNumber() {
		return rollNumber;
	}
	public void setRollNumber(String rollNumber) {
		this.rollNumber = rollNumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMailId() {
		return mailId;
	}
	public void setMailId(String mailId) {
		this.mailId = mailId;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public void setStoreStudentDetails(String dummy)
	{
		System.out.println(name+rollNumber+password+mailId);
		SelectCourse selectCourse=SelectCourseFactory.getSelectCourse();
		selectCourse.storeRegistrationStudentDetails(name,rollNumber, password, mailId, contactNumber);
		
	}

}

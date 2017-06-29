package serviceLayer;

import java.util.ArrayList;

public class FaculityFeedBack {
String subject;
ArrayList<Integer> features=new ArrayList<Integer>();
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public ArrayList<Integer> getFeatures() {
	return features;
}
public void setFeatures(ArrayList<Integer> features) {
	this.features = features;
}
}

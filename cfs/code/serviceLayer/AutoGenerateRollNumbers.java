package serviceLayer;
import java.util.ArrayList;

public class AutoGenerateRollNumbers {
public static ArrayList<String> getRollNumbers(String commonRollNo,String starting,String ending)
{
ArrayList<String> rollNumbers =new ArrayList<String>();
int length=starting.length();




do
{
	String rollno=commonRollNo+starting;
	rollNumbers.add(rollno);
	String temp=starting;
	
	if(starting.charAt(length)=='9')
	{     
		int l=starting.length()-1;
		for (int i = 0; i <l ; i++) {
			temp=temp+starting.charAt(i);
		}
		
	}
	
}
while(!starting.equalsIgnoreCase(ending));



return rollNumbers;
}


}

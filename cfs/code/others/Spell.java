package others;


public class Spell {

	public static String spellIntToSection(int value)
	{
		if(value==1)
			return "A";
		else if(value==2)
			return "B";
		else if(value==3)
			return "C";
		else if(value==4)
			return "D";
		else if(value==5)
			return "F";
		else
		return "UNKNOWN";
	}
	
	public static String spellIntToTHForm(int value)
	{
		if(value==1)
			return "1 ST";
		else if(value==2)
			return "2 ND";
		else if(value==3)
			return "3 RD";
		else if(value==4)
			return "4 TH";
		else if(value==5)
			return "5 TH";
		else if(value==6)
			return "6 TH";
		else if(value==7)
			return "7 TH";
		else if(value==8)
			return "8 TH";
		else if(value==9)
			return "9 TH";
		else
			return "UNKNOWN";

		
		
	}
	
}

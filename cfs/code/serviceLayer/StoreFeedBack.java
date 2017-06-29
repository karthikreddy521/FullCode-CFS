package serviceLayer;

public class StoreFeedBack {

	public static boolean saveFeedBack(Feedback feedback)
	{
		return  dataAccessLayer.FeedBackDAO.saveFeedBackToDB(feedback);
	}
	
	
	
}

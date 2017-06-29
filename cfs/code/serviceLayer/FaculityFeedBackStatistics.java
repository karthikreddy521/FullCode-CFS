package serviceLayer;

import java.util.ArrayList;

public class FaculityFeedBackStatistics {
 
	
	
	
	ArrayList<FeatureStatistics> featureStatisticsArrayList=new ArrayList<FeatureStatistics>(16);

	public ArrayList<FeatureStatistics> getFeatureStatisticsArrayList() {
		return featureStatisticsArrayList;
	}

	public void setFeatureStatisticsArrayList(
			ArrayList<FeatureStatistics> featureStatisticsArrayList) {
		this.featureStatisticsArrayList = featureStatisticsArrayList;
	}
	
	
	
	
}

package serviceLayer;

import java.util.ArrayList;

public class CollegeFeedBackStatistics {

	ArrayList<FeatureStatistics> collegeFeedBackArrayList=new ArrayList<FeatureStatistics>(11);

	public ArrayList<FeatureStatistics> getCollegeFeedBackArrayList() {
		return collegeFeedBackArrayList;
	}

	public void setCollegeFeedBackArrayList(
			ArrayList<FeatureStatistics> collegeFeedBackArrayList) {
		this.collegeFeedBackArrayList = collegeFeedBackArrayList;
	}
	
}

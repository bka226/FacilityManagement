package responses;

import java.util.List;

import model.Feature;
import view.View;

import com.fasterxml.jackson.annotation.JsonView;

public class FeatureListResponseBody implements ResponseBody {
	@JsonView(View.Public.class)
	private List<Feature> features;

	public List<Feature> getFeatures() {
		return features;
	}

	public void setFeatures(List<Feature> features) {
		this.features = features;
	}
}

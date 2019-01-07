package prototype.services.outlook;

import java.io.UnsupportedEncodingException;

import org.apache.http.HttpEntity;
import org.apache.http.entity.StringEntity;

public class JsonHttpBodyComposer implements HttpBodyComposer {
	private String jsonString;
	
	public JsonHttpBodyComposer(String jsonString) {
		this.jsonString = jsonString;
	}
	
	@Override
	public HttpEntity compose() {
		HttpEntity entity = null;
		
		try {
			entity = new StringEntity(jsonString);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return entity;
	}
}

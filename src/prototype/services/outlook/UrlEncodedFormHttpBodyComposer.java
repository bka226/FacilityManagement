package prototype.services.outlook;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.message.BasicNameValuePair;

public class UrlEncodedFormHttpBodyComposer implements HttpBodyComposer {
	private Map<String, String> params;
	
	public UrlEncodedFormHttpBodyComposer(Map<String, String> params) {
		this.params = params;
	}

	@Override
	public HttpEntity compose() {
		HttpEntity entity = null;
		List<NameValuePair> paramsForEncoding = new ArrayList<NameValuePair>();
		
		for (Entry<String, String> param : params.entrySet()) {
			paramsForEncoding.add(new BasicNameValuePair(param.getKey(), param.getValue()));
		}
		
		try {
			entity = new UrlEncodedFormEntity(paramsForEncoding);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return entity;
	}

}

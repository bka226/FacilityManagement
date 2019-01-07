package prototype.services.outlook;

import java.io.IOException;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

public class URLRequester {
	public static HttpResponse makePostRequest(String url, Map<String, String> headers, HttpBodyComposer composer) {
		CloseableHttpClient client = HttpClients.createDefault();
		CloseableHttpResponse postResponse = null;
		HttpPost postRequest = new HttpPost(url);
		
		for (Entry<String, String> header : headers.entrySet()) {
			postRequest.addHeader(header.getKey(), header.getValue());
		}
		
		try {
			postRequest.setEntity(composer.compose());
			postResponse = client.execute(postRequest);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return postResponse;
	}
}

package prototype.services.outlook.testing;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.springframework.util.Assert;
import org.testng.annotations.Test;

import com.google.gson.Gson;

import prototype.services.outlook.JsonHttpBodyComposer;
import prototype.services.outlook.URLRequester;
import prototype.services.outlook.UrlEncodedFormHttpBodyComposer;
import prototype.services.outlook.model.EventRequest;
import prototype.services.outlook.model.MicrosoftAttendee;
import prototype.services.outlook.model.MicrosoftDateTimeTimeZone;
import prototype.services.outlook.model.MicrosoftEmailAddress;
import prototype.services.outlook.model.MicrosoftLocation;

public class URLRequesterTest {
	@Test
	public void testMakeRequest() {
		String url = "https://login.microsoftonline.com/common/oauth2/v2.0/token";
		
		Map<String, String> headers = new HashMap<String, String>();
		headers.put("Content-Type", "application/x-www-form-urlencoded");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("client_id", "a41c4471-32dc-4af2-a37a-7a2f66569603");
		params.put("scope", "https://graph.microsoft.com/User.Read");
		params.put("client_secret", "jfiPAY51198:rbhuZPQT$?:");
		params.put("grant_type", "client_credentials");
		
		HttpResponse response = URLRequester.makePostRequest(url, headers, new UrlEncodedFormHttpBodyComposer(params));
		Assert.notNull(response);
		
		System.out.println(response.getStatusLine());
		
		HttpEntity body = response.getEntity();
		
		StringBuffer bodyData = new StringBuffer();
		try {
			BufferedReader httpBodyReader = new BufferedReader(new InputStreamReader(body.getContent()));
			
			while (true) {
				String line = httpBodyReader.readLine();
				
				if (line == null) {
					break;
				}
				
				bodyData.append(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//System.out.println(bodyData.toString());
	}
	
	@Test
	public void testMakeTokenRequest() {
		String url = "https://login.microsoftonline.com/common/oauth2/v2.0/token";
		
		Map<String, String> headers = new HashMap<String, String>();
		headers.put("Content-Type", "application/x-www-form-urlencoded");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("client_id", "a41c4471-32dc-4af2-a37a-7a2f66569603");
		params.put("client_secret", "jfiPAY51198:rbhuZPQT$?:");
		params.put("code", "Me2a501e2-c067-b896-254b-92dba4954290");
		params.put("redirect_uri", "http://localhost:9880/FRM/permissions.html");
		params.put("grant_type", "authorization_code");
		
		HttpResponse response = URLRequester.makePostRequest(url, headers, new UrlEncodedFormHttpBodyComposer(params));
		
		System.out.println(response.getStatusLine());
		
		HttpEntity body = response.getEntity();
		
		StringBuffer bodyData = new StringBuffer();
		try {
			BufferedReader httpBodyReader = new BufferedReader(new InputStreamReader(body.getContent()));
			
			while (true) {
				String line = httpBodyReader.readLine();
				
				if (line == null) {
					break;
				}
				
				bodyData.append(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println(bodyData.toString());
	}
	
	@Test
	public void testCreateEventRequest() {
		String url = "https://graph.microsoft.com/v1.0/me/events";
		
		Map<String, String> headers = new HashMap<String, String>();
		headers.put("Content-Type", "application/json");
		headers.put("Authorization", "Bearer EwAwA8l6BAAURSN/FHlDW5xN74t6GzbtsBBeBUYAAWqlkpRWKIKK9Uwp9euTSTPA8WLEE/FLhyFuh9UsUPRODVBdQ8Ki8Uq66+QX6FKD/UF8ys9a//bMWVzTN3conailGSxgbm5GvyhOn9baDEt9n9jP8Wlw2QBaNRuMQR0EsTSSvSXP2ylOj/8jqzP+modsrWzx5BCMHdR0OGLG7gYyGGlsPmghaQAYUb2U/iHUCx2XfqhLkv+lr/z3Xa6NIyerdKq4LATbM67ilTEt5J7x0BDZj3UGXgDVqXsKFLznzq11m4zyX0ibqTkw0UkZbr0YVKCEwBLXqhJxqt4gNjrRaZJf74rQ7ZX2L69DBFiPGHs55kQs+718jmJFV5nN5AUDZgAACFdZTpNV5VWvAALNC9mWVY7HTgmsBh+8y/Pl2Lcn9HTnibuFjnhHZ55GK3F1Ev9n2gppBTtYgfaxgs9hIzVKHC8ReNAfid9F7IChrsL09A5O2w1ZXyYEk4oIqrk3z5um4SSo+7fTCXwOvp/0gP9nGhBBKpRIv8Rpj1KwWyukpvYWz4192lKwvcSoHAxZ8eSb+wv34Z93Gd819+aaNnc+hrFF1QeFW/NSJAXV8fTxJVbW6KDxyxYHEr3dZaCa0uULYEldQrPhbVN3Ss6GfNjaylvSUiLrqewKoCI0B3gckWigzzO88zZFCsY5xlfAHZa7CrXbJZRJkbk8AWc3WM6i6nQ7BuXdAnMsAS8VXbjYDVlPLZLF97G/EMbDkkqyfsnhhYUwio2aJt/oAdT8VP+9EV5oLCdq4Vz/DaKdyZjajvCx5c7sHnLomXcFehZFL1Lehf0M8niYTDtBUcVzuLnTGevvYgjupietBsvU6cmzPvhCr6TH/tB5MgsFA6Rqf6vxIIRPhPbofiip0iS3p8bDX7JVNKxS+NIxVHnznau7p7T611hRCxsvs6ExV8xEVJjcSgJrsUt6tef21tBuEGB8br2Y4457mfxOop+TPMo1nZC73s4wdDnv2EheToDNX9m9dtOvjFa9p4hHhpcxy/FaZlPj47q1txHcNkq7OHmrBGoejsqtxNT+yxI+KC4C");
		
		Gson gson = new Gson();
		
		EventRequest eventRequest = new EventRequest();
		
		MicrosoftDateTimeTimeZone startDateTimeTimeZone = new MicrosoftDateTimeTimeZone();
		startDateTimeTimeZone.setDateTime("2018-05-15T12:00:00");
		startDateTimeTimeZone.setTimeZone("America/Chicago");
		MicrosoftDateTimeTimeZone endDateTimeTimeZone = new MicrosoftDateTimeTimeZone();
		endDateTimeTimeZone.setDateTime("2018-05-15T13:00:00");
		endDateTimeTimeZone.setTimeZone("America/Chicago");
		
		MicrosoftLocation location = new MicrosoftLocation();
		location.setDisplayName("Board Room 1");
		
		MicrosoftAttendee attendee = new MicrosoftAttendee();
		MicrosoftEmailAddress emailAddress = new MicrosoftEmailAddress();
		emailAddress.setAddress("dolfannat7@hotmail.com");
		emailAddress.setName("Nathan Kline");
		attendee.setEmailAddress(emailAddress);
		attendee.setType("required");
		
		eventRequest.setSubject("Meeting");
		eventRequest.setStart(startDateTimeTimeZone);
		eventRequest.setEnd(endDateTimeTimeZone);
		eventRequest.setLocation(location);
		//eventRequest.addAttendee(attendee);
		
		String jsonString = gson.toJson(eventRequest);
		
		System.out.println(jsonString);
		
		HttpResponse response = URLRequester.makePostRequest(url, headers, new JsonHttpBodyComposer(jsonString));
		
		System.out.println(response.getStatusLine());
		
		HttpEntity body = response.getEntity();
		
		StringBuffer bodyData = new StringBuffer();
		try {
			BufferedReader httpBodyReader = new BufferedReader(new InputStreamReader(body.getContent()));
			
			while (true) {
				String line = httpBodyReader.readLine();
				
				if (line == null) {
					break;
				}
				
				bodyData.append(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println(bodyData.toString());
	}
}

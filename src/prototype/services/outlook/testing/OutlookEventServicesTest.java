package prototype.services.outlook.testing;

import org.testng.Assert;
import org.testng.annotations.Test;

import prototype.services.outlook.OutlookEventServices;

public class OutlookEventServicesTest {
	@Test
	public void testGetSetAppName() {
		OutlookEventServices eventServices = new OutlookEventServices();
		String appName = "appName";
		eventServices.setAppName(appName);
		Assert.assertEquals(eventServices.getAppName(), appName);
	}

	@Test
	public void testGetSetClientID() {
		OutlookEventServices eventServices = new OutlookEventServices();
		String clientId = "This is my client id";
		eventServices.setClientId(clientId);
		Assert.assertEquals(eventServices.getClientId(), clientId);
	}
	
	@Test
	public void testGetSetClientSecret() {
		OutlookEventServices eventServices = new OutlookEventServices();
		String clientSecret = "This is a client secret";
		eventServices.setClientSecret(clientSecret);
		Assert.assertEquals(eventServices.getClientSecret(), clientSecret);
	}
}

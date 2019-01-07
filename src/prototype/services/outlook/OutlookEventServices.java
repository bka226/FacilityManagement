package prototype.services.outlook;

public class OutlookEventServices implements EventServices {
	private String appName;
	private String clientId;
	private String clientSecret;

	@Override
	public String getAppName() {
		return appName;
	}

	@Override
	public void setAppName(String appName) {
		this.appName = appName;
	}
	
	@Override
	public String getClientId() {
		return clientId;
	}

	@Override
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	@Override
	public String getClientSecret() {
		return clientSecret;
	}

	@Override
	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}
	
}

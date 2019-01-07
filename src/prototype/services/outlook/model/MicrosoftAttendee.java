package prototype.services.outlook.model;

public class MicrosoftAttendee {
	private String type;
	private MicrosoftEmailAddress emailAddress;
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public MicrosoftEmailAddress getEmailAddress() {
		return emailAddress;
	}
	
	public void setEmailAddress(MicrosoftEmailAddress emailAddress) {
		this.emailAddress = emailAddress;
	}
}

package prototype.services.outlook.model;

import java.util.ArrayList;
import java.util.Collection;

public class EventRequest {
	private String subject;
	private MicrosoftDateTimeTimeZone start;
	private MicrosoftDateTimeTimeZone end;
	private MicrosoftLocation location;
	private Collection<MicrosoftAttendee> attendees = new ArrayList<MicrosoftAttendee>();

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public MicrosoftDateTimeTimeZone getStart() {
		return start;
	}

	public void setStart(MicrosoftDateTimeTimeZone start) {
		this.start = start;
	}

	public MicrosoftDateTimeTimeZone getEnd() {
		return end;
	}

	public void setEnd(MicrosoftDateTimeTimeZone end) {
		this.end = end;
	}

	public MicrosoftLocation getLocation() {
		return location;
	}

	public void setLocation(MicrosoftLocation location) {
		this.location = location;
	}
	
	public Collection<MicrosoftAttendee> getAttendees() {
		return attendees;
	}

	public void addAttendee(MicrosoftAttendee attendee) {
		attendees.add(attendee);
	}
}

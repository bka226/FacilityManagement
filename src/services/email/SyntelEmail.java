package services.email;

import projectInterface.Context;

public interface SyntelEmail extends Context {
	SynbookEmailSender SYNBOOKEMAILSENDER = (SynbookEmailSender)CONTEXT.getBean("synbookEmailSender");
}

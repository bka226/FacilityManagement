package services.email.testing;

import java.util.ArrayList;
import java.util.List;

import org.testng.Assert;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import services.email.SyntelEmailSender;

public class SyntelEmailSenderTest {
	private String fromEmail = "nathan_kline@syntelinc.com";
	private SyntelEmailSender sender = new SyntelEmailSender();
	
	@BeforeClass
	public void initTestClass() {
		sender.setFrom(fromEmail);
	}
	
	@Test
	public void testFrom() {
		Assert.assertEquals(sender.getFrom(), fromEmail);
	}
	
	@Test
	public void testSendEmailToMultipleRecipients() {
		List<String> recipients = new ArrayList<String>();
		recipients.add(fromEmail);
		Assert.assertTrue(sender.sendEmail(recipients, "Subject", "Hello World"));
	}
}

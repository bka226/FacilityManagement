package prototype.services.outlook.testing;

import java.util.HashMap;
import java.util.Map;

import org.testng.Assert;
import org.testng.annotations.Test;

import prototype.services.outlook.UrlEncodedFormHttpBodyComposer;

public class UrlEncodedFormHttpBodyComposerTest {
	@Test
	public void testCompose() {
		Map<String, String> params = new HashMap<String, String>();
		params.put("param", "some string");
		
		UrlEncodedFormHttpBodyComposer composer = new UrlEncodedFormHttpBodyComposer(params);
		Assert.assertNotNull(composer.compose());
	}
}

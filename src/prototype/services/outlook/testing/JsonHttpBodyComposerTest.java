package prototype.services.outlook.testing;

import org.testng.Assert;
import org.testng.annotations.Test;

import prototype.services.outlook.JsonHttpBodyComposer;

public class JsonHttpBodyComposerTest {
	@Test
	public void testCompose() {
		JsonHttpBodyComposer composer = new JsonHttpBodyComposer("{\"subject\": \"Hello\"}");
		Assert.assertNotNull(composer.compose());
	}
}

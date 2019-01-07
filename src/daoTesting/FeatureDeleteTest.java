package daoTesting;

import static org.testng.Assert.assertFalse;

import org.testng.annotations.Test;

import dao.FeatureDAO;

public class FeatureDeleteTest {
  @Test
  public void deleteNotInTable() {
	  FeatureDAO fd = new FeatureDAO();
	  assertFalse(fd.delete(500));
  }
}

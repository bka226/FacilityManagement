package dao.testing;

import org.testng.annotations.Test;

import dao.FeatureDAO;
import model.Feature;

import static org.testng.Assert.assertNotNull;
import static org.testng.Assert.assertTrue;

import org.testng.annotations.BeforeClass;

public class FeatureDAOTest {
	FeatureDAO fd;
	Feature f;
  @BeforeClass
  public void beforeClass() {
	  fd = new FeatureDAO();
  }


  @Test(dependsOnMethods = {"update"})
  public void delete() {
    assertTrue(fd.delete(f.getId()));
  }

  @Test(dependsOnMethods = {"select"})
  public void insert() {
    assertTrue(fd.insert(f));
  }

  @Test
  public void select() {
    assertNotNull(f = fd.select(1));
  }

  @Test(dependsOnMethods = {"insert"})
  public void update() {
    f.setImageFilePath("TEST INFO");
    assertTrue(fd.update(f));
  }
}

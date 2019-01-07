package dao.testing;

import org.testng.annotations.Test;

import dao.DestinationDAO;
import model.Destination;

import static org.testng.Assert.assertNotNull;
import static org.testng.Assert.assertTrue;

import org.testng.annotations.BeforeClass;

public class DestinationDAOTest {
	DestinationDAO dd;
	Destination d;
  @BeforeClass
  public void beforeClass() {
	  dd = new DestinationDAO();
  }


  @Test(dependsOnMethods = {"update"})
  public void delete() {
    assertTrue(dd.delete(d.getId()));
  }

  @Test(dependsOnMethods = {"select"})
  public void insert() {
    assertTrue(dd.insert(d));
  }

  @Test
  public void select() {
    assertNotNull(d = dd.select(1));
  }

  @Test(dependsOnMethods = {"insert"})
  public void update() {
	  d.setCity("TEST INFO");
    assertTrue(dd.update(d));
  }
}

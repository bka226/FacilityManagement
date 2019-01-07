package dao.testing;

import org.testng.annotations.Test;

import dao.RoomTypeDAO;
import model.RoomType;

import static org.testng.Assert.assertNotNull;
import static org.testng.Assert.assertTrue;

import org.testng.annotations.BeforeClass;

public class RoomTypeDAOTest {
	RoomTypeDAO rtd;
	RoomType rt;
  @BeforeClass
  public void beforeClass() {
	  rtd = new RoomTypeDAO();
  }


  @Test(dependsOnMethods = {"update"})
  public void delete() {
    assertTrue(rtd.delete(rt.getId()));
  }

  @Test(dependsOnMethods = {"select"})
  public void insert() {
	  rt = new RoomType();
	  rt.setRtype("HELLO");
	  rt.setImageFilePath("MANGO");
    assertTrue(rtd.insert(rt));
  }

  @Test
  public void select() {
    assertNotNull(rt = rtd.select(1));
  }

  @Test(dependsOnMethods = {"insert"})
  public void update() {
    rt.setImageFilePath("TEST INFO");
    assertTrue(rtd.update(rt));
  }
}

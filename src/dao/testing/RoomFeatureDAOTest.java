package dao.testing;

import org.testng.annotations.Test;

import dao.FeatureDAO;
import dao.RoomFeatureDAO;
import model.RoomFeature;

import static org.testng.Assert.assertNotNull;
import static org.testng.Assert.assertTrue;

import org.testng.annotations.BeforeClass;

public class RoomFeatureDAOTest {
	RoomFeatureDAO rfd;
	RoomFeature rf;
	RoomFeature rfi;
  @BeforeClass
  public void beforeClass() {
	  rfd = new RoomFeatureDAO();
  }


  @Test(dependsOnMethods = {"update"})
  public void delete() {
    assertTrue(rfd.delete(0, rf.getFeature().getId()));
  }

  @Test
  public void featuresInRoom() {
    assertNotNull(rfd.featuresInRoom(1));
  }

  @Test(dependsOnMethods = {"select"})
  public void insert() {
	  rf.setId(2);
	  rf.setFeature(new FeatureDAO().select(2));
    assertTrue(rfd.insert(rf));
  }

  @Test
  public void select() {
    assertNotNull(rf = rfd.select(1, 1));
  }

  @Test(dependsOnMethods = {"insert"})
  public void update() {
	  rf.setQuantity(900);
    assertTrue(rfd.update(rf));
  }
  
  @Test(dependsOnMethods = {"delete"})
  public void selectById() {
	  assertNotNull(rf = rfd.select(1));
  }
  
  @Test(dependsOnMethods = {"selectById"})
  public void deleteByID() {
	  rf.setId(2);
	  rf.setFeature(new FeatureDAO().select(2));
	  assertTrue(rfd.insert(rf));
	  assertTrue(rfd.delete(rf.getId()));
  }
}

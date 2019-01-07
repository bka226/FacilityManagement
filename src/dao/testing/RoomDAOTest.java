package dao.testing;

import org.testng.annotations.Test;

import dao.RoomDAO;
import model.Room;

import static org.testng.Assert.assertNotNull;
import static org.testng.Assert.assertTrue;

import org.testng.annotations.BeforeClass;

public class RoomDAOTest {
	RoomDAO rd;
	Room r;
  @BeforeClass
  public void beforeClass() {
	  rd = new RoomDAO();
  }


  @Test(dependsOnMethods = {"update"})
  public void delete() {
    assertTrue(rd.delete(r.getId()));
  }

  @Test(dependsOnMethods = {"select"})
  public void insert() {
    assertTrue(rd.insert(r));
  }

  @Test
  public void roomsAtDestination() {
    assertNotNull(rd.roomsAtDestination(1));
  }
  
  @Test
  public void roomsOfRoomTypeAtDestination() {
	  assertNotNull(rd.roomsWithRoomTypeAtDestination(0, 0));
  }

  @Test
  public void select() {
    assertNotNull(r = rd.select(1));
  }

  @Test(dependsOnMethods = {"insert"})
  public void update() {
	  r.setName("TEST INFO");
    assertTrue(rd.update(r));
  }
}

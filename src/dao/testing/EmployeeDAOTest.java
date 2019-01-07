package dao.testing;

import org.testng.annotations.Test;

import dao.EmployeeDAO;
import model.Employee;

import static org.testng.Assert.assertNotNull;
import static org.testng.Assert.assertTrue;

import org.testng.annotations.BeforeClass;

public class EmployeeDAOTest {
	EmployeeDAO ed;
	Employee e;
  @BeforeClass
  public void beforeClass() {
	  ed = new EmployeeDAO();
  }


  @Test(dependsOnMethods = {"update"})
  public void delete() {
    assertTrue(ed.delete(e.getId()));
  }

  @Test(dependsOnMethods = {"select"})
  public void insert() {
	  e.setId(-1);
	  e.setEmail("TEST INFO");
	  e.setPhone("TEST INFO");
    assertTrue(ed.insert(e));
  }

  @Test
  public void select() {
    assertNotNull(e = ed.select(1));
  }

  @Test(dependsOnMethods = {"insert"})
  public void update() {
	  e.setName("TEST INFO");
    assertTrue(ed.update(e));
  }
  
  @Test
  public void getEmployeeWithEmail() {
	  assertNotNull(ed.getEmployeeByEmail("not set"));
  }
}

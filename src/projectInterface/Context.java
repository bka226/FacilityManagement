package projectInterface;

import java.util.HashMap;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.Destination;
import model.Feature;
import model.Room;
import model.RoomType;

//only declare application context in one place and share it with the entire project
public interface Context {
	ApplicationContext CONTEXT = new ClassPathXmlApplicationContext("spring-config.xml");

	HashMap<Integer, RoomType> ROOMTYPES = new HashMap<>();
	HashMap<Integer, Feature> FEATURETYPES = new HashMap<>();
	HashMap<Integer, Destination> LOCATIONS = new HashMap<>();
	HashMap<Integer, Room> ROOMS = new HashMap<>();

}

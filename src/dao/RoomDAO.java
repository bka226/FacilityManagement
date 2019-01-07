package dao;

import java.util.List;

import mapper.RoomMapper;
import model.Feature;
import model.Room;
import model.RoomFeature;

public class RoomDAO implements DAO<Room> {

	@Override
	public boolean insert(Room newItem) {
		int id = JTEMP.queryForObject("SELECT roomIdSeq.nextVal FROM DUAL", Integer.class);
		System.out.println(id);
		newItem.setId(id);
		boolean insert = (JTEMP.update("INSERT INTO room VALUES(?, ?, ?, ?, ?, ?)", newItem.getId(),
				newItem.getRoomType().getId(), newItem.getLocation().getId(), newItem.isSuperRoom() ? 1 : 0,
				newItem.getCapacity(), newItem.getName()) > 0);
		if(insert) {
			RoomFeatureDAO rfDao = new RoomFeatureDAO();
			FeatureDAO fDao = new FeatureDAO();
			try {
				for(Feature feature : fDao.showFeature()) {
					RoomFeature rf = new RoomFeature();
					rf.setFeature(feature);
					rf.setQuantity(0);
					rfDao.insert(rf, newItem.getId());
				}
			} catch(Exception e) { }
		}
		return insert;
	}
	public boolean liteInsert(Room newItem) {
		int id = JTEMP.queryForObject("SELECT roomIdSeq.nextVal FROM DUAL", Integer.class);
		newItem.setId(id);
		boolean insert = (JTEMP.update("INSERT INTO room VALUES(?, ?, ?, ?, ?, ?)", newItem.getId(),
				0, 0, newItem.isSuperRoom() ? 1 : 0,
				newItem.getCapacity(), newItem.getName()) > 0);
		if(insert) {
			RoomFeatureDAO rfDao = new RoomFeatureDAO();
			FeatureDAO fDao = new FeatureDAO();
			try {
				for(Feature feature : fDao.showFeature()) {
					RoomFeature rf = new RoomFeature();
					rf.setFeature(feature);
					rf.setQuantity(0);
					rfDao.insert(rf, newItem.getId());
				}
			} catch(Exception e) { }
		}
		return insert;
	}
	@Override
	public boolean update(Room changedItem) {
		boolean update =  (JTEMP.update("UPDATE room SET roomType = ?, destination = ?, isSuperRoom = ?, capacity = ?, name = ? WHERE id = ?",
				changedItem.getRoomType().getId(), changedItem.getLocation().getId(), changedItem.isSuperRoom() ? 1 : 0,
				changedItem.getCapacity(), changedItem.getName(), changedItem.getId()) > 0);
		return update;
	}
	public boolean update(Room changedItem, String col, int val) {//use to set roomType and destination
		return (JTEMP.update("UPDATE room SET " + col + " = ? WHERE id = ?", val, changedItem.getId()) > 0);
	}
	public boolean updateSuper(Room changedItem, boolean isSuper) {
		return (JTEMP.update("UPDATE room SET isSuperRoom = ? WHERE id = ?", isSuper ? 1 : 0, changedItem.getId()) > 0);
	}
	public boolean liteUpdate(Room changedItem) {
		return (JTEMP.update("UPDATE room SET isSuperRoom = ?, capacity = ?, name = ? WHERE id = ?",
				changedItem.isSuperRoom() ? 1 : 0, changedItem.getCapacity(), changedItem.getName(), changedItem.getId()) > 0);
	}
	@Override
	public boolean delete(int delTarget) {
		return (JTEMP.update("DELETE FROM room WHERE id = ?", delTarget) > 0);
	}
	@Override
	public Room select(int selectTarget) {
		Room r = ROOMS.get(selectTarget);
		if(r != null)
		{ return r; }
		r = JTEMP.queryForObject("SELECT * FROM room WHERE id = ?",
				new Object[] {selectTarget}, new RoomMapper());
		if(r != null)
		{ ROOMS.put(r.getId(), r); }
		return r;
	}
	public List<Room> roomsAtDestination(int did){
		return JTEMP.query("SELECT * FROM room WHERE destination = ?",
				new Object[] {did}, new RoomMapper());
	}
	public List<Room> roomsWithRoomTypeAtDestination(int rtid, int did) {
		return JTEMP.query("SELECT * FROM room WHERE roomtype=? AND destination=?", 
				new RoomMapper(), rtid, did);
	}
	public List<Room> showRoom() {		
		return JTEMP.query("select * from room where id > 0", new RoomMapper());
	}	
}

package dao;

import java.util.List;

import mapper.RoomFeatureMapper;
import model.RoomFeature;

public class RoomFeatureDAO implements DAO<RoomFeature> {
	
	@Override
	public boolean insert(RoomFeature newItem) {
		return false;
	}
	public boolean insert(RoomFeature newItem, int rid) {
		int id = JTEMP.queryForObject("SELECT roomFeatureIdSeq.nextVal from dual", Integer.class);
		newItem.setId(id);
		return (JTEMP.update("INSERT INTO roomFeature VALUES(?, ?, ?, ?)",
				newItem.getId(), rid, newItem.getFeature().getId(), newItem.getQuantity()) > 0);
	}
	@Override
	public boolean update(RoomFeature changedItem) {
		return (JTEMP.update("UPDATE roomFeature SET quantity = ? WHERE id = ?",
				changedItem.getQuantity(), changedItem.getId()) > 0);
	}
	@Override
	public boolean delete(int delTarget) {
		return (JTEMP.update("DELETE FROM roomFeature WHERE id = ?", delTarget) > 0);
	}
	public boolean delete(int room, int feature) {
		return (JTEMP.update("DELETE FROM roomFeature WHERE room = ? AND feature = ?", room, feature) > 0);
	}
	@Override
	public RoomFeature select(int selectTarget) {
		return JTEMP.queryForObject("SELECT * FROM roomFeature WHERE id = ?",
				new Object[]{selectTarget}, new RoomFeatureMapper());
	}
	public RoomFeature select(int room, int feature) {
		return JTEMP.queryForObject("SELECT * FROM roomFeature WHERE room = ? AND feature = ?",
				new Object[] {room, feature}, new RoomFeatureMapper());
	}
	public List<RoomFeature> featuresInRoom(int rid){
		return JTEMP.query("SELECT * FROM roomFeature WHERE room = ?",
				new Object[] {rid}, new RoomFeatureMapper());
	}
	public List<RoomFeature> showRoomFeature() {
		List<RoomFeature> list = JTEMP.query("select * from roomFeature", new RoomFeatureMapper());
		
		return list;
	}
}

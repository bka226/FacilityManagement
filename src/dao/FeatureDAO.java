package dao;

import java.util.List;

import mapper.FeatureMapper;
import model.Feature;
import model.Room;
import model.RoomFeature;

public class FeatureDAO implements DAO<Feature> {
	@Override
	public boolean insert(Feature newItem) {
		int id = JTEMP.queryForObject("SELECT featureIdSeq.nextVal FROM dual", Integer.class);
		newItem.setId(id);
        boolean insert = (JTEMP.update("INSERT INTO feature values(?, ?, ?)", newItem.getId(),
        		newItem.getName(), newItem.getImageFilePath()) > 0);
        if(insert) {
			RoomFeatureDAO rfDao = new RoomFeatureDAO();
			RoomDAO rDao = new RoomDAO();
			for(Room room : rDao.showRoom()) {
				RoomFeature rf = new RoomFeature();
				rf.setFeature(newItem);
				rf.setQuantity(0);
				try {
					rfDao.insert(rf, room.getId());
				} catch(Exception e) { }
			}
		}
		return insert;
	}
	@Override
	public boolean update(Feature changedItem) {
		return (JTEMP.update("UPDATE feature SET name = ?, imageFilePath = ? WHERE id = ?",
				changedItem.getName(), changedItem.getImageFilePath(), changedItem.getId()) > 0);
	}
	@Override
	public boolean delete(int delTarget) {
		return (JTEMP.update("DELETE FROM feature WHERE id = ?", delTarget) > 0);
	}
	@Override
	public Feature select(int selectTarget) {
		Feature f = FEATURETYPES.get(selectTarget);
		if(f != null)
		{ return f; }
		f = JTEMP.queryForObject("SELECT * FROM feature WHERE id = ?",
				new Object[] {selectTarget}, new FeatureMapper());
		if(f != null)
		{ FEATURETYPES.put(f.getId(), f); }
		return f;
	}
	public List<Feature> showFeature() {
		return JTEMP.query("select * from feature where id > 0", new FeatureMapper());
	}
}

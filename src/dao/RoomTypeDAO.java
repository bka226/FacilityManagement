package dao;

import java.util.List;

import mapper.RoomTypeMapper;
import model.RoomType;

public class RoomTypeDAO implements DAO<RoomType> {
	
	@Override
	public boolean insert(RoomType newItem) {
		int id = JTEMP.queryForObject("SELECT roomTypeIdSeq.nextVal FROM DUAL", Integer.class);
		newItem.setId(id);
		return (JTEMP.update("INSERT INTO roomType VALUES(?, ?, ?)", newItem.getId(),
				newItem.getRtype(), newItem.getImageFilePath()) > 0);
	}
	@Override
	public boolean update(RoomType changedItem) {
		return (JTEMP.update("UPDATE roomType SET rtype = ?, imageFilePath = ? WHERE id = ?",
				changedItem.getRtype(), changedItem.getImageFilePath(), changedItem.getId()) > 0);
	}
	@Override
	public boolean delete(int delTarget) {
		return (JTEMP.update("DELETE FROM roomType WHERE id = ?", delTarget) > 0);
	}
	@Override
	public RoomType select(int selectTarget) {
		RoomType rt = ROOMTYPES.get(selectTarget);
		if(rt != null)
		{ return rt; }
		rt = JTEMP.queryForObject("SELECT * FROM roomType WHERE id = ?",
				new Object[] {selectTarget}, new RoomTypeMapper());
		if(rt != null)
		{ ROOMTYPES.put(rt.getId(), rt); }
		return rt;
	}
	
	public List<RoomType> showRoomType() {
		return JTEMP.query("select * from roomType where id > 0", new RoomTypeMapper());
	}
}

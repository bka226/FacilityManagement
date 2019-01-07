package dao;

import java.util.List;

import mapper.DestinationMapper;
import model.Destination;

public class DestinationDAO implements DAO<Destination> {

	@Override
	public boolean insert(Destination newItem) {
		int id = JTEMP.queryForObject("SELECT destinationIdSeq.nextVal FROM DUAL", Integer.class);
		newItem.setId(id);
		return (JTEMP.update("INSERT INTO destination VALUES(?, ?, ?, ?, ?)", newItem.getId(),
				newItem.getStreet(), newItem.getCity(), newItem.getState(), newItem.getCountry()) > 0);
	}
	@Override
	public boolean update(Destination changedItem) {
		return (JTEMP.update("UPDATE destination SET street = ?, city = ?, state = ?, country = ? WHERE id = ?",
				changedItem.getStreet(), changedItem.getCity(), changedItem.getState(),
				changedItem.getCountry(), changedItem.getId()) > 0);
	}
	@Override
	public boolean delete(int delTarget) {
		return (JTEMP.update("DELETE FROM destination WHERE id = ?", delTarget) > 0);
	}
	@Override
	public Destination select(int selectTarget) {
		Destination d = LOCATIONS.get(selectTarget);
		if(d != null)
		{ return d; }
		d = JTEMP.queryForObject("SELECT * FROM destination WHERE id = ?",
				new Object[] {selectTarget}, new DestinationMapper());
		if(d != null)
		{ LOCATIONS.put(d.getId(), d); }
		return d;
	}
	public List<Destination> showDestination() {
		return JTEMP.query("select * from destination where id > 0", new DestinationMapper());
	}	

}

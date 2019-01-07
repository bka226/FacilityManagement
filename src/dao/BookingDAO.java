package dao;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.support.rowset.SqlRowSet;

import mapper.BookingMapper;
import model.Booking;

public class BookingDAO implements DAO<Booking> {
	
	@Override
	public boolean insert(Booking newItem) {
		int id = JTEMP.queryForObject("SELECT bookingIdSeq.nextVal FROM DUAL", Integer.class);
		newItem.setId(id);
		return(JTEMP.update("INSERT INTO booking VALUES(?, ?, ?, ?, ?, ?, ?)", newItem.getId(),
				newItem.getEmployee().getId(), newItem.getRoom().getId(), newItem.getStartDate(),
				newItem.getEndDate(), newItem.getStartTime(), newItem.getEndTime()) > 0);
	}
	public boolean liteInsert(Booking newItem) {
		int id = JTEMP.queryForObject("SELECT bookingIdSeq.nextVal FROM DUAL", Integer.class);
		newItem.setId(id);
		return(JTEMP.update("INSERT INTO booking VALUES(?, ?, ?, ?, ?, ?, ?)", newItem.getId(),
				0, 0, newItem.getStartDate(), newItem.getEndDate(), newItem.getStartTime(), newItem.getEndTime()) > 0);
	}
	@Override
	public boolean update(Booking changedItem) {
		return(JTEMP.update("UPDATE booking SET employee = ?, room = ?, startDate = ?, endDate = ?, startTime = ?, endTime = ? WHERE id = ?",
				changedItem.getEmployee().getId(), changedItem.getRoom().getId(), changedItem.getStartDate(), changedItem.getEndDate(),
				changedItem.getStartTime(), changedItem.getEndTime(), changedItem.getId()) > 0);
	}
	public boolean update(Booking changedItem, String col, int val) {
		return(JTEMP.update("UPDATE booking SET " + col + " = ? WHERE id = ?", val, changedItem.getId()) > 0);
	}
	public boolean liteUpdate(Booking changedItem) {
		return(JTEMP.update("UPDATE booking SET startDate = ?, endDate = ?, startTime = ?, endTime = ? WHERE id = ?",
				changedItem.getStartDate(), changedItem.getEndDate(),
				changedItem.getStartTime(), changedItem.getEndTime(), changedItem.getId()) > 0);
	}
	@Override
	public boolean delete(int delTarget) {
		return (JTEMP.update("DELETE FROM booking WHERE id = ?", delTarget) > 0);
	}
	@Override
	public Booking select(int selectTarget) {
		return JTEMP.queryForObject("SELECT * FROM booking WHERE id = ?", new Object[] {selectTarget}, new BookingMapper());
	}
	public List<Booking> showBooking(){		
		List<Booking> list = JTEMP.query("select * from booking", new BookingMapper());

		return list;

	}

	public List<Booking> getLocBooking(){
		List<Booking> list = JTEMP.query("select * from booking where room in (select id from room where destination = 3)", new BookingMapper());
	
		return list;
	}
	
	public List<Booking> getEmployeeBookingsForRoomAtSpecificDateRange(int eid, int rid, Date startDate, Date endDate) {
		return JTEMP.query("SELECT * FROM booking WHERE employee=? AND room=? AND startDate BETWEEN ? AND ?", 
				new BookingMapper(), eid, rid, startDate, endDate);
	}
	
	public List<Booking> getCurrMonthReport(int roomtype){
		LocalDate currentDate = LocalDate.now();
		
		Month m = currentDate.getMonth();
		
		String month = m.toString();
		
		String query ="select * from booking where room in (select id from room where destination = 3 AND roomtype = ?) and upper(substr(to_char(startdate, 'fmMonth'),1,3)) = ?";
		List<Booking> list = JTEMP.query(query,new Object[] {roomtype, month},new BookingMapper());
		return list;
	}
	
	public int getMonthlyReport(int roomtype, String month, int loc) {
		int total;
		String query ="select * from booking where room in (select id from room where destination = ? AND roomtype = ?) and upper(substr(to_char(startdate, 'fmMonth'),1,3)) = ?";

		List<Booking> list = JTEMP.query(query, new Object[] {loc,roomtype, month}, new BookingMapper());
		total = list.size();
		return total;
	}
	
	public int getTotalUsage(String roomname, String month, int loc) {
		int totalUsage=0;

		String queryTimes = "select * from booking where room in (select id from room where destination = ? AND name = ?) and upper(substr(to_char(startdate, 'fmMonth'),1,3)) = ?";

		List<Booking> timesList = JTEMP.query(queryTimes, new Object[] {loc, roomname, month}, new BookingMapper());
		for(Booking b :timesList) {

			int st = b.getStartTime();
			int et = b.getEndTime();
			totalUsage += (et%100+ (et/100)*60) - (st%100+ (st/100)*60);

		}
		return totalUsage;
	}
	
	public boolean hasScheduleConflict(Booking booking) {
		List<Booking> conflictingBookings = JTEMP.query("SELECT * FROM booking "
				+ "WHERE room=? AND (? BETWEEN startdate AND enddate OR ? BETWEEN startdate AND enddate) "
				+ "AND ((? = starttime OR ? < endtime) AND "
				+ "(? = endtime OR ? > starttime))", new BookingMapper(), 
				booking.getRoom().getId(), booking.getStartDate(), 
				booking.getEndDate(), booking.getStartTime(), 
				booking.getStartTime(), booking.getEndTime(), 
				booking.getEndTime());
		
		return !conflictingBookings.isEmpty();
	}
	
	public class TotalBookings
	{
		String roomName,totalMinsBooked,monthlyMins;

		public String getRoomName() {
			return roomName;
		}

		public void setRoomName(String roomName) {
			this.roomName = roomName;
		}

		public String getTotalMinsBooked() {
			return totalMinsBooked;
		}

		public void setTotalMinsBooked(String totalMinsBooked) {
			this.totalMinsBooked = totalMinsBooked;
		}

		public String getMonthlyMins() {
			return monthlyMins;
		}

		public void setMonthlyMins(String monthlyMins) {
			this.monthlyMins = monthlyMins;
		}


		
	}
	public List<TotalBookings> getAllReportsForLocation(int locationId)
	{
		//String data[][];
		String query = "Select name, sum((enddate-startdate)-2*FLOOR((enddate-startdate)/7)-DECODE(SIGN(TO_CHAR(enddate,'D')- TO_CHAR(startdate,'D')),-1,2,0)+DECODE(TO_CHAR(startdate,'D'),7,1,0)- DECODE(TO_CHAR(enddate,'D'),7,1,0))*sum(mod((endtime - starttime),100)+((endtime - starttime)/100)*60) as total_mins, (22*8)*60 as monthly_usage from booking join room on booking.room = room.id where room in (Select id from room where destination = ?) group by name";
		SqlRowSet srs = JTEMP.queryForRowSet(query, locationId);
		
		List<TotalBookings> data = new ArrayList<TotalBookings>();
		while(srs.next())
		{
			TotalBookings tb = new TotalBookings();
			tb.setRoomName(srs.getString(1));
			tb.setTotalMinsBooked(srs.getString(2));
			tb.setMonthlyMins(srs.getString(3));
			data.add(tb);
		}
		return data;
	}
	public List<TotalBookings> getAllMonthlyLocationReports(int locationId, String month){
		String query = "Select name, sum(((enddate-startdate)+1)-2*FLOOR((enddate-startdate)/7)-DECODE(SIGN(TO_CHAR(enddate,'D')- TO_CHAR(startdate,'D')),-1,2,0)+DECODE(TO_CHAR(startdate,'D'),7,1,0)- DECODE(TO_CHAR(enddate,'D'),7,1,0))*sum(mod((endtime - starttime),100)+((endtime - starttime)/100)*60) as total_mins, (22*8)*60 as monthly_usage from booking join room on booking.room = room.id where room in (Select id from room where destination = ?) and upper(substr(to_char(startdate, 'fmMonth'),1,3)) = ? group by name order by Total_Mins desc";
		SqlRowSet srs = JTEMP.queryForRowSet(query, locationId, month);
		List<TotalBookings> data = new ArrayList<TotalBookings>();
		while(srs.next())
		{
			TotalBookings tb = new TotalBookings();
			tb.setRoomName(srs.getString(1));
			tb.setTotalMinsBooked(srs.getString(2));
			tb.setMonthlyMins(srs.getString(3));
			data.add(tb);
		}
		return data;
	}
}

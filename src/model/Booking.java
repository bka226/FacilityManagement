package model;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import view.View;

import com.fasterxml.jackson.annotation.JsonView;

public class Booking {//SELECT * FROM bookings WHERE bid = ?
	@JsonView(View.Public.class)
	private int id;
	@JsonView(View.Public.class)
	private Employee employee;
	@JsonView(View.Public.class)
	private Room room;
	@JsonView(View.Public.class)
	private Date startDate;
	@JsonView(View.Public.class)
	private Date endDate;
	@JsonView(View.Public.class)
	private int startTime;
	@JsonView(View.Public.class)
	private int endTime;
	
	public int getId() {
		return id;
	}
	public void setId(int bid) {
		this.id = bid;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public void setStartDate(String sDate) throws ParseException {
		this.startDate = new Date(new SimpleDateFormat("MM/dd/yyyy").parse(sDate).getTime());
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public void setEndDate(String eDate) throws ParseException {
		this.endDate = new Date(new SimpleDateFormat("MM/dd/yyyy").parse(eDate).getTime());
	}
	public int getStartTime() {
		return startTime;
	}
	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}
	public int getEndTime() {
		return endTime;
	}
	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}
}

package model;

import view.View;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonView;

public class Room {
	@JsonView(View.Public.class)
	private int id;
	@JsonView(View.Public.class)
	private Destination location;
	@JsonView(View.Public.class)
	private RoomType roomType;
	@JsonView(View.Public.class)
	private boolean superRoom;
	@JsonView(View.Public.class)
	private int capacity;
	@JsonView(View.Public.class)
	private String name;
	@JsonView(View.Public.class)
	private List<RoomFeature> features;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Destination getLocation() {
		return location;
	}
	public void setLocation(Destination location) {
		this.location = location;
	}
	public RoomType getRoomType() {
		return roomType;
	}
	public void setRoomType(RoomType type) {
		this.roomType = type;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getName() {
		return name;
	}
	public void setName(String description) {
		this.name = description;
	}
	public List<RoomFeature> getFeatures() {
		return features;
	}
	public void setFeatures(List<RoomFeature> features) {
		this.features = features;
	}
	public boolean isSuperRoom() {
		return superRoom;
	}
	public void setSuperRoom(boolean superRoom) {
		this.superRoom = superRoom;
	}
	
}

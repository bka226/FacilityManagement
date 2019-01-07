package model;

import view.View;

import com.fasterxml.jackson.annotation.JsonView;

public class RoomType{
	@JsonView(View.Public.class)
	private int id;
	@JsonView(View.Public.class)
	private String rtype;
	@JsonView(View.Public.class)
	private String imageFilePath;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRtype() {
		return rtype;
	}
	public void setRtype(String type) {
		this.rtype = type;
	}
	public String getImageFilePath() {
		return imageFilePath;
	}
	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}
}

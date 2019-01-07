package model;

import view.View;

import com.fasterxml.jackson.annotation.JsonView;

public class ForgetPassword {
	@JsonView(View.Public.class)
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}

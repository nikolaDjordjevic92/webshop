package com.webshop.spring.model;

import java.io.Serializable;

public enum UserProfileType implements Serializable{
	USER("USER"), ADMIN("ADMIN");
	
	String userProfileType;

	public String getUserProfileType() {
		return userProfileType;
	}

	public void setUserProfileType(String userProfileType) {
		this.userProfileType = userProfileType;
	}

	private UserProfileType(String userProfileType) {
		this.userProfileType = userProfileType;
	}
	
	
}

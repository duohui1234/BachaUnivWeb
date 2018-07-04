package com.worldfriends.bacha.model;

import lombok.Data;

@Data
public class Password {

	private String userId;
	private String oldPassword;
	private String newPassword;
	 
}

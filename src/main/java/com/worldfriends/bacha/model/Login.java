package com.worldfriends.bacha.model;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class Login {
	@NotEmpty(message = "Fill your Student Number in here")
	private String studentNumber;
	
	@NotEmpty(message = "Fill your Password in here")
	@Length(min=4, message = "minimum is 4 characters")
	private String password;
	
	private String url;
}

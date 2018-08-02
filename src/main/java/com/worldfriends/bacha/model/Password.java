package com.worldfriends.bacha.model;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class Password {
	@NotEmpty(message = "학번을 입력하세요.")
	private String studentNumber;
	
	@NotEmpty(message = "새 비밀번호를 입력하세요.")
	private String newPassword;
	
	@NotEmpty(message = "현재 비밀번호를 입력하세요.")
	private String oldPassword;
}

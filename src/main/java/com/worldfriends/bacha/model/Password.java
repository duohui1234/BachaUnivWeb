package com.worldfriends.bacha.model;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class Password {
	@NotEmpty(message="학번을 입력해주세요.")
	private String studentNumber;
	
	@NotEmpty(message="새 비밀번호를 입력해주세요.")
	private String newPassword;
	
	@NotEmpty(message="현재 비밀번호를 입력해주세요.")
	private String oldPassword;
}

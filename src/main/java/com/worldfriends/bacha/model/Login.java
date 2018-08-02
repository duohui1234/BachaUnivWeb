package com.worldfriends.bacha.model;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class Login {
	@NotEmpty(message = "학번을 입력하세요.")
	private String studentNumber;
	
	@NotEmpty(message = "비밀번호를 입력하세요.")
	@Length(min=4, message = "비밀번호는 최소 네글자입니다.")
	private String password;
	
	private String url;
}

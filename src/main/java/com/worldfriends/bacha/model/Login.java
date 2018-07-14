package com.worldfriends.bacha.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class Login {
	@NotEmpty(message = "아이디를 입력하세요.")
	private String userId;
	
	@NotEmpty(message = "비밀번호를 입력하세요.")
	@Length(min=4, message = "비밀번호는 최소 네글자입니다.")
	private String password;
	
	private String url;
}

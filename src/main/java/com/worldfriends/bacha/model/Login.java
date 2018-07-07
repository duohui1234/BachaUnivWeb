package com.worldfriends.bacha.model;


import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class Login {
	
   @NotEmpty(message="아이디를 입력하세요")
   private String userId;
   
   @NotEmpty(message= "비밀번호를 입력하세요")
   //@Length(min=4, message="최소4자이상입력")
   private String password;
}
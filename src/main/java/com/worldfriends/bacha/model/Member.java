package com.worldfriends.bacha.model;

import java.util.Date;
import javax.validation.constraints.NotEmpty;

import lombok.Data;


@Data
public class Member {

   @NotEmpty(message="아이디를 입력하세요")
   private String userId;
   
   @NotEmpty(message="비밀번호를 입력하세요")
   private String password;
   
   @NotEmpty(message="이름을 입력하세요")
   private String userName;
   
   @NotEmpty(message="핸드폰 번호를 입력하세요")
   private String cellPhone;
   
   @NotEmpty(message="이메일을 입력하세요")
   private String email;
   
   @NotEmpty(message="주소를 입력하세요")
   private String address;
   
   private int grade;
   private Date regDate;
   private Date updateDate;
	
}

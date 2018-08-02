package com.worldfriends.bacha.model;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class Student {
   @NotEmpty(message="학번을 입력하세요.")
   private String studentNumber;
   
   @NotEmpty(message="비밀번호를 입력하세요.")
   private String password;
   
   @NotEmpty(message="이름을 입력하세요.")
   private String studentName;
   
   @NotEmpty(message="전화번호를 입력하세요.")
   private String cellPhone;
   
   @NotEmpty(message="이메일을 입력하세요.")
   private String email;
   
   @NotEmpty(message="이메일을 입력하세요.")
   private String address;
   
 //  @NotEmpty(message="입학일을 입력하세요.")
   private String admissionYear;
   
//   @NotEmpty(message="졸업일을 입력하세요.")
   private String graduationYear;
   
   @NotEmpty(message="전공을 입력하세요.")
   private String major;
   
   @NotEmpty(message="소개를 입력하세요.")
   private String introduction;
   
   
   private int grade;
   private Date regDate;
   private Date updateDate;
}
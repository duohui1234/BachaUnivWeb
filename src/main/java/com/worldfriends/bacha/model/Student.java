package com.worldfriends.bacha.model;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class Student {
	@NotEmpty(message = "Fill your Student Number. in here")
	private String studentNumber;

	@NotEmpty(message = "Fill your Password in here")
	private String password;

	@NotEmpty(message = "Fill your Name in here")
	private String studentName;

	@NotEmpty(message = "Fill your Phone Number in here")
	private String cellPhone;

	@NotEmpty(message = "Fill your Email in here")
	private String email;

	@NotEmpty(message = "Fill your Address in here")
	private String address;

	// @NotEmpty(message="입학일을 입력하세요.")
	private String admissionYear;

	// @NotEmpty(message="졸업일을 입력하세요.")
	private String graduationYear;

	@NotEmpty(message = "Fill your Major in here")
	private String major;

	private String introduction;
	private int grade;
	private Date regDate;
	private Date updateDate;
}

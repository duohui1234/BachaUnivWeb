package com.worldfriends.bacha.model;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class Board {

	private int boardId;

	@NotEmpty(message = "제목을 입력하세요.")
	private String title;
	
	@NotEmpty(message = "내용 입력하세요.")
	private String content;
	
	private String writer;
	
	private int readCnt;
	
	private List<Attachment> attachments;
	
	private Date regDate;
	
	private Date updateDate;
	
}


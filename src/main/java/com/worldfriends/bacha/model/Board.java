package com.worldfriends.bacha.model;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class Board {
	private int boardId;
	@NotEmpty(message = "제목을 입력하세요.")
	private String title;
	private String writer;
	private int readCnt;
	@NotEmpty(message = "내용을 입력하세요.")
	private String content;
	private Date regDate;
	private Date updateDate;
	private List<Attachment> attachments; //첨부 파일 목록
	
	private int replyNum;
	private boolean hasAttachment;
	private String writerName;
	private int seq;
}

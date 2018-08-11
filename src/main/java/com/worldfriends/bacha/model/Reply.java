package com.worldfriends.bacha.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor

public class Reply {
	
 private int replyId;
 private int boardId;
 private int replyLevel;  //0이면 최상위 댓글
 private int parent;
 private String writer;
 private String content;
 private int deleted;   //1이면 삭제된 댓글
 private int likeCnt;
 private Date regDate;
 private Date updateDate;

}

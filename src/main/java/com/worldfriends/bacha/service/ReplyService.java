package com.worldfriends.bacha.service;

import java.util.List;

import com.worldfriends.bacha.model.Reply;

public interface ReplyService {
	Reply create(Reply reply) throws Exception;

	Reply update(Reply reply) throws Exception;

	boolean delete(int replyId) throws Exception;

	Reply getReply(int replyId) throws Exception;

	List<Reply> getList(int boardId) throws Exception;

	boolean like(int replyId) throws Exception;

	int getCount(int boardId) throws Exception;
}

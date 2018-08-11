package com.worldfriends.bacha.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.worldfriends.bacha.dao.AttachmentDao;
import com.worldfriends.bacha.dao.AvatarDao;
import com.worldfriends.bacha.dao.BoardDao;
import com.worldfriends.bacha.dao.ReplyDao;
import com.worldfriends.bacha.dao.StudentDao;
import com.worldfriends.bacha.exception.LoginFailException;
import com.worldfriends.bacha.model.Attachment;
import com.worldfriends.bacha.model.Avatar;
import com.worldfriends.bacha.model.Board;
import com.worldfriends.bacha.model.Login;
import com.worldfriends.bacha.model.Student;
import com.worldfriends.bacha.model.Pagination;
import com.worldfriends.bacha.model.Password;
import com.worldfriends.bacha.model.Reply;
import com.worldfriends.bacha.model.Student;
import com.worldfriends.bacha.util.ImageUtil;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDao dao;
	
	@Override
	public int getCount(int boardId) throws Exception {
		return dao.getCount(boardId);
	}

	@Transactional
	@Override
	public Reply create(Reply reply) throws Exception {
		dao.insert(reply);
		return dao.selectOne(reply.getReplyId());
	}

	@Transactional
	@Override
	public Reply update(Reply reply) throws Exception {
		dao.update(reply);
		return dao.selectOne(reply.getReplyId());
	}

	@Transactional
	@Override
	public boolean delete(int replyId) throws Exception {
		return dao.delete(replyId)==1;
	}

	@Override
	public Reply getReply(int replyId) throws Exception {
		return dao.selectOne(replyId);
	}

	@Override
	public List<Reply> getList(int boardId) throws Exception {
		return dao.selectList(boardId);
	}

	@Transactional
	@Override
	public boolean like(int replyId) throws Exception {
		return dao.increaseLikeCnt(replyId)==1;
	}


}

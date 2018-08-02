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
import com.worldfriends.bacha.dao.StudentDao;
import com.worldfriends.bacha.exception.LoginFailException;
import com.worldfriends.bacha.model.Attachment;
import com.worldfriends.bacha.model.Avatar;
import com.worldfriends.bacha.model.Board;
import com.worldfriends.bacha.model.Login;
import com.worldfriends.bacha.model.Student;
import com.worldfriends.bacha.model.Pagination;
import com.worldfriends.bacha.model.Password;
import com.worldfriends.bacha.model.Student;
import com.worldfriends.bacha.util.ImageUtil;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	@Autowired
	AttachmentDao attachmentDao;

	@Override
	public boolean create(Board board, List<MultipartFile> fileList) throws Exception {
		int result = dao.insert(board);
		upload(board.getBoardId(), fileList);
		return result == 1;
	}

	
	
	public boolean upload(int boardId, List<MultipartFile> fileList) throws Exception {
		for (MultipartFile file : fileList) {
			if (!file.isEmpty()) {
				Attachment attachment = save(boardId, file);
				attachmentDao.insert(attachment);
			}
		}
		return true;
	}

	
	public Attachment save(int boardId, MultipartFile file) throws Exception {
		long fileNo = System.currentTimeMillis();
		String fname = file.getOriginalFilename();
		String newName = fileNo + "_" + fname;
		String path = "c:/temp/upload/" + newName;
		file.transferTo(new File(path));
		return new Attachment(boardId, fname, newName);
	}
	

	@Override
	public boolean update(Board board) throws Exception {
		return dao.update(board) == 1;
	}

	@Override
	public boolean delete(int boardId) throws Exception {
		return dao.delete(boardId) == 1;
	}

	@Override
	public Board getBoard(int boardId) throws Exception {
		return dao.selectOne(boardId);
	}

	@Override
	public Pagination getPagination(int page) throws Exception {
		return new Pagination(page, dao.getCount(), 20, 5);
		// public Pagination(int currentPage, int totalCount, int perPage, int perBlock)
	}

	@Override
	public List<Board> getList(Pagination pagination) throws Exception {
		return dao.selectList(pagination);
	}

	@Override
	public boolean increaseReadCnt(int boardId) throws Exception {
		return dao.increaseReadCnt(boardId) == 1;
	}

	// 첨부파일
	@Override
	public Attachment getAttachment(int attachmentId) throws Exception {
		return attachmentDao.selectOne(attachmentId);
	}

	@Override
	public List<Attachment> getAttachments(int boardId) throws Exception {
		return attachmentDao.selectList(boardId);
	}

	@Override
	public boolean deleteAttachment(int attachmentId) throws Exception {
		return attachmentDao.delete(attachmentId) == 1;
	}

}

package com.worldfriends.bacha.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.worldfriends.bacha.dao.AttachmentDao;
import com.worldfriends.bacha.dao.BoardDao;
import com.worldfriends.bacha.dao.ReplyDao;
import com.worldfriends.bacha.dao.StudentDao;
import com.worldfriends.bacha.model.Attachment;
import com.worldfriends.bacha.model.Board;
import com.worldfriends.bacha.model.Pagination;

@Service
public class BoardServiceImpl implements BoardService {
   @Autowired
   BoardDao dao;
   
   @Autowired
   ReplyDao replyDao;
   
   @Autowired
   AttachmentDao attachmentDao;
   
   @Autowired
   StudentDao studentDao;

   @Transactional
   @Override
   public boolean create(Board board, List<MultipartFile> fileList) throws Exception {
      int result = dao.insert(board); //삽입된 행의 개수 리턴. boardId에 id 값(시퀀스)이 들어옴
      upload(board.getBoardId(), fileList);
      return result == 1;
   }

   public boolean upload(int boardId, List<MultipartFile> fileList) throws Exception{
      for(MultipartFile file:fileList) {
         if(!file.isEmpty()) {
            Attachment attachment = save(boardId, file);
            attachmentDao.insert(attachment);
         }
      }
      return true;
   }
   
   public Attachment save(int boardId, MultipartFile file) throws Exception{
      long fileNo = System.currentTimeMillis();
      String fname = file.getOriginalFilename(); //원본 파일명
      String newName = fileNo+"_"+fname;   //unique한 파일명을 만듦
      String path = "c:/temp/upload/" + newName; 
      file.transferTo(new File(path)); //실제 경로에 파일 저장
      return new Attachment(boardId, fname, newName); 
   }

   @Transactional
   @Override
   public boolean update(Board board, List<MultipartFile> fileList) throws Exception {
      int result = dao.update(board);
      upload(board.getBoardId(), fileList);//첨부파일 삽입   
      return result == 1;
   }

   @Transactional
   @Override
   public boolean delete(int boardId) throws Exception {
      attachmentDao.deleteByBoardId(boardId); //게시물 삭제 시 연결된 첨부파일도 함께 삭제
      int result = dao.delete(boardId);
      return result==1;
   }

   @Override
   public Board getBoard(int boardId) throws Exception {
      Board board = dao.selectOne(boardId);
      List<Attachment> attachments = attachmentDao.selectList(boardId);
      board.setAttachments(attachments);
      return board;
   }

   @Override
   public List<Board> getList(Pagination pagination) throws Exception {
      List<Board> list = dao.selectList(pagination);
      for(Board board:list) {
         board.setReplyNum(replyDao.getCount(board.getBoardId()));
         board.setHasAttachment(attachmentDao.getCount(board.getBoardId())>0?true:false);
         board.setWriterName(studentDao.selectOne(board.getWriter()).getStudentName());
      }
      return list;
   } 
   
   @Override
   public List<Board> getListNotice() throws Exception {
      List<Board> list = dao.selectListUser("admin");
      for(Board board:list) {
         board.setReplyNum(replyDao.getCount(board.getBoardId()));
         board.setHasAttachment(attachmentDao.getCount(board.getBoardId())>0?true:false);
         board.setWriterName(studentDao.selectOne(board.getWriter()).getStudentName());
      }
      return list;
   } 

   @Override
   public Pagination getPagination(int page, int noticeNum) throws Exception {
      return new Pagination(page, dao.getCount(), 15, 10, noticeNum);
   }

   @Transactional
   @Override
   public boolean increaseReadCnt(int boardId) throws Exception {
      return dao.increaseReadCnt(boardId)==1;
   }

   @Override
   public Attachment getAttachment(int attachmentId) throws Exception {
      return attachmentDao.selectOne(attachmentId);
   }

   @Transactional
   @Override
   public boolean deleteAttachment(int attachmentId) throws Exception {
      return attachmentDao.delete(attachmentId)==1;
   }

}
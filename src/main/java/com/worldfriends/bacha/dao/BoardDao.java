package com.worldfriends.bacha.dao;

import java.util.List;

import com.worldfriends.bacha.model.Board;

public interface BoardDao extends BaseDao<Board, Integer> {
   List<Board> selectListUser(String writer) throws Exception;
   int increaseReadCnt(int boardId) throws Exception;                                                    
}
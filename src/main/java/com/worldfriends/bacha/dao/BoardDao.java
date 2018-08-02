package com.worldfriends.bacha.dao;

import com.worldfriends.bacha.model.Board;

public interface BoardDao extends BaseDao<Board, Integer> {

	int increaseReadCnt(int boardId) throws Exception;
	
}

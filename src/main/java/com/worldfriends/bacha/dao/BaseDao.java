package com.worldfriends.bacha.dao;

import java.util.List;
import com.worldfriends.bacha.model.Pagination;

public interface BaseDao<M, K> {
	int getCount() throws Exception;
	List<M> selectList(Pagination pagination) throws Exception;
	int insert(M m) throws Exception;
	M selectOne(K k) throws Exception;
	int update(M m) throws Exception;
	int delete(K k) throws Exception;
}

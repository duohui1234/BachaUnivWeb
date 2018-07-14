package com.worldfriends.bacha.service;

import com.worldfriends.bacha.model.Avatar;
import com.worldfriends.bacha.model.Login;
import com.worldfriends.bacha.model.Member;

public interface MemberService {
	Member checkLogin(Login login) throws Exception;
	boolean create(Member member) throws Exception;
	boolean checkId(String userId) throws Exception;
	boolean update(Member member) throws Exception;
	Member getMember(String userId) throws Exception;
	
	//아바타 처리
	byte[] getAvatar(String userId) throws Exception;
	boolean insertAvatar(Avatar avatar) throws Exception;
	boolean updateAvatar(Avatar avatar) throws Exception;
	boolean deleteAvatar(String userId) throws Exception;
	
}

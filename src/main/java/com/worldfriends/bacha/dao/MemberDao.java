package com.worldfriends.bacha.dao;

import com.worldfriends.bacha.model.Member;
import com.worldfriends.bacha.model.Password;

public interface MemberDao extends BaseDao<Member, String> {
	int changePassword(Password password) throws Exception;
	
	//관리자 호출 메소드
	int updateByAdmin(Member member) throws Exception;
	int changePasswordByAdmin(Password password) throws Exception;
}

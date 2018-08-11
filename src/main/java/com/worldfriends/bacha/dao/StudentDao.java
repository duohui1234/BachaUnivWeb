package com.worldfriends.bacha.dao;

import com.worldfriends.bacha.model.Password;
import com.worldfriends.bacha.model.Student;

public interface StudentDao extends BaseDao<Student, String> {
	
	int changePassword(Password password) throws Exception;
	
	//관리자 호출 메소드
	int updateByAdmin(Student student) throws Exception;
	int changePasswordByAdmin(Password password) throws Exception;
	
}

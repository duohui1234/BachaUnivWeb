package com.worldfriends.bacha.service;

import java.util.List;

import com.worldfriends.bacha.model.Avatar;
import com.worldfriends.bacha.model.Login;
import com.worldfriends.bacha.model.Pagination;
import com.worldfriends.bacha.model.Password;
import com.worldfriends.bacha.model.Student;

public interface StudentService {
	Student checkLogin(Login login) throws Exception;
	boolean create(Student student) throws Exception;
	boolean checkId(String studentNumber) throws Exception;
	boolean update(Student student) throws Exception;
	Student getStudent(String studentNumber) throws Exception;
	
	//아바타 처리
	byte[] getAvatar(String studentNumber) throws Exception;
	boolean insertAvatar(Avatar avatar) throws Exception;
	boolean updateAvatar(Avatar avatar) throws Exception;
	boolean deleteAvatar(String userId) throws Exception;
	
	//비밀번호 수정
	boolean changePassword(Password password) throws Exception;
	
	//졸업생 정보 가져오기
	Pagination getPagination(int page) throws Exception;
	List<Student>getList(Pagination pagination) throws Exception;
	
	
}

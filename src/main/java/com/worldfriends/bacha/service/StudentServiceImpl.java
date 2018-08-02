package com.worldfriends.bacha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.worldfriends.bacha.dao.AvatarDao;
import com.worldfriends.bacha.dao.StudentDao;
import com.worldfriends.bacha.exception.LoginFailException;
import com.worldfriends.bacha.model.Avatar;
import com.worldfriends.bacha.model.Login;
import com.worldfriends.bacha.model.Student;
import com.worldfriends.bacha.model.Pagination;
import com.worldfriends.bacha.model.Password;
import com.worldfriends.bacha.model.Student;
import com.worldfriends.bacha.util.ImageUtil;


@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentDao dao;
	
	@Autowired
	AvatarDao avatarDao;
	
	@Override
	public Student checkLogin(Login login) throws Exception {
		Student student = dao.selectOne(login.getStudentNumber());
		
		if(student == null)
			throw new LoginFailException("존재하지 않는 학번입니다.");
		else if(!student.getPassword().equals(login.getPassword()))
			throw new LoginFailException("비밀번호가 틀렸습니다.");

		return student;
	}

	@Transactional //예외 없으면 commit, 예외 있으면 rollback
	@Override
	public boolean create(Student student) throws Exception {
		int result = dao.insert(student);
		return result == 1;	//1을 반환하면 성공한 것
	}
	
	@Override
	public boolean checkId(String studentNumber)throws Exception{
		Student student = dao.selectOne(studentNumber);
		return student != null;
	}

	@Override
	public byte[] getAvatar(String studentNumber) throws Exception {
		Avatar avatar = avatarDao.selectOne(studentNumber);
		if(avatar == null) { //아바타 이미지가 없는 경우
			//익명 사용자를 미리 하나 등록해둠
			avatar = avatarDao.selectOne("anonymous");
		}
		return avatar.getImage();
	}

	@Transactional //예외 없으면 commit, 예외 있으면 rollback
	@Override
	public boolean insertAvatar(Avatar avatar) throws Exception {
		//이미지 크기 변경해서 넣어줌
		avatar.setImage(ImageUtil.makeThumb(avatar.getImage()));
		return avatarDao.insert(avatar) == 1;
	}

	@Transactional //예외 없으면 commit, 예외 있으면 rollback
	@Override
	public boolean updateAvatar(Avatar avatar) throws Exception {
		avatar.setImage(ImageUtil.makeThumb(avatar.getImage()));
		if(avatarDao.update(avatar) == 1) { //기존 아바타가 있을 경우
			return true;
		}else { //기존 아바타가 없을 경우
			return avatarDao.insert(avatar) == 1; 
		}
	}

	@Transactional //예외 없으면 commit, 예외 있으면 rollback
	@Override
	public boolean deleteAvatar(String studentNumber) throws Exception {
		return avatarDao.delete(studentNumber) == 1;
	}

	@Override
	public boolean update(Student Student) throws Exception {
		return dao.update(Student) == 1;
	}

	@Override
	public Student getStudent(String studentNumber) throws Exception {
		return dao.selectOne(studentNumber);
	}

	@Override
	public boolean changePassword(Password password) throws Exception {
		return dao.changePassword(password) == 1;
	}

	@Override
	public Pagination getPagination(int page) throws Exception {
		
		return new Pagination(page,dao.getCount(),6,5);
		
	}

	@Override
	public List<Student> getList(Pagination pagination) throws Exception {
		
		return dao.selectList(pagination);
		
	}

}
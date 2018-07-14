package com.worldfriends.bacha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.worldfriends.bacha.dao.AvatarDao;
import com.worldfriends.bacha.dao.MemberDao;
import com.worldfriends.bacha.exception.LoginFailException;
import com.worldfriends.bacha.model.Avatar;
import com.worldfriends.bacha.model.Login;
import com.worldfriends.bacha.model.Member;
import com.worldfriends.bacha.util.ImageUtil;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Autowired
	AvatarDao avatarDao;
	
	@Override
	public Member checkLogin(Login login) throws Exception {
		Member member = dao.selectOne(login.getUserId());
		
		if(member == null)
			throw new LoginFailException("존재하지 않는 아이디입니다.");
		else if(!member.getPassword().equals(login.getPassword()))
			throw new LoginFailException("비밀번호가 틀렸습니다.");

		return member;
	}

	@Transactional //예외 없으면 commit, 예외 있으면 rollback
	@Override
	public boolean create(Member member) throws Exception {
		int result = dao.insert(member);
		return result == 1;	//1을 반환하면 성공한 것
	}
	
	@Override
	public boolean checkId(String userId)throws Exception{
		Member member = dao.selectOne(userId);
		return member != null;
	}

	@Override
	public byte[] getAvatar(String userId) throws Exception {
		Avatar avatar = avatarDao.selectOne(userId);
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
	public boolean deleteAvatar(String userId) throws Exception {
		return avatarDao.delete(userId) == 1;
	}

	@Override
	public boolean update(Member member) throws Exception {
		return dao.update(member) == 1;
	}

	@Override
	public Member getMember(String userId) throws Exception {
		return dao.selectOne(userId);
	}

}

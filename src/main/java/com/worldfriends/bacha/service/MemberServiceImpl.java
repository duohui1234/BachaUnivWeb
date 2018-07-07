package com.worldfriends.bacha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.worldfriends.bacha.dao.MemberDao;
import com.worldfriends.bacha.exeption.LoginFailException;
import com.worldfriends.bacha.model.Login;
import com.worldfriends.bacha.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Override
	public Member checkLogin(Login login) throws Exception {
		
		    Member member = dao.selectOne(login.getUserId());
	
			if(member!=null && member.getPassword().equals(login.getPassword()))
			    return member;	

			
			String msg = "";
			if(member==null) {
				msg = "존재하지 않는 ID입니다"; 

			}else if(!member.getPassword().equals(login.getPassword())) {
				msg = "비밀번호가 틀립니다";
			}
             
			throw new LoginFailException(msg);
 
	}

	@Transactional  //예외없으면 commit 아니면 rollback, crud기능에 다씀
	@Override
	public boolean create(Member member) throws Exception {
		
		int result = dao.insert(member);
		return result == 1; 
	}

	@Override
	public boolean checkId(String userId) throws Exception {
		
		Member member = dao.selectOne(userId);
		return member!=null;
		
	}
	
	

	
	
	
	
}

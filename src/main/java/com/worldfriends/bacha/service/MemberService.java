package com.worldfriends.bacha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worldfriends.bacha.dao.MemberDao;
import com.worldfriends.bacha.model.Login;
import com.worldfriends.bacha.model.Member;


public interface MemberService {
	

   
   Member checkLogin(Login login) throws Exception;
   boolean create(Member member) throws Exception;
   boolean checkId(String userId) throws Exception;	
	
	
	
}

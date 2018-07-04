package com.worldfriends.bacha.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.worldfriends.bacha.model.Login;

@Controller
public class AccountController {

	 //로그인 폼 페이지 
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "account/login";
    }
	
	//실제 로그인 기능
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginSubmit(Login login) {
		
		System.out.println(login.getUserId());
		return  "account/login_success";
	}
	
	
}

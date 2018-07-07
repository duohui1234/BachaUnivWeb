package com.worldfriends.bacha.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.worldfriends.bacha.exeption.LoginFailException;
import com.worldfriends.bacha.model.Login;
import com.worldfriends.bacha.model.Member;
import com.worldfriends.bacha.service.MemberService;

@Controller
public class AccountController {

	@Autowired
	MemberService service;

	@ExceptionHandler(LoginFailException.class)
	public String handlerLoginError(HttpServletRequest request, Exception e) {
		request.setAttribute("login", new Login());
		request.setAttribute("error", e.getMessage());
		return "account/login";
	}
	
	 //데이터베이스 예외 발생시 호출됨
	   @ExceptionHandler({SQLException.class, DataAccessException.class})
	   public String handleError() {
	      return "error/database_error"; //에러 화면 호출
	   }
	   

	// 로그인 폼 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(Login login) {
		return "account/login";
	}

	// 실제 로그인 기능
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginSubmit(@Valid Login login, BindingResult result, HttpSession session) throws Exception {

		if (result.hasErrors()) {
			return "account/login";
		}

		Member member = service.checkLogin(login);

		session.setAttribute("USER", member);

		return "redirect:/login_success";	
		
     }
	
	@RequestMapping(value = "/login_success", method = RequestMethod.GET)
	public String login_success() {
		
		return "account/login_success";
	}
	
	

	// 회원가입 폼 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm(Member member) {
		return "account/join";
	}

	// 실제 회원가입 기능
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinSubmit(@Valid Member member, BindingResult result, RedirectAttributes ra) throws Exception {
		//redirect할 경우에는 request객체가 새로 생성되기 때문에 값 전달하려면 session에 보관하던가 해야하는데
		//한번만 필요한 정보같은 경우에 redirectattributes에 저장하면 그 값을 session에 저장하고 리다이렉트 되었을때 한번만 그 값을 가져다 쓰고 session에서 삭제

		if (result.hasErrors()) {
			return "account/join";
		}

		ra.addFlashAttribute("member", member);

		service.create(member);
		
		
		return "redirect:/join_success";
		
	}
	
	//위에 있는 컨트롤러 메서드에서 redirect할때 account/join_success 경로로 가도록 설정
	@RequestMapping(value = "/join_success", method = RequestMethod.GET)
	public String join_success() {
		return "account/join_success";
	}
	
	
	//회원가입시 아이디 중복체크 기능
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public boolean idCheck(@RequestParam("userId") String userId) {
		try {
			return service.checkId(userId); //아이디가 있으면 true리턴
			
		}catch(Exception e) {
			e.printStackTrace();
			return true;
		}
	}

}

package com.worldfriends.bacha.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.worldfriends.bacha.model.Avatar;
import com.worldfriends.bacha.model.Member;
import com.worldfriends.bacha.service.MemberService;

@Controller
@RequestMapping("/member")
public class ProfileController {

	@Autowired
	MemberService service; //AccountController의 service와 같은 객체(빈은 싱글톤이므로)
	
	public void setMember(HttpSession session, Model model) throws Exception {
		Member m = (Member)session.getAttribute("USER");
		Member member = service.getMember(m.getUserId()); //등록일, 수정일 정보 얻기 위해 다시 검색
		model.addAttribute("member", member);
	}
	
	//회원정보 뷰로 이동
	@RequestMapping("/profile")
	public void profile(HttpSession session, Model model) throws Exception {
		setMember(session, model);
		//return 생략시 url로 이동
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public void editForm(HttpSession session, Model model) throws Exception {
		setMember(session, model);
		//return 생략시 url로 이동
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String editSubmit(HttpSession session,
						     @Valid Member member,
						     BindingResult result,
						     @RequestParam("avatar") MultipartFile mFile) throws Exception {
		
		//유효성 검사 실패시 정보 수정 페이지로 돌아감
		if(result.hasErrors())return "member/edit";
		
		//수정 실패시 정보 수정 페이지로 돌아감
		if(!service.update(member)) {
			result.reject("updateFail", "비밀번호가 일치하지 않습니다.");
			return "member/edit";
		}
		
		//아바타 저장
		if(mFile != null && !mFile.isEmpty()) {
			Avatar avatar = new Avatar(member.getUserId(), mFile.getBytes());
			service.updateAvatar(avatar);
		}

		session.setAttribute("USER", member); //수정된 정보로 덮어씀
		
		return "redirect:/member/profile";
	}
	
	//아바타 이미지 내보내기
	@RequestMapping(value="/avatar", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getAvatar( //ResponseEntity: HttpResponse를 추상화해주는 객체
			@RequestParam("userId") String userId) throws Exception {
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG); //mime type 지정
		// body, header, 응답코드
		return new ResponseEntity<byte[]>(service.getAvatar(userId), headers, HttpStatus.OK);
	}
	
	//데이터베이스 예외 발생시 호출됨
	@ExceptionHandler({SQLException.class, DataAccessException.class})
	public String handleError() {
		return "error/database_error"; //에러 화면 호출
	}
}

package com.worldfriends.bacha.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.worldfriends.bacha.model.Avatar;
import com.worldfriends.bacha.model.Board;
import com.worldfriends.bacha.model.Login;
import com.worldfriends.bacha.model.Pagination;
import com.worldfriends.bacha.model.Student;
import com.worldfriends.bacha.service.BoardService;
import com.worldfriends.bacha.service.StudentService;
import com.worldfriends.bacha.exception.LoginFailException;

import com.worldfriends.bacha.controller.BoardController;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService service;

	@RequestMapping("/list")
	public void list(@RequestParam(value = "page", defaultValue = "1") int page, Model model) throws Exception {

		Pagination pagination = service.getPagination(page);
		List<Board> list = service.getList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("list", list);

	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void createForm(Board board) throws Exception {

	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createSubmit(@Valid Board board, BindingResult result) throws Exception {
		// 유효성 검사 결과 실패
		if (result.hasErrors())
			return "board/create";
		if (!service.create(board,fileList))
			return "board/create";
		return "redirect:list";
	}

	
	@RequestMapping(value = "/view/{boardId}", method = RequestMethod.GET)
	public String view(@PathVariable("boardId") int boardId, Model model) throws Exception {
		// 유효성 검사 결과 실패
		service.increaseReadCnt(boardId);
		Board board  = service.getBoard(boardId);
		model.addAttribute("board",board);
		return "board/view";
	}
	
	@RequestMapping(value = "/edit/{boardId}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("boardId") int boardId, Model model) throws Exception {
		// 유효성 검사 결과 실패
	
		Board board  = service.getBoard(boardId);
		model.addAttribute("board",board);
		return "board/edit";
		
	}
	
	@RequestMapping(value = "/edit/{boardId}", method = RequestMethod.POST)
	public String edit(@PathVariable("boardId") int boardId, @Valid Board board, BindingResult result,Model model) throws Exception {
		// 유효성 검사 결과 실패
	
		if (result.hasErrors())
			return "board/edit";
		
		if (!service.update(board))
			return "board/edit";

		return "redirect:/board/view/"+boardId;
		
	}
	
	
	
	@RequestMapping(value = "/delete/{boardId}", method = RequestMethod.GET)
	public String delete(@PathVariable("boardId") int boardId, HttpSession session) throws Exception {
	
		Board board = service.getBoard(boardId);
		Student user = (Student) session.getAttribute("USER");
	    if(user == null || !user.getStudentNumber().equals(board.getWriter())) {
	    	return "redirect:/board/list";
	    }
		
		if (!service.delete(boardId)) {
			return "board/view"+boardId;
		}
			
		return "redirect:/board/list";
		
	}
	
	
	
	
	// 데이터베이스 예외 발생시 호출됨
	@ExceptionHandler({ SQLException.class, DataAccessException.class })
	public String handleError() {
		return "error/database_error"; // 에러 화면 호출
	}

}

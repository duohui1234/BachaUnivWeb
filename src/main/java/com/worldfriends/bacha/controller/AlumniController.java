package com.worldfriends.bacha.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.worldfriends.bacha.model.Pagination;
import com.worldfriends.bacha.model.Student;
import com.worldfriends.bacha.service.StudentService;

@Controller
@RequestMapping("/alumni")
public class AlumniController {

	@Autowired
	StudentService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@RequestParam(value="page", defaultValue = "1") int page, Model model) throws Exception{
         
		Pagination pagination = service.getPagination(page);
		List<Student> list = service.getList(pagination);
		
		model.addAttribute("pagination",pagination);
		model.addAttribute("list", list);
		
	
	}

	
	@RequestMapping(value = "/contact_form", method = RequestMethod.GET)
	public void contactForm(@RequestParam("email") String email, Model model) throws Exception{    
	  model.addAttribute("email", email);
	}

	
}

package com.worldfriends.bacha.interceptor;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.worldfriends.bacha.model.Board;
import com.worldfriends.bacha.model.Student;
import com.worldfriends.bacha.service.BoardService;
import com.worldfriends.bacha.service.StudentService;

@Component
public class BoardInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	ServletContext context; // applicaton 객체
	
	@Autowired
	BoardService boardService;

	@Override
	public boolean preHandle(HttpServletRequest request, 
							HttpServletResponse response, Object handler)
			throws Exception {
		Map pathVariables = (Map) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
		String boardIdStr = (String) pathVariables.get("boardId");
		int boardId = Integer.parseInt(boardIdStr);
		Board board = boardService.getBoard(boardId);
		HttpSession session = request.getSession();
		Student user = (Student) session.getAttribute("USER");
		if (user==null || !board.getWriter().equals(user.getStudentNumber())) { //현재 유저가 게시물의 작성자가 아닐 경우
			response.sendRedirect(context.getContextPath() + "/board/list"); //목록으로 이동하게
		}
		return super.preHandle(request, response, handler);
	}

}

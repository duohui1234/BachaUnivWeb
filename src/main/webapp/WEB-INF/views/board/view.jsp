<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<div class="container">
  <h3>게시글 보기</h3>
  <hr/>
  <p>작성자: ${board.writer}</p>
  <p>제목: ${board.title}</p>
  <p>내용: ${board.content}</p>
  <p>조회수: ${board.readCnt}</p>
  <p>등록일: ${board.regDate}</p>
  <p>수정일: ${board.updateDate}</p>
  
  
<div class="text-center">
      <c:if test="${USER.studentNumber==board.writer}">
         <a href="../edit/${board.boardId}" class="mr-4"> <i
            class="fa fa-edit mr-2"></i> 수정
         </a>
         <a href="../delete/${board.boardId}" class="mr-4"> <i
            class="fa fa-trash mr-2"></i> 삭제
         </a>
      </c:if>
      <a href="../list"> <i class="fa fa-undo mr-2"></i>
         돌아가기
      </a>
   </div>

  
</div>
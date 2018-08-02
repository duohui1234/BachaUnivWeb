<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">

<div class="text-right">
<span>총 ${pagination.totalCount}건 /</span>
<c:if test="${not empty USER}">
 <a href="create"><i class="fa fa-plus"></i> 추가</a>
</c:if>
</div>

<table class="table table-hover mx-auto text-center">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">조회수</th>
      <th scope="col">등록일</th>
    </tr>
  </thead>
  <tbody>
   
   <c:forEach var="board" items="${list}">
    <tr>
      <th scope="row">${board.boardId}</th>
      <td><a href="view/${board.boardId}">${board.title}</a></td>
      <td>${board.writer}</td>
      <td>${board.readCnt}</td>
      <td>${board.regDate}</td>
    </tr>
   </c:forEach>
    
  </tbody>
</table>

</div>

<!-- page block -->
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
<iot:pagination pagination="${pagination}" link="list"></iot:pagination>
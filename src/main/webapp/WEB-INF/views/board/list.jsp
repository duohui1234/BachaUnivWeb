<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container">
   <div class="py-5 px-5">
      <h4>Board</h4>
      <hr class="style10" style="width: 100%">
      <table class="table table-sm">
         <thead class="thead-light">
            <tr>
               <th class="pl-5" scope="col" style="width: 10%">No</th>
               <th scope="col" style="width: 55%">Title</th>
               <th scope="col" style="width: 5%">File</th>
               <th scope="col" style="width: 10%">Writer</th>
               <th scope="col" style="width: 10%">Date</th>
               <th class="pl-2" scope="col" style="width: 10%">VC</th>
            </tr>
         </thead>
         <tbody>
            <!-- Notice -->
            <c:forEach var="board" items="${listNotice}">
               <tr class="table-notice">
                  <td class="pl-5"><span class="badge badge-info">Notice</span></td>
                  <td><a href="view/${board.boardId}" class="text-dark">${board.title}
                        <span style="color: rgb(238, 55, 51);" class="font-weight-bold">
                           (${board.replyNum})</span>
                  </a></td>
                  <td><c:choose>
                        <c:when test="${board.hasAttachment}">
                           <i class="fa fa-file"></i>
                        </c:when>
                        <c:when test="${board.hasAttachment}">
                           <i></i>
                        </c:when>
                     </c:choose></td>
                  <td>${board.writerName}</td>
                  <td><fmt:formatDate value="${board.regDate}"
                        pattern="yyyy-MM-dd" /></td>
                  <td class="pl-2">${board.readCnt}</td>
               </tr>
            </c:forEach>
            <!-- Not Notice -->
            <c:forEach var="board" items="${list}">
               <tr>
                  <td class="pl-5">${board.boardId}</td>
                  <td><a href="view/${board.boardId}" class="text-dark">${board.title}
                        <span style="color: rgb(238, 55, 51);" class="font-weight-bold">
                           (${board.replyNum})</span>
                  </a></td>
                  <td><c:choose>
                        <c:when test="${board.hasAttachment}">
                           <i class="fa fa-file"></i>
                        </c:when>
                        <c:when test="${board.hasAttachment}">
                           <i></i>
                        </c:when>
                     </c:choose></td>
                  <td>${board.writerName}</td>
                  <td><fmt:formatDate value="${board.regDate}"
                        pattern="yyyy-MM-dd" /></td>
                  <td class="pl-2">${board.readCnt}</td>
               </tr>
            </c:forEach>
         </tbody>
      </table>

      <!-- write button -->
      <div class="text-right">
         <c:if test="${not empty USER}">
            <a href="create" type="button" class="btn btn-indigo"><i
               class="fa fa-edit"></i>&nbsp;&nbsp;Write</a>
         </c:if>
      </div>
      <!-- page block -->
      <%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
      <iot:pagination pagination="${pagination}" link="list"></iot:pagination>
   </div>
</div>
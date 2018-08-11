<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<h1>edit form</h1>

<div id="edit-form" class="edit-form" >

	<!-- action 태그 생략시 현재 url로 전송, form:form에서 method 생략시 post 방식 -->
	<form:form commandName="board" enctype="multipart/form-data">


		<div>
			<label for="writer">작성자: ${board.writer}</label>
			<form:hidden path="writer" />
		</div>


		<div class="md-form">
			<label for="content">TITLE</label>
			<form:input path="title" class="form-control" value="${board.title }" />
			<form:errors path="title" element="div" cssClass="error" />
		</div>


		<div class="row mt-3">
			<div class="col-md-2">첨부파일</div>
			<div class="col-md-10">
				<c:forEach var="file" items="${board.attachments}">
					<div>
					  <i class="fa fa-file"></i> ${file.fileName}
				      <a href="#" class="attachment" data-target="${file.attachmentId}"> <i class="fa fa-trash"></i></a>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="mt-3 mb-3">
			<label>파일첨부</label> 
			<input type="file" name="files" multiple="multiple">
		</div>

		<form:textarea path="content" />
		<div class="text-center mt-3">
			<button type="submit" class="btn btn-primary btn-md">
				<i class="fa fa-check mr-2"></i> 확인
			</button>
			<a href="../list" class="btn btn-primary btn-md"> <i
				class="fa fa-undo mr-2"></i> 목록보기
			</a>
		</div>
	</form:form>

</div>

<script>
   $(document).ready(function(){
	   
	   $('.attachment').click(function(e){
		  
		   e.preventDefault();
		   var attachmentId = $(this).data('target');
		   var parent = $(this).parent();
		   
		   $.ajax({
			   url: '../delete_attachment/'+attachmentId,
			   type: 'delete',
			   success:  function(result){
				   if(result){
					   console.log(this);
					   parent.remove();
				   }else{
					   alert('삭제 실패');
				   }
			   }
		   });
		   
	   });
	   
   });
</script>

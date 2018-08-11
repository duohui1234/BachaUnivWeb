<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<h1>create form</h1>


<!-- action 태그 생략시 현재 url로 전송, form:form에서 method 생략시 post 방식 -->
<form:form commandName="board" enctype="multipart/form-data">




	<div class="md-form">
		<label for="title">TITLE</label>
		<form:input path="title" class="form-control" />
		<form:errors path="title" element="div" cssClass="error" />
	</div>

	<div>
		<label for="writer">작성자: ${USER.studentNumber}</label>
		<form:hidden path="writer" value="${USER.studentNumber}" />
	</div>


	<div class="md-form">
		<label for="content">CONTENT</label>
		<form:input path="content" class="form-control" />
		<form:errors path="content" element="div" cssClass="error" />
	</div>

	<div class="mt-4">
		<label for="files">파일첨부</label> <br/>
		<input type="file" name="files" id="files"  multiple="multiple">
	</div>

	<div class="md-form text-center">
		<button type="submit" class="btn btn-primary">
			<i class="fa fa-check"></i>등록
		</button>

		<a href="../board/list" class="btn btn-primary btn-md"> <i
			class="fa fa-undo mr-2"></i> 돌아가기
		</a>
	</div>

</form:form>


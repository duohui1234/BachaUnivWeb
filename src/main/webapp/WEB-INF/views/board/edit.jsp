<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<h1>edit form</h1>

<div id="edit-form" class="edit-form">

	<!-- action 태그 생략시 현재 url로 전송, form:form에서 method 생략시 post 방식 -->
	<form:form commandName="board">


		<div>
			<label for="writer">작성자: ${board.writer}</label>
			<form:hidden path="writer" />
		</div>


		<div class="md-form">
			<label for="content">TITLE</label>
			<form:input path="title" class="form-control" value="${board.title }" />
			<form:errors path="title" element="div" cssClass="error" />
		</div>

		<div class="md-form">
			<label for="content">CONTENT</label>
			<form:input path="content" class="form-control"
				value="${board.content }" />
			<form:errors path="content" element="div" cssClass="error" />
		</div>


		<div class="md-form text-center">
			<button type="submit" class="btn btn-primary">
				<i class="fa fa-check"></i>수정하기
			</button>

			<a href="../list" class="btn btn-primary btn-md"> <i
				class="fa fa-undo mr-2"></i> 돌아가기
			</a>
		</div>



	</form:form>

</div>

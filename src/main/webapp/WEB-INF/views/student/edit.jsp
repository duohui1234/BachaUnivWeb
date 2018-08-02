<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div id="edit-form" class="edit-form">
	<h2 class="pb-4">
		<i class="fa fa-user-plus"></i> 정보 수정
	</h2>
	<form:form commandName="student" enctype="multipart/form-data">
		<div>
			<label for="studentNumber">학번: ${student.studentNumber}</label>
			<form:hidden path="studentNumber" />
		</div>

		<div>
			<label for="studentName">이름: ${student.studentName }</label>
			<form:hidden path="studentName" class="form-control" />
		</div>

		<div class="mb-3 mt-3">
			<img src="avatar?studentNumber=${student.studentNumber}"> <label
				for="avatar">프로필 이미지</label> <input type="file" name="avatar" />
		</div>

		<div class="md-form">
			<label for="password">비밀번호</label>
			<form:password path="password" class="form-control" />
			<form:errors path="password" cssClass="error" />
		</div>

		<div class="md-form">
			<label for="cellPhone">전화번호</label>
			<form:input path="cellPhone" class="form-control" />
			<form:errors path="cellPhone" />
		</div>

		<div class="md-form">
			<label for="email">email</label>
			<form:input path="email" class="form-control" />
			<form:errors path="email" />
		</div>

		<div class="md-form mb-3">
			<label for="address">주소</label>
			<form:input path="address" class="form-control" />
			<form:errors path="address" />
		</div>


		<div class="mb-3">
			<label for="major">전공: ${student.major}</label>
			<form:hidden path="major" class="form-control" />
		</div>

		<div class="mb-3">
			<label for="admissionYear">입학년도: ${student.admissionYear}</label>
			<form:hidden path="admissionYear" class="form-control" />
		</div>

		<div class="mb-3">
			<label for=graduationYear>졸업년도: ${student.graduationYear}</label>
			<form:hidden path="graduationYear" class="form-control" />
		</div>

		<div class="md-form">
			<label for="introduction">자기소개</label>
			<form:input path="introduction" class="form-control" />
		</div>


		<form:errors cssClass="error" element="div" />

		<div class="md-form text-center">
			<button type="submit" class="btn btn-primary">
				<i class="fa fa-check"></i>확인
			</button>
		</div>
	</form:form>
</div>
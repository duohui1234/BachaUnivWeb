<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div id="edit-form"
	class="edit-form col-lg-6 col-md-8 col-sm-10 mx-auto border border-light rounded"
	style="padding: 40px !important; box-shadow: 5px 5px 6px -6px #777;">
	<p class="h4 mb-4 text-center">Edit Info</p>
	<form:form commandName="student" enctype="multipart/form-data">


		<h6 class="grey-text">STUDENT NUMBER</h6>
		<p>${student.studentNumber}</p>
		<form:hidden path="studentNumber" />
		<hr />

		<h6 class="grey-text">STUDENT NAME</h6>
		<p>${student.studentName}</p>
		<form:hidden path="studentName" />
		<hr />

		<h6 class="grey-text">PROFILE IMAGE</h6>
		<div>
			<img src="avatar?studentNumber=${student.studentNumber}"> 
			<input type="file" name="avatar" />
		</div>
        <hr/>

		<div class="md-form mb-4">
			<label for="password">PASSWORD</label>
			<form:password path="password" class="form-control" />
			<form:errors path="password" cssClass="error" />
		</div>

		<div class="md-form mb-4">
			<label for="cellPhone">PHONE NUMBER</label>
			<form:input path="cellPhone" class="form-control" />
			<form:errors path="cellPhone" />
		</div>

		<div class="md-form mb-4">
			<label for="email">EMAIL</label>
			<form:input path="email" class="form-control" />
			<form:errors path="email" />
		</div>

		<div class="md-form mb-4">
			<label for="address">ADDRESS</label>
			<form:input path="address" class="form-control" />
			<form:errors path="address" />
		</div>


		<h6 class="grey-text">MAJOR</h6>
		<p>${student.major}</p>
		<form:hidden path="major" />
		<hr />

		<h6 class="grey-text">ADMISSION YEAR</h6>
		<p>${student.admissionYear}</p>
		<form:hidden path="admissionYear" />
		<hr />
		
		<h6 class="grey-text">GRADUATION YEAR</h6>
		<p>${student.graduationYear}</p>
		<form:hidden path="graduationYear" />
		<hr />		


		<div class="md-form">
			<label for="introduction">INTRODUCTION</label>
			<form:input path="introduction" class="form-control" />
		</div>


		<form:errors cssClass="error" element="div" />

		<div class="md-form text-center">
			<button type="submit" class="btn" style="background-color: #ee3733;">
				<i class="fa fa-check"></i> submit
			</button>
		</div>
	</form:form>
</div>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/" var="root" />

<div class="py-5">
<div class="col-lg-6 col-md-8 col-sm-10 mx-auto border border-light rounded" 
style="padding:20px!important; box-shadow: 5px 5px 6px -6px #777;">
<p class="h4 mb-4 text-center">Student Info</p>
<br/>
<div class="row">
	<div class="col-md-4 md-mb-50">Student Number</div>
	<div class="col-md-8">${student.studentNumber}</div>
</div>
<hr/>

<div class="row">
	<div class="col-md-4 mb-100">Name</div>
	<div class="col-md-8">${student.studentName}</div>
</div>
<hr/>

<div class="row">
	<div class="col-md-4">Profile Image</div>
	<div class="col-md-8">
		<img src="avatar?studentNumber=${student.studentNumber}">
	</div>
</div>
<hr/>

<div class="row">
	<div class="col-md-4">Phone Number</div>
	<div class="col-md-8">${student.cellPhone}</div>
</div>
<hr/>

<div class="row">
	<div class="col-md-4">Email</div>
	<div class="col-md-8">${student.email}</div>
</div>
<hr/>

<div class="row">
	<div class="col-md-4">Address</div>
	<div class="col-md-8">${student.address}</div>
</div>
<hr/>

<div class="row">
	<div class="col-md-4">Major</div>
	<div class="col-md-8">${student.major}</div>
</div>
<hr/>

<div class="row">
	<div class="col-md-4">Admission Year</div>
	<div class="col-md-8">${student.admissionYear}</div>
</div>

<div class="row">
	<div class="col-md-4">Graduation Year</div>
	<div class="col-md-8">${student.graduationYear}</div>
</div>
<hr/>


<div class="row">
	<div class="col-md-4">Introduction</div>
	<div class="col-md-8">${student.introduction}</div>
</div>
<hr/>


<div class="row">
	<div class="col-md-4">Register Date</div>
	<div class="col-md-8">
		<fmt:formatDate value="${student.regDate}" pattern="yyyy-MM-dd"/>
	</div>
</div>

<div class="row">
	<div class="col-md-4">Update Date</div>
	<div class="col-md-8">
		<fmt:formatDate value="${student.updateDate}" pattern="yyyy-MM-dd"/>
	</div>
</div>

<br/><br/>
<div class="row">
    <div class="col-sm-12 form-group text-center">
	<a href="${root}student/changepassword" class="btn" style="background-color: #ee3733;"><i class="fa fa-lock"></i> Change password</a>
	<a href="${root}student/edit" class="btn" style="background-color: #ee3733;"><i class="fa fa-edit"></i> Edit Info</a>
	</div>
</div>
</div>
</div>
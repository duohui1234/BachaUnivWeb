<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/" var="root" />

<h2><i class="fa fa-user"></i> 회원 정보</h2>
<hr>
<div class="row">
	<div class="col-md-2">학번</div>
	<div class="col-md-10">${student.studentNumber}</div>
</div>

<div class="row">
	<div class="col-md-2">이름</div>
	<div class="col-md-10">${student.studentName}</div>
</div>
<div class="row">
	<div class="col-md-2">프로필 사진</div>
	<div class="col-md-10">
		<img src="avatar?studentNumber=${student.studentNumber}">
	</div>
</div>
<div class="row">
	<div class="col-md-2">전화번호</div>
	<div class="col-md-10">${student.cellPhone}</div>
</div>

<div class="row">
	<div class="col-md-2">email</div>
	<div class="col-md-10">${student.email}</div>
</div>

<div class="row">
	<div class="col-md-2">주소</div>
	<div class="col-md-10">${student.address}</div>
</div>

<div class="row">
	<div class="col-md-2">전공</div>
	<div class="col-md-10">${student.major}</div>
</div>

<div class="row">
	<div class="col-md-2">입학년도</div>
	<div class="col-md-10">${student.admissionYear}</div>
</div>

<div class="row">
	<div class="col-md-2">졸업년도</div>
	<div class="col-md-10">${student.graduationYear}</div>
</div>

<div class="row">
	<div class="col-md-2">자기소개</div>
	<div class="col-md-10">${student.introduction}</div>
</div>

<div class="row">
	<div class="col-md-2">가입일</div>
	<div class="col-md-10">
		<fmt:formatDate value="${student.regDate}" pattern="yyyy-MM-dd"/>
	</div>
</div>

<div class="row">
	<div class="col-md-2">수정일</div>
	<div class="col-md-10">
		<fmt:formatDate value="${student.updateDate}" pattern="yyyy-MM-dd"/>
	</div>
</div>
<div class="row">
	<a href="${root}student/changepassword" class="btn btn-primary"><i class="fa fa-lock"></i> 비밀번호</a>
	<a href="${root}student/edit" class="btn btn-primary"><i class="fa fa-edit"></i> 정보수정</a>
</div>
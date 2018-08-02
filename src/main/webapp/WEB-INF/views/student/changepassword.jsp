<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
 
 $(function(){
	 
   var check_pw = false; //비밀번호 일치여부 확인
		
	 
   $('#change-form').submit(function(e){
	   
	   if(!check_pw){
			$('#newPassword').focus();
			e.preventDefault();	//이벤트의 기본 동작 금지
		}
	   
   });	
   
   
 //비밀번호 입력시 비밀번호 일치여부 확인
	$('#newPassword').keyup(function(e) {
		checkPW();
	});
	$('#newPassword2').keyup(function(e) {
		checkPW();
	});
	
	function checkPW(){
		// 비밀번호 일치 검사
		var password1 = $(':password').eq(1).val(); //':' jquery input selector
		var password2 = $(':password').eq(2).val();

		if(password1 == '' || password2 == ''){
			check_pw = false;
		}
		
		if(password1 != password2) {
			$('#check-pw-message').addClass('error')
				.html('비밀번호가 일치하지 않습니다.');
			check_pw = false;
		}else{
			$('#check-pw-message').removeClass('error')
				.html('');
			check_pw = true;
		}
	}
	
	
	$('#oldPassword').keyup(function(e) {
		$('.oldPassword').html('');
	});
   
	
	
 });
 
 
 
 
</script>



<div id="edit-form" class="edit-form">
	<h2 class="pb-4"><i class="fa fa-user-plus"></i> 정보 수정</h2>
	<form:form commandName="password" id="change-form">
		

		
		<input type="hidden" name= "studentNumber" value = "${USER.studentNumber}" />
		
		
		<div class="md-form">
			<label for="oldPassword">현재 비밀번호</label>
			<form:password path="oldPassword" class="form-control"/>
			<form:errors path="oldPassword" cssClass="error oldPassword"/>
		</div>
		
	
		<div class="md-form">
			<label for="newPassword">새 비밀번호</label>
			<form:password path="newPassword" class="form-control"/>
			<form:errors path="newPassword" cssClass="error newPassword"/>
		</div>
		
		<div class="md-form">
	        <label for="newPassword2">새 비밀번호</label>
			<input type="password" name="newPassword2" id="newPassword2"  class="form-control" required/>
			<span id="check-pw-message"></span>
		</div>
		
		
	   <form:errors cssClass="error" element="div"/>

		<div class="md-form text-center">
			<button type="submit" class="btn btn-primary">
				<i class="fa fa-check"></i>확인
			</button>
		</div>
		
	</form:form>
</div>
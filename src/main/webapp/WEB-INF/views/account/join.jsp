<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
$(function() {	//페이지가 로드되면 실행
	var check_id = false; //id 중복확인
	var check_pw = false; //비밀번호 일치여부 확인
	
	//제출 버튼 클릭시 id 중복과 비밀번호 일치 여부에 따라 동작
 	$('#join-form').submit(function(e) {
		if(!check_id) {
			$('#userId').focus();
			e.preventDefault();	//이벤트의 기본 동작 금지
		}else if(!check_pw){
			$('#password').focus();
			e.preventDefault();	//이벤트의 기본 동작 금지
		}
	}); 
	
	//비밀번호 입력시 비밀번호 일치여부 확인
	$('#password').keyup(function(e) {
		checkPW();
	});
	$('#password2').keyup(function(e) {
		checkPW();
	});
	
	function checkPW(){
		// 비밀번호 일치 검사
		var password1 = $(':password').eq(0).val(); //':' jquery input selector
		var password2 = $(':password').eq(1).val();

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

	//id 포커스 해제시 id 중복 여부 확인
	$('#userId').focusout(function(e) {
		// 중복체크
		var userId = $('#userId').val();
		
		if(userId == ''){
			check_id = false;
		}
		
		$.get('idcheck' , {userId : userId} ,function(data) {
			//console.log(data)
			if(!data) {	// 사용자 ID 중복 아님
				$('#check-id-message').removeClass('error')
					.html('');
				check_id = true;
			
			} else {	// 사용자 ID 중복
				$('#check-id-message').addClass('error')
					.html('이미 사용 중인 ID 입니다.');		
				check_id = false;
			}
		});
	});
	
	//form:errors 메세지 제어
	$('#userName').keyup(function(e) {
		$('.userName').html('');
	});
	$('#email').keyup(function(e) {
		$('.email').html('');
	});
	$('#cellPhone').keyup(function(e) {
		$('.cellPhone').html('');
	});
	
});
</script>
<body>
	<!-- action 태그 생략시 현재 url로 전송, form:form에서 method 생략시 post 방식 -->
	<form:form commandName="member" id="join-form" enctype="multipart/form-data"> 
		<div>
			사용자 ID : 
			<form:input path="userId"/>	<!-- name과 id가 userId로 정해짐 -->
			<form:errors path="userId" element="div" cssClass="error"/> <!-- BindingResult 결과메시지 출력 -->
			<span id="check-id-message"></span>
		</div>
		<p>
			이름 : 
			<form:input path="userName"/>
			<form:errors path="userName" element="div" cssClass="error userName"/>
		</p>
		<p>
			비밀번호 : 
			<form:password path="password"/>
			<form:errors path="password" element="div" cssClass="error"/>
		</p>
		<div>
			비밀번호 확인 : 
			<input type="password" name="password2" id="password2" required/>
			<span id="check-pw-message"></span>
		</div>
		<p>
			이메일 : 
			<form:input path="email"/>
			<form:errors path="email" element="div" cssClass="error email"/>
		</p>
		<p>
			전화번호 : 
			<form:input path="cellPhone"/>
			<form:errors path="cellPhone" element="div" cssClass="error cellPhone"/>
		</p>
		<p>
			주소 : 
			<form:input path="address"/>
			<form:errors path="address" element="div" cssClass="error"/>
		</p>
		<div>
			프로필 사진:
			<input type="file" name="avatar" accept="image/*"/>
		</div>

		<button type="submit">
			회원가입
		</button>
	</form:form>
	<p class="error">${error}</p>
</body>

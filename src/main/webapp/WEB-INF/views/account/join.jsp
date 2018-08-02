<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
	$(function() { //페이지가 로드되면 실행
		var check_id = false; //id 중복확인
		var check_pw = false; //비밀번호 일치여부 확인

		//제출 버튼 클릭시 id 중복과 비밀번호 일치 여부에 따라 동작
		$('#join-form').submit(function(e) {
			if (!check_id) {
				$('#studentNumber').focus();
				e.preventDefault(); //이벤트의 기본 동작 금지
			} else if (!check_pw) {
				$('#password').focus();
				e.preventDefault(); //이벤트의 기본 동작 금지
			}
		});

		//비밀번호 입력시 비밀번호 일치여부 확인
		$('#password').keyup(function(e) {
			checkPW();
		});
		$('#password2').keyup(function(e) {
			checkPW();
		});

		function checkPW() {
			// 비밀번호 일치 검사
			var password1 = $(':password').eq(0).val(); //':' jquery input selector
			var password2 = $(':password').eq(1).val();

			if (password1 == '' || password2 == '') {
				check_pw = false;
			}

			if (password1 != password2) {
				$('#check-pw-message').addClass('error').html(
						'비밀번호가 일치하지 않습니다.');
				check_pw = false;
			} else {
				$('#check-pw-message').removeClass('error').html('');
				check_pw = true;
			}
		}

		//id 포커스 해제시 id 중복 여부 확인
		$('#studentNumber').focusout(
				function(e) {
					// 중복체크
					var studentNumber = $('#studentNumber').val();

					if (studentNumber == '') {
						check_id = false;
					}

					$.get('idcheck', {
						studentNumber : studentNumber
					}, function(data) {
						//console.log(data)
						if (!data) { // 사용자 ID 중복 아님
							$('#check-id-message').removeClass('error')
									.html('');
							check_id = true;

						} else { // 사용자 ID 중복
							$('#check-id-message').addClass('error').html(
									'이미 사용 중인 ID 입니다.');
							check_id = false;
						}
					});
				});

		//form:errors 메세지 제어
		$('#studentName').keyup(function(e) {
			$('.studentName').html('');
		});
		$('#email').keyup(function(e) {
			$('.email').html('');
		});
		$('#cellPhone').keyup(function(e) {
			$('.cellPhone').html('');
		});
		$('#admissionYear').keyup(function(e) {
			$('.admissionYear').html('');
		});
		$('#graduationYear').keyup(function(e) {
			$('.graduationYear').html('');
		});
		$('#major').keyup(function(e) {
			$('.major').html('');
		});

		

	});
</script>
<body>
	<!-- action 태그 생략시 현재 url로 전송, form:form에서 method 생략시 post 방식 -->
	<form:form commandName="student" id="join-form"
		enctype="multipart/form-data">
		<p>
			학번 :
			<form:input path="studentNumber" />
			<!-- name과 id가 userId로 정해짐 -->
			<form:errors path="studentNumber" element="div" cssClass="error" />
			<!-- BindingResult 결과메시지 출력 -->
			<span id="check-id-message"></span>
		</p>
		
		<p>
			이름 :
			<form:input path="studentName" />
			<form:errors path="studentName" element="div"
				cssClass="error studentName" />
		</p>
		
		<p>
			비밀번호 :
			<form:password path="password" />
			<form:errors path="password" element="div" cssClass="error" />
		</p>
		
		<p>
			비밀번호 확인 : <input type="password" name="password2" id="password2" required /> 
			<span id="check-pw-message"></span>
		</p>
		
		<p>
			이메일 :
			<form:input path="email" />
			<form:errors path="email" element="div" cssClass="error email" />
		</p>
		
		<p>
			전화번호 :
			<form:input path="cellPhone" />
			<form:errors path="cellPhone" element="div"
				cssClass="error cellPhone" />
		</p>
		
		<p>
			주소 :
			<form:input path="address" />
			<form:errors path="address" element="div" cssClass="error" />
		</p>

		<p>
			입학년도:
			<form:input type="date" path="admissionYear" required="true" />
			<form:errors path="admissionYear" element="div" cssClass="error" />
		</p>


		<p>
			졸업년도:
			<form:input type="date" path="graduationYear" required="true"/>
			<form:errors path="graduationYear" element="div" cssClass="error" />
		</p>

		<p>
			전공 :
			<form:input path="major" />
			<form:errors path="major" element="div" cssClass="error major" />
		</p>
		
		<p>
			자기소개 :
			<form:input path="introduction" />

		</p>


		<div>
			프로필 사진: <input type="file" name="avatar" accept="image/*" />
		</div>

		<button class="mt-3" type="submit">회원가입</button>
	</form:form>
	<p class="error">${error}</p>
</body>

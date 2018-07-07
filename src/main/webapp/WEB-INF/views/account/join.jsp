<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
    
   


<body>
<h1>회원가입</h1>

 <!-- action 태그 생략시 현재 url로 전송, form:form에서 method 생략시 post 방식 -->
   <form:form commandName="member" id="join-form"> 
      <p>
         <!-- name과 id가 userId로 정해짐 -->
         <div>
           ID :  <form:input path="userId"/> 
           <a id="check-btn" class="btn-floating btn btn-primary btn-sm ">중복 체크</a>
           <span id="check-message"></span>
         </div>
         <form:errors path="userId" element="div" cssClass="error"/> <!-- BindingResult 결과메시지 출력 -->
      </p>
      <p>
         PW : 
         <form:password path="password"/>
         <form:errors path="password" element="div" cssClass="error"/>
      </p>
      <p>
         PW2 : 
         <input type="password" name="password2" id="password2" required>
      </p>
      <p>
         NAME : 
         <form:input path="userName"/>
         <form:errors path="userName" element="div" cssClass="error"/>
      </p>
      <p>
         PHONE NUMBER : 
         <form:input path="cellPhone"/>
         <form:errors path="cellPhone" element="div" cssClass="error"/>
      </p>
      <p>
         EMAIL : 
         <form:input path="email"/>
         <form:errors path="email" element="div" cssClass="error"/>
      </p>
      <p>
         ADDRESS : 
         <form:input path="address"/>
         <form:errors path="address" element="div" cssClass="error"/>
      </p>

      

      <button type="submit" disabled>회원가입
      </button>

   </form:form>

<!--  
<script>
  
     $('button[type="submit"]').on("click",function(e){
    	 
    	   var pw1 = $('input[id="password"]').val();
    	   var pw2 = $('input[id="password2"]').val();
    	 
    	 if(pw1!=pw2){
    		 e.preventDefault();
    		 alert("비밀번호 불일치");
    		 $('input[id="password"]').focus();
    		 $('input[id="password"]').val("");
    		 $('input[id="password2"]').val("");
    	 }
     });
     
</script>  
-->


  

<script>

$('#check-btn').click(function(e){
	var userId =  $('#userId').val();
	if(userId==''){
		alert('아이디를 입력하세요');
		return
	}
	

	$.get('idcheck',{userId:userId},function(data){
	    console.log(data);
	    if(!data) {   // 사용자 ID 중복 아님
	        $(':submit').prop('disabled', false);
	        $('#check-message').removeClass('error')
	           .html('사용 가능한 ID 입니다.');
	     
	     } else {   // 사용자 ID 중복
	        $(':submit').prop('disabled', true);
	        $('#check-message').addClass('error')
	           .html('이미 사용 중인 ID 입니다.');            
	     }
	});
	
});



$(function() {   //페이지가 로드되면 실행
   $('#join-form').submit(function(e) {
      // 비밀번호 일치 검사
      var password1 = $(':password').eq(0).val(); //':' jquery input selector
      var password2 = $(':password').eq(1).val();

      if(password1 != password2) {
         alert('비밀번호가 일치하지 않습니다.')
         $(':password').eq(0).focus(); //커서
         e.preventDefault();   
      }
   });
});
</script>

</body>
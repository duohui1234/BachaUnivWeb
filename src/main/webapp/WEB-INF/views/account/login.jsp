<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<body>
  <div class = "login-form">
     <c:if test="${not empty login.url }">  <!-- URL이 있으면 다른 페이지에서 강제 이동된 것 -->
        <div class= "mt-4 mb-4">
          <h1>로그인이 필요한 서비스입니다</h1>
        </div>
     </c:if>
  </div>
  
  
  
	<!-- action 태그 생략시 현재 url로 전송, form:form에서 method 생략시 post 방식 -->
	<form:form commandName="login"> 
	    
	    <form:hidden path="url" />
	
		<p>
			id : 
			<form:input path="studentNumber"/>	<!-- name과 id가 userId로 정해짐 -->
			<form:errors path="studentNumber" element="div" cssClass="error"/> <!-- BindingResult 결과메시지 출력 -->
		</p>
		<p>
			pw : 
			<form:password path="password"/>
			<form:errors path="password" element="div" cssClass="error"/>
		</p>

		<button type="submit">
			로그인
		</button>
	</form:form>
	<p class="error">${error}</p>
</body>
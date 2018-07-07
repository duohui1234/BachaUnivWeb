<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
 
   
   <!-- action 태그 생략시 현재 url로 전송, form:form에서 method 생략시 post 방식 -->
   <form:form commandName="login"> 
      <p>
         id : 
         <form:input path="userId"/>   <!-- name과 id가 userId로 정해짐 -->
         <form:errors path="userId" element="div" cssClass="error"/> <!-- BindingResult 결과메시지 출력 -->
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
   
    <p>${error }</p>

   
   
</body>
</html>
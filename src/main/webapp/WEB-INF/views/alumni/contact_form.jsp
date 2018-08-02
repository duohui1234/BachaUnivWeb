<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<div class="container-fluid bg-grey">
  <h2 class="text-center">CONTACT</h2>
  <p class="text-center">${email}</p>
  
  <div class="row mt-30">
    <form class="col-sm-9 mx-auto" action="mailto:${email}" method="post" enctype="text/plain">
      
      
      <div class="row">
      
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
      
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
        
      </div>
      
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
      
      <div class="row">
        <div class="col-sm-12 form-group text-center">
          <a class="btn btn-default " href="javascript:history.back()">Cancel</a>
          <button class="btn btn-default " type="submit">Send</button>
        </div>
      </div> 
    
    </form>
    
    
  </div>
</div>




<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Section: Team v.3 -->
<section class="team-section my-5">

   <!-- Section heading -->
   <h2 class="h1-responsive font-weight-bold text-center my-5">Our
      alumni</h2>

   <!-- Grid row-->
   <div class="row text-center text-md-left">
      <c:forEach var="alumnus" items="${list}">
         <!-- Grid column -->
         <div
            class="col-lg-6 col-md-12 mb-5 d-md-flex justify-content-center">
            <div class=" mb-md-0 mb-4">
               <img src="${root}student/avatar?studentNumber=${alumnus.studentNumber}"
                  class="rounded z-depth-1 avatar-midium">
            </div>
            <div class="mx-4">
               <h4 class="font-weight-bold mb-3">${alumnus.studentName}</h4>
               <h6 class="font-weight-bold grey-text mb-3">${alumnus.studentNumber}</h6>
               <p class="grey-text">${alumnus.introduction}</p>
               <!-- Facebook-->
               <a class="p-2 fa-lg fb-ic"> <i class="fa fa-facebook blue-text"> </i>
               </a>
               <!-- Twitter -->
               <a class="p-2 fa-lg tw-ic"> <i class="fa fa-twitter"> </i>
               </a>
               <!--instagram -->
               <a class="p-2 fa-lg dribbble-ic"> <i class="fa fa-instagram"></i>
               </a>
               <!--email -->
               <a class="p-2 fa-lg dribbble-ic" href="contact_form?email=${alumnus.email}"> <i class="fa fa-envelope"></i>
               </a>
            </div>
         </div>
         <!-- Grid column -->
      </c:forEach>
   </div>

</section>
<!-- Section: Team v.3 -->

<!-- page block -->
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
<iot:pagination pagination="${pagination}" link="list"></iot:pagination>